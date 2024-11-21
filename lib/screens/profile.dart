import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:track_pro/provider/userdata.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  String username = '';
  int height = 0; // In cm
  int weight = 0; // In kg
  List<int> weightHistory = [];
  bool isEditingHeight = false;
  bool isEditingWeight = false;

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double calculateBMI() {
    if (height == 0) return 0;
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 24.9) return "Normal";
    if (bmi < 29.9) return "Overweight";
    return "Obese";
  }

  void fetchUserInformation(BuildContext context) async {
    try {
      String userId = Provider.of<UserData>(context, listen: false).userId;

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        setState(() {
          username = snapshot['username'];
          height = snapshot['height'];
          weight = snapshot['weight'];
          _heightController.text = height.toString();
          _weightController.text = weight.toString();
          weightHistory = List<int>.from(snapshot['weightHistory'] ?? []);

          // Optionally update weightHistory from Firestore
        });
      } else {
        debugPrint("No user found for the given ID.");
      }
    } catch (e) {
      debugPrint("Error fetching user information: $e");
    }
  }

  void updateUserInformation() async {
    try {
      String userId = Provider.of<UserData>(context, listen: false).userId;
      int newHeight = int.tryParse(_heightController.text) ?? height;
      int newWeight = int.tryParse(_weightController.text) ?? weight;

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'height': newHeight,
        'weight': newWeight,
        'weightHistory': FieldValue.arrayUnion([newWeight]),
      });

      setState(() {
        height = newHeight;
        weight = newWeight;
      });
    } catch (e) {
      debugPrint("Error updating user information: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error updating profile")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserInformation(context);
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();
    String bmiCategory = getBMICategory(bmi);

    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Username Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Username: $username',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Height Section
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _heightController,
                      enabled: isEditingHeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height (cm)',
                        border: OutlineInputBorder(),
                        hintText: 'Enter your height',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isEditingHeight ? Icons.check : Icons.edit,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      if (isEditingHeight) {
                        updateUserInformation();
                      }
                      setState(() {
                        isEditingHeight = !isEditingHeight;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Weight Section
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _weightController,
                      enabled: isEditingWeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                        border: OutlineInputBorder(),
                        hintText: 'Enter your weight',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isEditingWeight ? Icons.check : Icons.edit,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      if (isEditingWeight) {
                        updateUserInformation();
                      }
                      setState(() {
                        isEditingWeight = !isEditingWeight;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              // BMI Section
              Text(
                'BMI: ${bmi.toStringAsFixed(2)} ($bmiCategory)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Weight Graph
              Text(
                'Weight History',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 200, child: _buildWeightGraph()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightGraph() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              weightHistory.length,
              (index) =>
                  FlSpot(index.toDouble(), weightHistory[index].toDouble()),
            ),
            isCurved: true,
            color: Colors.amber,
            barWidth: 4,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
