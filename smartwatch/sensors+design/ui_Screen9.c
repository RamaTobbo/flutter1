// This file was generated by SquareLine Studio
// SquareLine Studio version: SquareLine Studio 1.4.2
// LVGL version: 8.3.11
// Project name: SquareLine_Project

#include "ui.h"

void ui_Screen9_screen_init(void)
{
    ui_Screen9 = lv_obj_create(NULL);
    lv_obj_clear_flag(ui_Screen9, LV_OBJ_FLAG_SCROLLABLE);      /// Flags

    ui_Label30 = lv_label_create(ui_Screen9);
    lv_obj_set_width(ui_Label30, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label30, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label30, -200);
    lv_obj_set_y(ui_Label30, -179);
    lv_obj_set_align(ui_Label30, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label30, "Location");
    lv_obj_set_style_text_font(ui_Label30, &ui_font_Font7, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Container1 = lv_obj_create(ui_Screen9);
    lv_obj_remove_style_all(ui_Container1);
    lv_obj_set_width(ui_Container1, 590);
    lv_obj_set_height(ui_Container1, 370);
    lv_obj_set_x(ui_Container1, 0);
    lv_obj_set_y(ui_Container1, 42);
    lv_obj_set_align(ui_Container1, LV_ALIGN_CENTER);
    lv_obj_clear_flag(ui_Container1, LV_OBJ_FLAG_CLICKABLE | LV_OBJ_FLAG_SCROLLABLE);      /// Flags

    lv_obj_add_event_cb(ui_Screen9, ui_event_Screen9, LV_EVENT_ALL, NULL);

}
