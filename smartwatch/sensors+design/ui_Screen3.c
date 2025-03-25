// This file was generated by SquareLine Studio
// SquareLine Studio version: SquareLine Studio 1.4.2
// LVGL version: 8.3.11
// Project name: SquareLine_Project

#include "ui.h"

void ui_Screen3_screen_init(void)
{
    ui_Screen3 = lv_obj_create(NULL);
    lv_obj_clear_flag(ui_Screen3, LV_OBJ_FLAG_SCROLLABLE);      /// Flags

    ui_Label19 = lv_label_create(ui_Screen3);
    lv_obj_set_width(ui_Label19, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label19, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label19, -145);
    lv_obj_set_y(ui_Label19, -172);
    lv_obj_set_align(ui_Label19, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label19, "Heart Rate");
    lv_obj_set_style_text_font(ui_Label19, &ui_font_Font7, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Panel3 = lv_obj_create(ui_Screen3);
    lv_obj_set_width(ui_Panel3, 435);
    lv_obj_set_height(ui_Panel3, 125);
    lv_obj_set_x(ui_Panel3, -4);
    lv_obj_set_y(ui_Panel3, -41);
    lv_obj_set_align(ui_Panel3, LV_ALIGN_CENTER);
    lv_obj_clear_flag(ui_Panel3, LV_OBJ_FLAG_SCROLLABLE);      /// Flags
    lv_obj_set_style_radius(ui_Panel3, 50, LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_shadow_color(ui_Panel3, lv_color_hex(0xF9E0E4), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_shadow_opa(ui_Panel3, 255, LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_shadow_width(ui_Panel3, 54, LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_shadow_spread(ui_Panel3, 0, LV_PART_MAIN | LV_STATE_DEFAULT);

    lv_obj_set_style_radius(ui_Panel3, 50, LV_PART_SCROLLBAR | LV_STATE_DEFAULT);
    
    ui_Panel2 = lv_obj_create(ui_Screen3);
    lv_obj_set_width(ui_Panel2, 435);
    lv_obj_set_height(ui_Panel2, 125);
    lv_obj_set_x(ui_Panel2, -4);
    lv_obj_set_y(ui_Panel2, 114);
    lv_obj_set_align(ui_Panel2, LV_ALIGN_CENTER);
    lv_obj_clear_flag(ui_Panel2, LV_OBJ_FLAG_SCROLLABLE);      /// Flags
    lv_obj_set_style_radius(ui_Panel2, 50, LV_PART_MAIN | LV_STATE_DEFAULT);

    lv_obj_set_style_shadow_color(ui_Panel2, lv_color_hex(0xF9E0E4), LV_PART_SCROLLBAR | LV_STATE_DEFAULT);
    lv_obj_set_style_shadow_opa(ui_Panel2, 255, LV_PART_SCROLLBAR | LV_STATE_DEFAULT);
    lv_obj_set_style_shadow_width(ui_Panel2, 53, LV_PART_SCROLLBAR | LV_STATE_DEFAULT);
    lv_obj_set_style_shadow_spread(ui_Panel2, 0, LV_PART_SCROLLBAR | LV_STATE_DEFAULT);

     ui_Label199 = lv_label_create( ui_Panel3 );
    lv_obj_set_width(ui_Label199, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label19, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label199, 8);
    lv_obj_set_y(ui_Label199, -20);
    lv_obj_set_align(ui_Label199, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label199, "Rate");
       lv_obj_set_style_text_opa(ui_Label199, 255, LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_font(ui_Label199, &ui_font_Font7, LV_PART_MAIN | LV_STATE_DEFAULT);
        ui_Label197 = lv_label_create( ui_Panel3 );
    lv_obj_set_width(ui_Label197, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label197, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label197, 80);
    lv_obj_set_y(ui_Label197, -20);
    lv_obj_set_align(ui_Label197, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label197, "bpm");
       lv_obj_set_style_text_opa(ui_Label197, 255, LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_font(ui_Label197,&ui_font_Font11, LV_PART_MAIN | LV_STATE_DEFAULT);
    
     ui_Label198 = lv_label_create( ui_Panel2 );
    lv_obj_set_width(ui_Label198, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label198, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_x(ui_Label198, 8);
    lv_obj_set_y(ui_Label198, -20);
    lv_obj_set_align(ui_Label198, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label198, "Rate");
       lv_obj_set_style_text_opa(ui_Label198, 255, LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_text_font(ui_Label198, &ui_font_Font7, LV_PART_MAIN | LV_STATE_DEFAULT);




    ui_Image16 = lv_img_create(ui_Screen3);
    lv_img_set_src(ui_Image16, &ui_img_heart_with_pulse_png);
    lv_obj_set_width(ui_Image16, LV_SIZE_CONTENT);   /// 90
    lv_obj_set_height(ui_Image16, LV_SIZE_CONTENT);    /// 90
    lv_obj_set_x(ui_Image16, -143);
    lv_obj_set_y(ui_Image16, -40);
    lv_obj_set_align(ui_Image16, LV_ALIGN_CENTER);
    lv_obj_add_flag(ui_Image16, LV_OBJ_FLAG_ADV_HITTEST);     /// Flags
    lv_obj_clear_flag(ui_Image16, LV_OBJ_FLAG_SCROLLABLE);      /// Flags

    ui_Image17 = lv_img_create(ui_Screen3);
    lv_img_set_src(ui_Image17, &ui_img_pulse_oximeter_png);
    lv_obj_set_width(ui_Image17, LV_SIZE_CONTENT);   /// 77
    lv_obj_set_height(ui_Image17, LV_SIZE_CONTENT);    /// 81
    lv_obj_set_x(ui_Image17, -143);
    lv_obj_set_y(ui_Image17, 114);
    lv_obj_set_align(ui_Image17, LV_ALIGN_CENTER);
    lv_obj_add_flag(ui_Image17, LV_OBJ_FLAG_ADV_HITTEST);     /// Flags
    lv_obj_clear_flag(ui_Image17, LV_OBJ_FLAG_SCROLLABLE);      /// Flags

    lv_obj_add_event_cb(ui_Screen3, ui_event_Screen3, LV_EVENT_ALL, NULL);

}
