#include <ArduinoBLE.h>
#include <WiFi.h>
#include "time.h"
#include <LilyGo_AMOLED.h>
#include <LV_Helper.h>
#include <SPI.h>
#include <SHT21.h>
#include <Wire.h>
#include <Adafruit_BMP280.h>
#include "ui.h"
#include <Firebase_ESP_Client.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include "spo2_algorithm.h"
#include <MAX30105.h>
#define SDA_PIN 6
#define SCL_PIN 7


#define MAX_BRIGHTNESS 255

uint32_t irBuffer[100];   
uint32_t redBuffer[100];  

int32_t bufferLength;
int32_t spo2; 
float spO2=0;       
int8_t validSPO2;   
int32_t heartRate;   
int8_t validHeartRate; 

#define USER_EMAIL "ramatobbo5@gmail.com"
#define USER_PASSWORD "123456"
#define API_KEY "AIzaSyCqJimjIOBDadUORCQm73ttFvVSIvDuVog"
#define DATABASE_URL "https://trackpro-f6d1d-default-rtdb.firebaseio.com/"
bool isCounting = false;
 bool  HeartRateSensorActivated=false;

const char* ssid = "Galaxy";
const char* password = "";
float caloriesPerStep=0.04;
const char* ntpServer = "pool.ntp.org";
const long  gmtOffset_sec = 3600*2;
const int   daylightOffset_sec = 3600;
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;
Adafruit_MPU6050 mpu;
const float stepThreshold = 2.5; 
int stepCount = 0;
float lastX = 0;
float lastY = 0;
float lastZ = 0;
bool stepDetected = false;

float weight = 60; 



float caloriesBurned=0;
SHT21 sht;
Adafruit_BMP280 bmp;
MAX30105 particleSensor;
int number = 100;

BLEService sensorService("00000000-5EC4-4083-81CD-A10B8D5CF6EC");
BLECharacteristic timeCharacteristic("00000001-5EC4-4083-81CD-A10B8D5CF6EC", BLERead | BLENotify, 20, false);
BLECharacteristic tempCharacteristic("00000002-5EC4-4083-81CD-A10B8D5CF6EC", BLERead | BLENotify, 20, false);
BLECharacteristic humidityCharacteristic("00000003-5EC4-4083-81CD-A10B8D5CF6EC", BLERead | BLENotify, 20, false);
BLECharacteristic pressureCharacteristic("00000004-5EC4-4083-81CD-A10B8D5CF6EC", BLERead | BLENotify, 20, false);
BLECharacteristic heartRateCharacteristic("00000005-5EC4-4083-81CD-A10B8D5CF6EC", BLERead | BLENotify, 20, false);
BLECharacteristic StepsCharacteristic("00000006-5EC4-4083-81CD-A10B8D5CF6EC", BLERead | BLENotify | BLEWrite, 20, false);

#define RATE_SIZE 4  
byte rates[RATE_SIZE];     
byte rateSpot = 0;
long lastBeat = 0;
float beatsPerMinute;
int beatAvg; 
String message="";
unsigned long previousMillisUI = 0;
unsigned long previousMillisFirebase = 0;
unsigned long previousMillisTime = 0;
unsigned long previousMillisFetchStepsCounting=0;
unsigned long previousMillisReset = 0;
const long resetInterval = 5000;

float temp1, humidity, pressure;

LilyGo_Class amoled;
void printLocalTime()
{
  struct tm timeinfo;
  if(!getLocalTime(&timeinfo)){
    Serial.println("Failed to obtain time");
    return;
  }
  Serial.println(&timeinfo, "%A, %B %d %Y %H:%M:%S");
}


void setup() {
  Serial.begin(115200);

  bool rslt = amoled.begin();
  if (!rslt) {
    while (1) {
      Serial.println("The board model cannot be detected, please raise the Core Debug Level to an error");
      delay(1000);
    }
  }

  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print("Connecting...");
  }
  Serial.println("Connected to WiFi!");

  configTime(gmtOffset_sec, daylightOffset_sec, ntpServer);
   printLocalTime();

  if (!Wire.begin()) {
    while (1) {
      Serial.println(F("I2C communication failed. Please check wiring/power."));
      delay(1000);
    }
  }

  if (!bmp.begin(0x76)) {
    Serial.println("Could not find a valid BMP280 sensor, check wiring!");
    while (1);
  }

  if (!particleSensor.begin(Wire)) {
    while (1) {
      Serial.println(F("MAX3010x was not found. Please check wiring/power."));
      delay(1000);
    }
  }

  config.api_key = API_KEY;
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;
  config.database_url = DATABASE_URL;

  Firebase.reconnectNetwork(true);
  fbdo.setBSSLBufferSize(4096, 1024);
  fbdo.setResponseSize(2048);

  Firebase.begin(&config, &auth);

  particleSensor.setup();
   Wire.begin(SDA_PIN, SCL_PIN);
particleSensor.begin();
  if (!BLE.begin()) {
    Serial.println("BLE initialization failed!");
    while (1);
  }

  BLE.setLocalName("TrackPro SmartWatch");
  BLE.setDeviceName("TrackPro SmartWatch");

  sensorService.addCharacteristic(timeCharacteristic);
  sensorService.addCharacteristic(tempCharacteristic);
  sensorService.addCharacteristic(humidityCharacteristic);
  sensorService.addCharacteristic(pressureCharacteristic);
  sensorService.addCharacteristic(heartRateCharacteristic);
  sensorService.addCharacteristic(StepsCharacteristic);

  BLE.addService(sensorService);

  timeCharacteristic.writeValue("00:00");
  tempCharacteristic.writeValue("0.0");
  humidityCharacteristic.writeValue("0.0");
  pressureCharacteristic.writeValue("0.0");
  heartRateCharacteristic.writeValue("0");
  StepsCharacteristic.writeValue("0");
    if (!mpu.begin()) {
    Serial.println("Failed to find MPU6050 chip");
    while (1) {
      delay(10);
    }
  }

  mpu.setAccelerometerRange(MPU6050_RANGE_16_G);
  mpu.setGyroRange(MPU6050_RANGE_250_DEG);
  mpu.setFilterBandwidth(MPU6050_BAND_21_HZ);
  byte ledBrightness = 60; // Options: 0=Off to 255=50mA
  byte sampleAverage = 4; // Options: 1, 2, 4, 8, 16, 32
  byte ledMode = 2; // Options: 1 = Red only, 2 = Red + IR, 3 = Red + IR + Green
  byte sampleRate = 100; // Options: 50, 100, 200, 400, 800, 1000, 1600, 3200
  int pulseWidth = 411; // Options: 69, 118, 215, 411
  int adcRange = 4096; // Options: 2048, 4096, 8192, 16384

  particleSensor.setup(ledBrightness, sampleAverage, ledMode, sampleRate, pulseWidth, adcRange);
  BLE.advertise();
  Serial.println("Bluetooth device active, waiting for connections...");
  
  beginLvglHelper(amoled);
  ui_init();
   struct tm timeinfo;
  if (!getLocalTime(&timeinfo)) {
    Serial.println("Failed to obtain time");
  }
    char timeStr[10];
  strftime(timeStr, sizeof(timeStr), "%I:%M", &timeinfo); 
  
  char dateStr[20];
  strftime(dateStr, sizeof(dateStr), "%B %d,", &timeinfo); 

  char dayOfWeek[10];
  strftime(dayOfWeek, sizeof(dayOfWeek), "%A", &timeinfo); 
  
 
  lv_label_set_text(ui_Label1, timeStr);         
  lv_label_set_text(ui_Label3, dateStr);       
  lv_label_set_text(ui_Label4, dayOfWeek);     
}


void loop() {
  static unsigned long previousMillis = 0;
  BLEDevice central = BLE.central();

  if (central) {
    if(central.connected()) {
    
      
      long currentMillis = millis();
      while(currentMillis - previousMillis >= 900) {
        previousMillis = currentMillis;
        updateSensorData();
        updateSensors();
      }

      // fetchUserWeight();
    }
  } else {
    BLE.advertise();
  }
// fetchStartStepsCounting();
 /// updateSensorData();
   if(HeartRateSensorActivated){
  handleHeartRate();
  // delay(1000);
  //  measureOxygen();
  //  delay(6000);
  long redValue = particleSensor.getRed(); // Get red LED value
long irValue = particleSensor.getIR();  // Get infrared LED value

if (redValue > 0 && irValue > 0) {
 
    
   spO2 = calculateSpO2(redValue, irValue);
    Serial.print("Oxygen Saturation: ");
    Serial.println(spO2);
} else {
    Serial.println("No valid readings for SpO2.");
}

   }
 
  
         if (millis() - previousMillisFetchStepsCounting >= 5000) {
        previousMillisFetchStepsCounting = millis();
        fetchStartStepsCounting();  
        fetchHeartRateActivation();
      }
             if (millis() - previousMillisFetchStepsCounting >= 60000) {
        previousMillisFetchStepsCounting = millis();
           bufferLength = 100; 

    
    for (byte i = 0; i < bufferLength; i++) {
        unsigned long startTime = millis();
      
        while (millis() - startTime < 200) { 
            if (particleSensor.available()) {
                redBuffer[i] = particleSensor.getRed();
                irBuffer[i] = particleSensor.getIR();
                particleSensor.nextSample(); 
                break; 
            }
            particleSensor.check(); 
        }
    }

   
    maxim_heart_rate_and_oxygen_saturation(irBuffer, bufferLength, redBuffer, &spo2, &validSPO2, &heartRate, &validHeartRate);

   
    while (1) {
     
        for (byte i = 25; i < 100; i++) {
            redBuffer[i - 25] = redBuffer[i];
            irBuffer[i - 25] = irBuffer[i];
        }

        for (byte i = 75; i < 100; i++) {
            unsigned long startTime = millis();
     
            while (millis() - startTime < 200) {  
                if (particleSensor.available()) {
                    redBuffer[i] = particleSensor.getRed();
                    irBuffer[i] = particleSensor.getIR();
                    particleSensor.nextSample();
                    break; 
                }
                particleSensor.check();
            }

       
            Serial.print(F("red="));
            Serial.print(redBuffer[i], DEC);
            Serial.print(F(", ir="));
            Serial.print(irBuffer[i], DEC);

          
          
                Serial.print(F(", SPO2="));
                Serial.print(spo2, DEC);
          
            Serial.println(); 
        }

       
        maxim_heart_rate_and_oxygen_saturation(irBuffer, bufferLength, redBuffer, &spo2, &validSPO2, &heartRate, &validHeartRate);
    }
      }
  if(isCounting){
         sensors_event_t a, g, temp;
  mpu.getEvent(&a, &g, &temp); 
  

  float ax = a.acceleration.x;
  float ay = a.acceleration.y;
  float az = a.acceleration.z;


  float diffX = abs(ax - lastX);
  float diffY = abs(ay - lastY);
  float diffZ = abs(az - lastZ);

 
  float magnitude = sqrt(diffX * diffX + diffY * diffY + diffZ * diffZ);

  
  if (magnitude > stepThreshold && !stepDetected) {
    stepCount++;
    stepDetected = true;
    Serial.print("Step detected! Total Steps: ");
    Serial.println(stepCount);

  
     caloriesBurned = stepCount * caloriesPerStep;
    Serial.print("Calories Burned: ");
    Serial.println(caloriesBurned, 4); 
  }

  
  if (magnitude < (stepThreshold / 2)) {
    stepDetected = false;
  }

  Serial.print("Steps: ");
  Serial.println(stepCount);


  lastX = ax;
  lastY = ay;
  lastZ = az;}else{
            if (millis() - previousMillisReset >= resetInterval) {
            previousMillisReset = millis();
            stepCount = 0;
            caloriesBurned = 0;
            String stepsPath = "/sensors/steps"; 
            String caloriesPath = "/sensors/calories";  

            Firebase.RTDB.setFloat(&fbdo, stepsPath.c_str(), stepCount);
            Firebase.RTDB.setFloat(&fbdo, caloriesPath.c_str(), caloriesBurned);
        }}
 

  if (millis() - previousMillisUI >= 100) {
    previousMillisUI = millis();
    lv_task_handler();
  }

  if (millis() - previousMillisTime >= 1000) {
    previousMillisTime = millis();
    updateUIWithTime();

  }


  if (millis() - previousMillisFirebase >= 15000) {
    previousMillisFirebase = millis();
    uploadDataToFirebase();
  }
       char tempStr[8], humidityStr[8], pressureStr[8], heartRateStr[8],stepsStr[8],caloriesStr[8],spo2Str[8];
    dtostrf(stepCount, 4, 2, stepsStr);
     dtostrf(spO2, 4, 2, spo2Str);

  dtostrf(caloriesBurned, 4, 2, caloriesStr);

  dtostrf(temp1, 4, 2, tempStr);
  strcat(tempStr, " C");
  dtostrf(humidity, 4, 2, humidityStr);
  strcat(humidityStr, " %");
  dtostrf(pressure, 4, 2, pressureStr);
  strcat(pressureStr, " hpa");
   lv_label_set_text(ui_Label24, pressureStr);
  dtostrf(beatAvg/3, 4, 2, heartRateStr);

       lv_label_set_text(ui_Label230,stepsStr);
        lv_label_set_text(ui_Label6, stepsStr);
            lv_label_set_text(ui_Label231,  caloriesStr);
  lv_label_set_text(ui_Label26, tempStr);
  lv_label_set_text(ui_Label25, humidityStr);
  lv_label_set_text(ui_Label7, heartRateStr);
  lv_label_set_text(ui_Label199, heartRateStr);

   lv_label_set_text( ui_Label8, spo2Str);
  
 

}

void fetchStartStepsCounting() {
   String path = "/sensors/startStepsCounting";  
  if (Firebase.RTDB.getBool(&fbdo, path.c_str())) { 
    bool startCounting = fbdo.boolData();  

    
  
    isCounting = startCounting;
  }
}

void fetchUserWeight() {
  String path = "/sensors/weight";
  
  if (Firebase.RTDB.getInt(&fbdo, path.c_str())) {
    weight = fbdo.intData();
  }
}

void uploadDataToFirebase() {
  uploadTempToFirebase();
  uploadHumidityToFirebase();
  uploadPressureToFirebase();
  uploadHeartRateToFirebase();
  uploadStepCountToFirebase();
  uploadCaloriesToFirebase();
  
  uploadSpo2ToFirebase();

}

void uploadTempToFirebase() {
  if (Firebase.RTDB.setFloat(&fbdo, "/sensors/temperature", temp1)) {
    Serial.println("Temperature uploaded.");
  }
}
void uploadSpo2ToFirebase() {
  if (Firebase.RTDB.setFloat(&fbdo, "/sensors/spo2", spO2)) {
    Serial.println("spo2 uploaded.");
  }
}
void uploadHumidityToFirebase() {
  if (Firebase.RTDB.setFloat(&fbdo, "/sensors/humidity", humidity)) {
    Serial.println("Humidity uploaded.");
  }
}

void uploadPressureToFirebase() {
  if (Firebase.RTDB.setFloat(&fbdo, "/sensors/pressure", pressure)) {
    Serial.println("Pressure uploaded.");
  }
}

void uploadHeartRateToFirebase() {
  if (Firebase.RTDB.setFloat(&fbdo, "/sensors/heartRate", beatAvg/3)) {
    Serial.println("Heart rate uploaded.");
  }
}

void uploadStepCountToFirebase() {
  if (Firebase.RTDB.setInt(&fbdo, "/sensors/steps", stepCount)) {
    Serial.println("Step count uploaded.");
  }
}

void uploadCaloriesToFirebase() {
  if (Firebase.RTDB.setFloat(&fbdo, "/sensors/calories", caloriesBurned)) {
    Serial.println("Calories uploaded.");
  }
}

void updateUIWithTime() {
  struct tm timeinfo;
  if (getLocalTime(&timeinfo)) {
    char timeStr[10];
    strftime(timeStr, sizeof(timeStr), "%I:%M", &timeinfo);
    lv_label_set_text(ui_Label1, timeStr);
  }
}

void updateSensorData() {
  temp1 = sht.getTemperature();
  humidity = sht.getHumidity();
  pressure = bmp.readPressure() / 100.0;
}

void handleHeartRate() {
  uint32_t irValue = particleSensor.getIR();
  if (checkForBeat(irValue)) {
    long delta = millis() - lastBeat;
    lastBeat = millis();
    beatsPerMinute = 60 / (delta / 1000.0);

    if (beatsPerMinute < 255 && beatsPerMinute > 20) {
      rates[rateSpot++] = (byte)beatsPerMinute;
      rateSpot %= RATE_SIZE;

      beatAvg = 0;
      for (byte x = 0; x < RATE_SIZE; x++) {
        beatAvg += rates[x];
      }
      beatAvg /= RATE_SIZE;
    }
  }
}

void handleStepCounting() {

    sensors_event_t a, g, temp;
    mpu.getEvent(&a, &g, &temp);
    
    float ax = a.acceleration.x;
    float ay = a.acceleration.y;
    float az = a.acceleration.z;

    float diffX = abs(ax - lastX);
    float diffY = abs(ay - lastY);
    float diffZ = abs(az - lastZ);

    float magnitude = sqrt(diffX * diffX + diffY * diffY + diffZ * diffZ);

    if (magnitude > stepThreshold && !stepDetected) {
      stepCount++;
      stepDetected = true;
    }

    if (magnitude < (stepThreshold / 2)) {
      stepDetected = false;
    }

    caloriesBurned = stepCount * caloriesPerStep;
  }



bool checkForBeat(uint32_t irValue) {
  static uint32_t lastIRValue = 0;
  static bool beatDetected = false;

  if (irValue > lastIRValue && irValue - lastIRValue > 5000) {
    beatDetected = true;
  } else {
    beatDetected = false;
  }

  lastIRValue = irValue;
  return beatDetected;
}
void updateSensors() {
  struct tm timeinfo;
  char timeStr[10], tempStr[8], humidityStr[8], pressureStr[8], heartRateStr[8],stepsStr[8],caloriesStr[8];

  if (getLocalTime(&timeinfo)) {
    strftime(timeStr, sizeof(timeStr), "%H:%M", &timeinfo);
    timeCharacteristic.writeValue(timeStr);
  }

  dtostrf(temp1, 4, 2, tempStr);
  dtostrf(humidity, 4, 2, humidityStr);
  dtostrf(pressure, 4, 2, pressureStr);
  dtostrf(beatAvg/3, 4, 2, heartRateStr);
  dtostrf(stepCount, 4, 2, stepsStr);
  dtostrf(caloriesBurned, 4, 2, caloriesStr);

  tempCharacteristic.setValue(tempStr);
  humidityCharacteristic.setValue(humidityStr);
  pressureCharacteristic.setValue(pressureStr);
  heartRateCharacteristic.setValue(heartRateStr);

  tempCharacteristic.valueUpdated();
  humidityCharacteristic.valueUpdated();
  pressureCharacteristic.valueUpdated();
  heartRateCharacteristic.valueUpdated();

  // Serial.print("Sending Data - Temp: ");
  // Serial.print(tempStr);
  // Serial.print(" Humidity: ");
  // Serial.print(humidityStr);
  // Serial.print(" Pressure: ");
  // Serial.print(pressureStr);
  // Serial.print(" Heart Rate: ");
  // Serial.println(heartRateStr);
}
void fetchHeartRateActivation() {
   String path = "/sensors/activateHeartRateSensor"; 
  
  if (Firebase.RTDB.getBool(&fbdo, path.c_str())) {  
    bool starthearSensor = fbdo.boolData();  

    
 
    HeartRateSensorActivated = starthearSensor;
  }
}



float calculateSpO2(long red, long ir) {
 
    float ratio = float(red) / float(ir);
    

     spO2 = ((110 - (ratio * 100))*6)-16;  

    return spO2;
}















