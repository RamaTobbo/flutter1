#include "ui.h"
#include "lvgl.h"  // Ensure that you include LVGL header

void ui_Screen11_screen_init(void)
{
    // Create a screen
    ui_Screen11 = lv_obj_create(NULL);
    lv_obj_clear_flag(ui_Screen11, LV_OBJ_FLAG_SCROLLABLE);  // Disable scrolling
    
    // Create a label
    ui_Label41 = lv_label_create(ui_Screen11);
    lv_obj_set_width(ui_Label41, LV_SIZE_CONTENT);
    lv_obj_set_height(ui_Label41, LV_SIZE_CONTENT);
    lv_obj_set_x(ui_Label41, -148);
    lv_obj_set_y(ui_Label41, -171);
    lv_obj_set_align(ui_Label41, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label41, "Scan QR Code");
    lv_obj_set_style_text_font(ui_Label41, &ui_font_Font7, LV_PART_MAIN | LV_STATE_DEFAULT);
    
    // Create a panel
    // Disable scrolling on the panel

    // Create the QR code
    const char *qr_data = "track_pro";  // The data for your QR code
    lv_obj_t * qr = lv_qrcode_create(ui_Screen11, 250, lv_color_hex3(0x000000), lv_color_hex3(0xeef)); // Create a 150x150 QR code
    
    // Position the QR code
    lv_obj_set_x(qr, 179);  // Adjust as necessary
    lv_obj_set_y(qr, 157); // Adjust as necessary
    
    // Update the QR code with data
    lv_qrcode_update(qr, qr_data, strlen(qr_data));  // Add your URL or other string data
    
    // Add event callback (if needed)
    lv_obj_add_event_cb(ui_Screen11, ui_event_Screen11, LV_EVENT_ALL, NULL);
}
