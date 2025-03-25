// This file was generated by SquareLine Studio
// SquareLine Studio version: SquareLine Studio 1.4.2
// LVGL version: 8.3.11
// Project name: SquareLine_Project

#include "ui.h"

void ui_Screen7_screen_init(void)
{
    ui_Screen7 = lv_obj_create(NULL);
    lv_obj_clear_flag(ui_Screen7, LV_OBJ_FLAG_SCROLLABLE);      /// Flags

    ui_Label27 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label27, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label27, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label27, -200);
    lv_obj_set_y(ui_Label27, -179);
    lv_obj_set_align(ui_Label27, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label27, "Timer");
    lv_obj_set_style_text_font(ui_Label27, &ui_font_Font7, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Arc2 = lv_arc_create(ui_Screen7);
    lv_obj_set_width(ui_Arc2, 350);
    lv_obj_set_height(ui_Arc2, 450);
    lv_obj_set_x(ui_Arc2, 9);
    lv_obj_set_y(ui_Arc2, 131);
    lv_obj_set_align(ui_Arc2, LV_ALIGN_CENTER);
    lv_arc_set_value(ui_Arc2, 50);

    lv_obj_set_style_arc_color(ui_Arc2, lv_color_hex(0x96AFB3), LV_PART_INDICATOR | LV_STATE_DEFAULT);
    lv_obj_set_style_arc_opa(ui_Arc2, 255, LV_PART_INDICATOR | LV_STATE_DEFAULT);

    lv_obj_set_style_bg_color(ui_Arc2, lv_color_hex(0x96AFB3), LV_PART_KNOB | LV_STATE_DEFAULT);
    lv_obj_set_style_bg_opa(ui_Arc2, 255, LV_PART_KNOB | LV_STATE_DEFAULT);

    ui_Label28 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label28, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label28, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label28, 8);
    lv_obj_set_y(ui_Label28, 179);
    lv_obj_set_align(ui_Label28, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label28, "CountDown Finished");
    lv_obj_add_flag(ui_Label28, LV_OBJ_FLAG_HIDDEN);     /// Flags
    lv_obj_set_style_text_font(ui_Label28, &ui_font_Font3, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Spinbox1 = lv_spinbox_create(ui_Screen7);
    lv_obj_set_width(ui_Spinbox1, 70);
    lv_obj_set_height(ui_Spinbox1, 42);
    lv_obj_set_x(ui_Spinbox1, 97);
    lv_obj_set_y(ui_Spinbox1, 2);
    lv_obj_set_align(ui_Spinbox1, LV_ALIGN_CENTER);
    lv_spinbox_set_digit_format(ui_Spinbox1, 4, 2);
    lv_spinbox_set_range(ui_Spinbox1, 0, 9999);
    lv_spinbox_set_cursor_pos(ui_Spinbox1, 1 - 1);

    ui_Button7 = lv_btn_create(ui_Screen7);
    lv_obj_set_width(ui_Button7, 50);
    lv_obj_set_height(ui_Button7, 50);
    lv_obj_set_x(ui_Button7, -79);
    lv_obj_set_y(ui_Button7, 123);
    lv_obj_set_align(ui_Button7, LV_ALIGN_CENTER);
    lv_obj_add_flag(ui_Button7, LV_OBJ_FLAG_SCROLL_ON_FOCUS);     /// Flags
    lv_obj_clear_flag(ui_Button7, LV_OBJ_FLAG_SCROLLABLE);      /// Flags
    lv_obj_set_style_bg_color(ui_Button7, lv_color_hex(0x96AFB3), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_bg_opa(ui_Button7, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Button8 = lv_btn_create(ui_Screen7);
    lv_obj_set_width(ui_Button8, 50);
    lv_obj_set_height(ui_Button8, 50);
    lv_obj_set_x(ui_Button8, -79);
    lv_obj_set_y(ui_Button8, 60);
    lv_obj_set_align(ui_Button8, LV_ALIGN_CENTER);
    lv_obj_add_flag(ui_Button8, LV_OBJ_FLAG_SCROLL_ON_FOCUS);     /// Flags
    lv_obj_clear_flag(ui_Button8, LV_OBJ_FLAG_SCROLLABLE);      /// Flags
    lv_obj_set_style_bg_color(ui_Button8, lv_color_hex(0x96AFB3), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_bg_opa(ui_Button8, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Label31 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label31, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label31, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label31, -79);
    lv_obj_set_y(ui_Label31, 125);
    lv_obj_set_align(ui_Label31, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label31, "+");
    lv_obj_set_style_text_color(ui_Label31, lv_color_hex(0xFFFFFF), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_opa(ui_Label31, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Label32 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label32, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label32, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label32, -81);
    lv_obj_set_y(ui_Label32, 58);
    lv_obj_set_align(ui_Label32, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label32, "_");
    lv_obj_set_style_text_color(ui_Label32, lv_color_hex(0xFFFFFF), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_opa(ui_Label32, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Button9 = lv_btn_create(ui_Screen7);
    lv_obj_set_width(ui_Button9, 100);
    lv_obj_set_height(ui_Button9, 68);
    lv_obj_set_x(ui_Button9, 5);
    lv_obj_set_y(ui_Button9, -145);
    lv_obj_set_align(ui_Button9, LV_ALIGN_CENTER);
    lv_obj_add_flag(ui_Button9, LV_OBJ_FLAG_SCROLL_ON_FOCUS);     /// Flags
    lv_obj_clear_flag(ui_Button9, LV_OBJ_FLAG_SCROLLABLE);      /// Flags
    lv_obj_set_style_bg_color(ui_Button9, lv_color_hex(0xFFFFFF), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_bg_opa(ui_Button9, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Label33 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label33, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label33, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label33, 4);
    lv_obj_set_y(ui_Label33, -147);
    lv_obj_set_align(ui_Label33, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label33, "Set Timer");
    lv_obj_set_style_text_color(ui_Label33, lv_color_hex(0x808080), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_opa(ui_Label33, 255, LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_font(ui_Label33, &ui_font_Font3, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Spinbox2 = lv_spinbox_create(ui_Screen7);
    lv_obj_set_width(ui_Spinbox2, 70);
    lv_obj_set_height(ui_Spinbox2, 42);
    lv_obj_set_x(ui_Spinbox2, 6);
    lv_obj_set_y(ui_Spinbox2, 2);
    lv_obj_set_align(ui_Spinbox2, LV_ALIGN_CENTER);
    lv_spinbox_set_digit_format(ui_Spinbox2, 4, 2);
    lv_spinbox_set_range(ui_Spinbox2, 0, 9999);
    lv_spinbox_set_cursor_pos(ui_Spinbox2, 1 - 1);

    ui_Button10 = lv_btn_create(ui_Screen7);
    lv_obj_set_width(ui_Button10, 50);
    lv_obj_set_height(ui_Button10, 50);
    lv_obj_set_x(ui_Button10, 90);
    lv_obj_set_y(ui_Button10, 58);
    lv_obj_set_align(ui_Button10, LV_ALIGN_CENTER);
    lv_obj_add_flag(ui_Button10, LV_OBJ_FLAG_SCROLL_ON_FOCUS);     /// Flags
    lv_obj_clear_flag(ui_Button10, LV_OBJ_FLAG_SCROLLABLE);      /// Flags
    lv_obj_set_style_bg_color(ui_Button10, lv_color_hex(0x96AFB3), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_bg_opa(ui_Button10, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Button11 = lv_btn_create(ui_Screen7);
    lv_obj_set_width(ui_Button11, 50);
    lv_obj_set_height(ui_Button11, 50);
    lv_obj_set_x(ui_Button11, 6);
    lv_obj_set_y(ui_Button11, 61);
    lv_obj_set_align(ui_Button11, LV_ALIGN_CENTER);
    lv_obj_add_flag(ui_Button11, LV_OBJ_FLAG_SCROLL_ON_FOCUS);     /// Flags
    lv_obj_clear_flag(ui_Button11, LV_OBJ_FLAG_SCROLLABLE);      /// Flags
    lv_obj_set_style_bg_color(ui_Button11, lv_color_hex(0x96AFB3), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_bg_opa(ui_Button11, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Button12 = lv_btn_create(ui_Screen7);
    lv_obj_set_width(ui_Button12, 50);
    lv_obj_set_height(ui_Button12, 50);
    lv_obj_set_x(ui_Button12, 6);
    lv_obj_set_y(ui_Button12, 120);
    lv_obj_set_align(ui_Button12, LV_ALIGN_CENTER);
    lv_obj_add_flag(ui_Button12, LV_OBJ_FLAG_SCROLL_ON_FOCUS);     /// Flags
    lv_obj_clear_flag(ui_Button12, LV_OBJ_FLAG_SCROLLABLE);      /// Flags
    lv_obj_set_style_bg_color(ui_Button12, lv_color_hex(0x96AFB3), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_bg_opa(ui_Button12, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Button13 = lv_btn_create(ui_Screen7);
    lv_obj_set_width(ui_Button13, 50);
    lv_obj_set_height(ui_Button13, 50);
    lv_obj_set_x(ui_Button13, 91);
    lv_obj_set_y(ui_Button13, 119);
    lv_obj_set_align(ui_Button13, LV_ALIGN_CENTER);
    lv_obj_add_flag(ui_Button13, LV_OBJ_FLAG_SCROLL_ON_FOCUS);     /// Flags
    lv_obj_clear_flag(ui_Button13, LV_OBJ_FLAG_SCROLLABLE);      /// Flags
    lv_obj_set_style_bg_color(ui_Button13, lv_color_hex(0x96AFB3), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_bg_opa(ui_Button13, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Label34 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label34, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label34, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label34, 89);
    lv_obj_set_y(ui_Label34, 59);
    lv_obj_set_align(ui_Label34, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label34, "_");
    lv_obj_set_style_text_color(ui_Label34, lv_color_hex(0xFFFFFF), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_opa(ui_Label34, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Label35 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label35, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label35, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label35, 5);
    lv_obj_set_y(ui_Label35, 61);
    lv_obj_set_align(ui_Label35, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label35, "_");
    lv_obj_set_style_text_color(ui_Label35, lv_color_hex(0xFFFFFF), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_opa(ui_Label35, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Label36 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label36, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label36, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label36, 6);
    lv_obj_set_y(ui_Label36, 124);
    lv_obj_set_align(ui_Label36, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label36, "+");
    lv_obj_set_style_text_color(ui_Label36, lv_color_hex(0xFFFFFF), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_opa(ui_Label36, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Label37 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label37, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label37, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label37, 90);
    lv_obj_set_y(ui_Label37, 122);
    lv_obj_set_align(ui_Label37, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label37, "+");
    lv_obj_set_style_text_color(ui_Label37, lv_color_hex(0xFFFFFF), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_opa(ui_Label37, 255, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Label38 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label38, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label38, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label38, -78);
    lv_obj_set_y(ui_Label38, -34);
    lv_obj_set_align(ui_Label38, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label38, "h");

    ui_Label39 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label39, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label39, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label39, 4);
    lv_obj_set_y(ui_Label39, -36);
    lv_obj_set_align(ui_Label39, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label39, "min");

    ui_Label40 = lv_label_create(ui_Screen7);
    lv_obj_set_width(ui_Label40, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label40, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label40, 90);
    lv_obj_set_y(ui_Label40, -36);
    lv_obj_set_align(ui_Label40, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label40, "sec");

    ui_Spinbox3 = lv_spinbox_create(ui_Screen7);
    lv_obj_set_width(ui_Spinbox3, 70);
    lv_obj_set_height(ui_Spinbox3, 42);
    lv_obj_set_x(ui_Spinbox3, -78);
    lv_obj_set_y(ui_Spinbox3, 4);
    lv_obj_set_align(ui_Spinbox3, LV_ALIGN_CENTER);
    lv_spinbox_set_digit_format(ui_Spinbox3, 4, 2);
    lv_spinbox_set_range(ui_Spinbox3, 0, 9999);
    lv_spinbox_set_cursor_pos(ui_Spinbox3, 1 - 1);

    lv_obj_add_event_cb(ui_Button7, ui_event_Button7, LV_EVENT_ALL, NULL);
    lv_obj_add_event_cb(ui_Button8, ui_event_Button8, LV_EVENT_ALL, NULL);
    lv_obj_add_event_cb(ui_Button10, ui_event_Button10, LV_EVENT_ALL, NULL);
    lv_obj_add_event_cb(ui_Button11, ui_event_Button11, LV_EVENT_ALL, NULL);
    lv_obj_add_event_cb(ui_Button12, ui_event_Button12, LV_EVENT_ALL, NULL);
    lv_obj_add_event_cb(ui_Button13, ui_event_Button13, LV_EVENT_ALL, NULL);
    lv_obj_add_event_cb(ui_Screen7, ui_event_Screen7, LV_EVENT_ALL, NULL);

}
