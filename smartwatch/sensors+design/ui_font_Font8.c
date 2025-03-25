/*******************************************************************************
 * Size: 17 px
 * Bpp: 1
 * Opts: --bpp 1 --size 17 --font C:/Users/10User/Desktop/lilygoDesign/assets/Economica-Italic.ttf -o C:/Users/10User/Desktop/lilygoDesign/assets\ui_font_Font8.c --format lvgl -r 0x20-0x7f --no-compress --no-prefilter
 ******************************************************************************/

#include "ui.h"

#ifndef UI_FONT_FONT8
#define UI_FONT_FONT8 1
#endif

#if UI_FONT_FONT8

/*-----------------
 *    BITMAPS
 *----------------*/

/*Store the image of the glyphs*/
static LV_ATTRIBUTE_LARGE_CONST const uint8_t glyph_bitmap[] = {
    /* U+0020 " " */
    0x0,

    /* U+0021 "!" */
    0x24, 0x94, 0x92, 0x40, 0x40,

    /* U+0022 "\"" */
    0x5a, 0x94, 0x20,

    /* U+0023 "#" */
    0x3, 0x20, 0x4c, 0x11, 0x2, 0x67, 0xfe, 0x12,
    0x4, 0xc7, 0xfe, 0x24, 0x8, 0x81, 0x20, 0x44,
    0x0,

    /* U+0024 "$" */
    0x10, 0xd8, 0x86, 0x18, 0x61, 0x1f, 0x88, 0x40,

    /* U+0025 "%" */
    0x71, 0x92, 0x96, 0xa4, 0xe8, 0x8, 0x10, 0x17,
    0x29, 0x69, 0x4a, 0x8e,

    /* U+0026 "&" */
    0x1c, 0x10, 0x8, 0xc, 0x2, 0x31, 0xbd, 0x8,
    0x84, 0x82, 0x43, 0x31, 0xf, 0x0,

    /* U+0027 "'" */
    0x5a,

    /* U+0028 "(" */
    0x19, 0x8, 0xc4, 0x21, 0x8, 0xc4, 0x21, 0x8,
    0x41, 0x80,

    /* U+0029 ")" */
    0x30, 0x42, 0x10, 0x84, 0x23, 0x10, 0x84, 0x22,
    0x13, 0x0,

    /* U+002A "*" */
    0x6, 0xf6, 0x0,

    /* U+002B "+" */
    0x22, 0xf4, 0x40,

    /* U+002C "," */
    0x58,

    /* U+002D "-" */
    0xf0,

    /* U+002E "." */
    0x80,

    /* U+002F "/" */
    0x1, 0x2, 0x2, 0x4, 0x4, 0x8, 0x8, 0x10,
    0x10, 0x20, 0x20, 0x40, 0x40, 0x80, 0x80,

    /* U+0030 "0" */
    0x1c, 0x94, 0x51, 0x47, 0x18, 0xe2, 0x8a, 0x29,
    0x38,

    /* U+0031 "1" */
    0x38, 0x84, 0x21, 0x8, 0xc4, 0x21, 0x9, 0xf0,

    /* U+0032 "2" */
    0x3c, 0x10, 0x41, 0x8, 0x42, 0x10, 0x43, 0x8,
    0x3e,

    /* U+0033 "3" */
    0x3c, 0x21, 0x84, 0x38, 0x20, 0x82, 0x8, 0x61,
    0x3c,

    /* U+0034 "4" */
    0x4, 0x31, 0x45, 0x28, 0xa4, 0xbf, 0x8, 0x21,
    0x4,

    /* U+0035 "5" */
    0x3c, 0x82, 0x10, 0x78, 0x20, 0x82, 0x8, 0x21,
    0x3c,

    /* U+0036 "6" */
    0x1c, 0x86, 0x10, 0x79, 0x24, 0xa2, 0x8a, 0x29,
    0x18,

    /* U+0037 "7" */
    0x7c, 0x30, 0x86, 0x10, 0x42, 0x8, 0x41, 0x8,
    0x20,

    /* U+0038 "8" */
    0x18, 0x96, 0x51, 0x48, 0xc4, 0xa2, 0x8a, 0x29,
    0x9c,

    /* U+0039 "9" */
    0x1c, 0x96, 0x51, 0x45, 0x14, 0xde, 0x8, 0x61,
    0x3c,

    /* U+003A ":" */
    0x60, 0x0, 0x0, 0x80,

    /* U+003B ";" */
    0x30, 0x0, 0x0, 0x4, 0x48,

    /* U+003C "<" */
    0x22, 0x48, 0x88, 0x44,

    /* U+003D "=" */
    0xf8, 0x3c,

    /* U+003E ">" */
    0x42, 0x21, 0x22, 0x48,

    /* U+003F "?" */
    0x38, 0x30, 0x42, 0x8, 0x42, 0x10, 0x40, 0x0,
    0x30,

    /* U+0040 "@" */
    0x3f, 0xa0, 0x53, 0x2a, 0x95, 0x54, 0xfa, 0x1,
    0x80, 0x7c, 0x0,

    /* U+0041 "A" */
    0x4, 0x18, 0x30, 0x61, 0x42, 0xcd, 0x9f, 0x22,
    0x85, 0xa, 0x10,

    /* U+0042 "B" */
    0x3c, 0x4c, 0x99, 0x26, 0x4f, 0x91, 0x22, 0x44,
    0x89, 0x37, 0xc0,

    /* U+0043 "C" */
    0x3d, 0x84, 0x30, 0x82, 0x8, 0x20, 0x82, 0x8,
    0x3c,

    /* U+0044 "D" */
    0x3e, 0x44, 0x89, 0x16, 0x28, 0x50, 0xa1, 0x44,
    0x89, 0x37, 0xc0,

    /* U+0045 "E" */
    0x3e, 0x40, 0x81, 0x6, 0xf, 0x90, 0x20, 0x40,
    0x81, 0x7, 0xc0,

    /* U+0046 "F" */
    0x3e, 0x40, 0x81, 0x6, 0xf, 0x90, 0x20, 0x40,
    0x81, 0x4, 0x0,

    /* U+0047 "G" */
    0x3d, 0x84, 0x10, 0xc2, 0x8, 0xa2, 0x8a, 0x28,
    0x9e,

    /* U+0048 "H" */
    0x22, 0x44, 0x89, 0x16, 0x2f, 0xd1, 0x22, 0x44,
    0x89, 0x14, 0x20,

    /* U+0049 "I" */
    0x24, 0x96, 0x92, 0x4b, 0x40,

    /* U+004A "J" */
    0x8, 0x42, 0x21, 0x8, 0x42, 0x11, 0x8, 0x42,
    0x23, 0x0,

    /* U+004B "K" */
    0x22, 0x48, 0x91, 0x47, 0x8a, 0x14, 0x28, 0x50,
    0xb1, 0x24, 0x40,

    /* U+004C "L" */
    0x21, 0x8, 0x46, 0x21, 0x8, 0x42, 0x11, 0xf0,

    /* U+004D "M" */
    0x20, 0x8c, 0x23, 0x18, 0xc6, 0x72, 0x93, 0x24,
    0xd9, 0x4, 0x41, 0x10, 0x4c, 0x12, 0x4,

    /* U+004E "N" */
    0x22, 0x44, 0xc9, 0x95, 0x2a, 0x55, 0x26, 0x4c,
    0x9a, 0x34, 0x60,

    /* U+004F "O" */
    0x3c, 0x94, 0x51, 0xc6, 0x18, 0x61, 0x8e, 0x29,
    0xbc,

    /* U+0050 "P" */
    0x3e, 0x44, 0x89, 0x16, 0x6f, 0x90, 0x20, 0x40,
    0x81, 0x4, 0x0,

    /* U+0051 "Q" */
    0xe, 0x12, 0x22, 0x22, 0x42, 0x42, 0x42, 0x42,
    0x46, 0x44, 0x4c, 0x78, 0x20, 0xe0, 0x1f,

    /* U+0052 "R" */
    0x3c, 0x4c, 0x99, 0x26, 0x4f, 0x14, 0x24, 0x48,
    0x91, 0x34, 0x20,

    /* U+0053 "S" */
    0x3d, 0x84, 0x10, 0x20, 0xc1, 0x83, 0xc, 0x20,
    0xbc,

    /* U+0054 "T" */
    0xf9, 0x8, 0x46, 0x21, 0x8, 0x42, 0x31, 0x0,

    /* U+0055 "U" */
    0x46, 0x89, 0x12, 0x2c, 0x50, 0xa3, 0x44, 0x89,
    0x12, 0x47, 0x80,

    /* U+0056 "V" */
    0x8a, 0x28, 0xa4, 0x92, 0x4a, 0x28, 0xc3, 0xc,
    0x20,

    /* U+0057 "W" */
    0x80, 0x60, 0x18, 0xe, 0x22, 0x8c, 0xa5, 0x69,
    0x52, 0x54, 0xa6, 0x29, 0x8c, 0x61, 0x10,

    /* U+0058 "X" */
    0x11, 0x12, 0x12, 0x14, 0x14, 0x8, 0x18, 0x18,
    0x28, 0x24, 0x44, 0x44,

    /* U+0059 "Y" */
    0xc5, 0x24, 0x94, 0x51, 0x82, 0x10, 0x41, 0x4,
    0x10,

    /* U+005A "Z" */
    0x3e, 0x8, 0x30, 0x41, 0x2, 0x8, 0x10, 0x40,
    0x82, 0x7, 0xc0,

    /* U+005B "[" */
    0x32, 0x24, 0x44, 0x44, 0x48, 0x88, 0x8c,

    /* U+005C "\\" */
    0x88, 0xc4, 0x44, 0x44, 0x62, 0x22, 0x22, 0x30,

    /* U+005D "]" */
    0x31, 0x11, 0x11, 0x22, 0x22, 0x22, 0x4c,

    /* U+005E "^" */
    0x3b, 0x10,

    /* U+005F "_" */
    0xff, 0x0,

    /* U+0060 "`" */
    0x90,

    /* U+0061 "a" */
    0x39, 0x14, 0x52, 0x8a, 0x28, 0xa6, 0xe8,

    /* U+0062 "b" */
    0x20, 0x84, 0x1e, 0x4d, 0x34, 0x92, 0x8a, 0x2d,
    0x2c,

    /* U+0063 "c" */
    0x3a, 0x10, 0x88, 0x42, 0x10, 0x70,

    /* U+0064 "d" */
    0x4, 0x10, 0x4f, 0x45, 0x24, 0xa2, 0x8a, 0x29,
    0x9c,

    /* U+0065 "e" */
    0x3a, 0x52, 0x97, 0x42, 0x10, 0x70,

    /* U+0066 "f" */
    0xe, 0x10, 0x20, 0xe1, 0x2, 0x4, 0x8, 0x10,
    0x60, 0x81, 0x2, 0xc, 0x30, 0x0,

    /* U+0067 "g" */
    0x3d, 0x94, 0x92, 0x8a, 0x28, 0xa6, 0x70, 0x41,
    0x3c,

    /* U+0068 "h" */
    0x20, 0x82, 0x1f, 0x45, 0x14, 0x52, 0x4b, 0x28,
    0xa2,

    /* U+0069 "i" */
    0x20, 0x24, 0x92, 0x52, 0x40,

    /* U+006A "j" */
    0x8, 0x0, 0x21, 0x8, 0x42, 0x11, 0x8, 0x42,
    0x33, 0x0,

    /* U+006B "k" */
    0x20, 0x82, 0x11, 0x49, 0x45, 0x18, 0x52, 0x49,
    0x22,

    /* U+006C "l" */
    0x24, 0xa4, 0x92, 0x52, 0x40,

    /* U+006D "m" */
    0x5b, 0xb6, 0x52, 0x29, 0x18, 0x8c, 0x46, 0x25,
    0x12, 0x91, 0x0,

    /* U+006E "n" */
    0x5d, 0x94, 0x51, 0x49, 0x28, 0xa2, 0x88,

    /* U+006F "o" */
    0x39, 0xb4, 0x52, 0x8a, 0x28, 0xa4, 0x70,

    /* U+0070 "p" */
    0x3c, 0x48, 0x91, 0x22, 0x48, 0x91, 0x24, 0x78,
    0x81, 0x4, 0x0,

    /* U+0071 "q" */
    0x3d, 0x94, 0x52, 0xca, 0x28, 0xb6, 0x68, 0x41,
    0x4,

    /* U+0072 "r" */
    0x56, 0x44, 0x88, 0x88, 0x80,

    /* U+0073 "s" */
    0x7a, 0x10, 0x83, 0x8, 0x42, 0xe0,

    /* U+0074 "t" */
    0x2, 0x74, 0x44, 0x44, 0x88, 0xe0,

    /* U+0075 "u" */
    0x45, 0x14, 0x92, 0x8a, 0x28, 0xa6, 0xf8,

    /* U+0076 "v" */
    0x8c, 0xa5, 0x2a, 0x53, 0x18, 0xc0,

    /* U+0077 "w" */
    0x81, 0x99, 0x9a, 0xaa, 0xaa, 0xac, 0xcc, 0xcc,
    0xc8,

    /* U+0078 "x" */
    0x24, 0x92, 0x84, 0x10, 0xc2, 0x92, 0x88,

    /* U+0079 "y" */
    0x24, 0x92, 0x4a, 0x28, 0xa3, 0xc, 0x20, 0x86,
    0x30,

    /* U+007A "z" */
    0x78, 0x44, 0x22, 0x21, 0x10, 0xf0,

    /* U+007B "{" */
    0x39, 0x8, 0x42, 0x22, 0x10, 0x42, 0x10, 0x88,
    0x70,

    /* U+007C "|" */
    0x24, 0xa4, 0x92, 0x52, 0x49, 0x20,

    /* U+007D "}" */
    0x38, 0x84, 0x21, 0x8, 0x21, 0x11, 0x8, 0x42,
    0x60,

    /* U+007E "~" */
    0xf0
};


/*---------------------
 *  GLYPH DESCRIPTION
 *--------------------*/

static const lv_font_fmt_txt_glyph_dsc_t glyph_dsc[] = {
    {.bitmap_index = 0, .adv_w = 0, .box_w = 0, .box_h = 0, .ofs_x = 0, .ofs_y = 0} /* id = 0 reserved */,
    {.bitmap_index = 0, .adv_w = 52, .box_w = 1, .box_h = 1, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 1, .adv_w = 44, .box_w = 3, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 6, .adv_w = 90, .box_w = 5, .box_h = 4, .ofs_x = 2, .ofs_y = 8},
    {.bitmap_index = 9, .adv_w = 178, .box_w = 11, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 26, .adv_w = 107, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 34, .adv_w = 166, .box_w = 8, .box_h = 12, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 46, .adv_w = 146, .box_w = 9, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 60, .adv_w = 45, .box_w = 2, .box_h = 4, .ofs_x = 2, .ofs_y = 8},
    {.bitmap_index = 61, .adv_w = 67, .box_w = 5, .box_h = 15, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 71, .adv_w = 68, .box_w = 5, .box_h = 15, .ofs_x = 0, .ofs_y = -2},
    {.bitmap_index = 81, .adv_w = 82, .box_w = 4, .box_h = 5, .ofs_x = 2, .ofs_y = 8},
    {.bitmap_index = 84, .adv_w = 66, .box_w = 4, .box_h = 5, .ofs_x = 1, .ofs_y = 3},
    {.bitmap_index = 87, .adv_w = 42, .box_w = 2, .box_h = 3, .ofs_x = 0, .ofs_y = -1},
    {.bitmap_index = 88, .adv_w = 91, .box_w = 4, .box_h = 1, .ofs_x = 2, .ofs_y = 5},
    {.bitmap_index = 89, .adv_w = 48, .box_w = 1, .box_h = 1, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 90, .adv_w = 101, .box_w = 8, .box_h = 15, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 105, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 114, .adv_w = 112, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 122, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 131, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 140, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 149, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 158, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 167, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 176, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 185, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 194, .adv_w = 49, .box_w = 3, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 198, .adv_w = 42, .box_w = 4, .box_h = 10, .ofs_x = 0, .ofs_y = -1},
    {.bitmap_index = 203, .adv_w = 64, .box_w = 4, .box_h = 8, .ofs_x = 1, .ofs_y = 1},
    {.bitmap_index = 207, .adv_w = 99, .box_w = 5, .box_h = 3, .ofs_x = 2, .ofs_y = 4},
    {.bitmap_index = 209, .adv_w = 64, .box_w = 4, .box_h = 8, .ofs_x = 1, .ofs_y = 1},
    {.bitmap_index = 213, .adv_w = 92, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 222, .adv_w = 151, .box_w = 9, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 233, .adv_w = 118, .box_w = 7, .box_h = 12, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 244, .adv_w = 118, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 255, .adv_w = 103, .box_w = 6, .box_h = 12, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 264, .adv_w = 128, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 275, .adv_w = 105, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 286, .adv_w = 102, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 297, .adv_w = 121, .box_w = 6, .box_h = 12, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 306, .adv_w = 124, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 317, .adv_w = 58, .box_w = 3, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 322, .adv_w = 67, .box_w = 5, .box_h = 15, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 332, .adv_w = 112, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 343, .adv_w = 98, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 351, .adv_w = 159, .box_w = 10, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 366, .adv_w = 124, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 377, .adv_w = 131, .box_w = 6, .box_h = 12, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 386, .adv_w = 125, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 397, .adv_w = 127, .box_w = 8, .box_h = 15, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 412, .adv_w = 123, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 423, .adv_w = 106, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 432, .adv_w = 91, .box_w = 5, .box_h = 12, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 440, .adv_w = 127, .box_w = 7, .box_h = 12, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 451, .adv_w = 113, .box_w = 6, .box_h = 12, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 460, .adv_w = 156, .box_w = 10, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 475, .adv_w = 104, .box_w = 8, .box_h = 12, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 487, .adv_w = 102, .box_w = 6, .box_h = 12, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 496, .adv_w = 101, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 507, .adv_w = 55, .box_w = 4, .box_h = 14, .ofs_x = 1, .ofs_y = -1},
    {.bitmap_index = 514, .adv_w = 101, .box_w = 4, .box_h = 15, .ofs_x = 2, .ofs_y = -3},
    {.bitmap_index = 522, .adv_w = 55, .box_w = 4, .box_h = 14, .ofs_x = 0, .ofs_y = -1},
    {.bitmap_index = 529, .adv_w = 112, .box_w = 6, .box_h = 2, .ofs_x = 2, .ofs_y = 10},
    {.bitmap_index = 531, .adv_w = 167, .box_w = 9, .box_h = 1, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 533, .adv_w = 47, .box_w = 2, .box_h = 2, .ofs_x = 2, .ofs_y = 10},
    {.bitmap_index = 534, .adv_w = 100, .box_w = 6, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 541, .adv_w = 101, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 550, .adv_w = 83, .box_w = 5, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 556, .adv_w = 106, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 565, .adv_w = 96, .box_w = 5, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 571, .adv_w = 63, .box_w = 7, .box_h = 15, .ofs_x = -1, .ofs_y = -3},
    {.bitmap_index = 585, .adv_w = 101, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 594, .adv_w = 107, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 603, .adv_w = 51, .box_w = 3, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 608, .adv_w = 52, .box_w = 5, .box_h = 15, .ofs_x = -1, .ofs_y = -3},
    {.bitmap_index = 618, .adv_w = 97, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 627, .adv_w = 50, .box_w = 3, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 632, .adv_w = 159, .box_w = 9, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 643, .adv_w = 106, .box_w = 6, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 650, .adv_w = 102, .box_w = 6, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 657, .adv_w = 109, .box_w = 7, .box_h = 12, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 668, .adv_w = 105, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 677, .adv_w = 73, .box_w = 4, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 682, .adv_w = 87, .box_w = 5, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 688, .adv_w = 62, .box_w = 4, .box_h = 11, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 694, .adv_w = 107, .box_w = 6, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 701, .adv_w = 89, .box_w = 5, .box_h = 9, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 707, .adv_w = 145, .box_w = 8, .box_h = 9, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 716, .adv_w = 86, .box_w = 6, .box_h = 9, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 723, .adv_w = 86, .box_w = 6, .box_h = 12, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 732, .adv_w = 91, .box_w = 5, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 738, .adv_w = 65, .box_w = 5, .box_h = 14, .ofs_x = 1, .ofs_y = -1},
    {.bitmap_index = 747, .adv_w = 52, .box_w = 3, .box_h = 15, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 753, .adv_w = 65, .box_w = 5, .box_h = 14, .ofs_x = 0, .ofs_y = -1},
    {.bitmap_index = 762, .adv_w = 103, .box_w = 4, .box_h = 1, .ofs_x = 2, .ofs_y = 5}
};

/*---------------------
 *  CHARACTER MAPPING
 *--------------------*/



/*Collect the unicode lists and glyph_id offsets*/
static const lv_font_fmt_txt_cmap_t cmaps[] =
{
    {
        .range_start = 32, .range_length = 95, .glyph_id_start = 1,
        .unicode_list = NULL, .glyph_id_ofs_list = NULL, .list_length = 0, .type = LV_FONT_FMT_TXT_CMAP_FORMAT0_TINY
    }
};

/*-----------------
 *    KERNING
 *----------------*/


/*Pair left and right glyphs for kerning*/
static const uint8_t kern_pair_glyph_ids[] =
{
    21, 22,
    34, 36,
    34, 52,
    34, 56,
    34, 87,
    39, 66,
    39, 70,
    39, 74,
    39, 80,
    41, 66,
    42, 55,
    44, 34,
    44, 66,
    44, 70,
    44, 74,
    44, 80,
    44, 86,
    48, 55,
    48, 66,
    48, 70,
    48, 74,
    48, 86,
    49, 34,
    49, 66,
    49, 70,
    49, 74,
    49, 80,
    49, 86,
    51, 66,
    51, 70,
    51, 74,
    51, 80,
    51, 86,
    53, 66,
    53, 70,
    53, 74,
    53, 80,
    53, 86,
    55, 34,
    55, 38,
    55, 42,
    55, 48,
    55, 54,
    55, 55,
    55, 66,
    55, 70,
    55, 74,
    55, 80,
    55, 86,
    56, 34,
    56, 66,
    56, 70,
    56, 74,
    56, 80,
    56, 86,
    57, 66,
    57, 70,
    57, 80,
    57, 86,
    66, 37,
    66, 48,
    66, 53,
    66, 55,
    66, 56,
    66, 77,
    66, 83,
    66, 84,
    66, 85,
    66, 87,
    66, 90,
    67, 86,
    68, 68,
    68, 73,
    68, 74,
    68, 80,
    69, 74,
    69, 80,
    70, 48,
    70, 53,
    70, 55,
    70, 56,
    70, 72,
    70, 79,
    71, 66,
    72, 66,
    72, 80,
    74, 48,
    74, 53,
    74, 55,
    74, 56,
    74, 84,
    74, 87,
    74, 90,
    77, 72,
    77, 85,
    78, 67,
    80, 39,
    80, 44,
    80, 51,
    80, 53,
    80, 55,
    80, 56,
    80, 74,
    80, 79,
    80, 84,
    80, 90,
    81, 80,
    82, 86,
    83, 66,
    83, 69,
    83, 70,
    83, 72,
    83, 74,
    83, 80,
    83, 85,
    83, 86,
    84, 66,
    84, 78,
    85, 66,
    85, 74,
    86, 48,
    86, 55,
    86, 56,
    86, 84,
    86, 87,
    86, 90,
    87, 66,
    87, 74,
    90, 66,
    90, 74
};

/* Kerning between the respective left and right glyphs
 * 4.4 format which needs to scaled with `kern_scale`*/
static const int8_t kern_pair_values[] =
{
    -18, -6, -11, -4, -8, -4, -4, -4,
    -4, 3, 13, -11, -5, -8, -10, -10,
    -8, 8, -5, -5, -5, -5, -14, -14,
    -15, -11, -11, -12, -4, -4, -4, -4,
    -4, -10, -10, -5, -10, -10, -22, -16,
    -11, -13, -13, 8, -19, -20, -22, -22,
    -19, -8, -7, -8, -7, -10, -5, -3,
    -3, -3, -3, -8, -5, -10, -7, -7,
    -3, 4, -4, 1, -4, -4, 1, -7,
    -4, -5, -8, -5, -8, -5, -10, -7,
    -4, -4, -5, -3, 4, -10, -5, -10,
    -7, -4, -3, -5, -4, -14, 5, -4,
    -4, -3, -3, -10, -7, -10, -4, -4,
    -3, -5, -10, -3, -4, -6, -8, -10,
    -5, -11, 3, -4, 10, 4, 7, 1,
    -5, -7, -4, -11, -7, -7, 4, 5,
    4, 3
};

/*Collect the kern pair's data in one place*/
static const lv_font_fmt_txt_kern_pair_t kern_pairs =
{
    .glyph_ids = kern_pair_glyph_ids,
    .values = kern_pair_values,
    .pair_cnt = 130,
    .glyph_ids_size = 0
};

/*--------------------
 *  ALL CUSTOM DATA
 *--------------------*/

#if LVGL_VERSION_MAJOR == 8
/*Store all the custom data of the font*/
static  lv_font_fmt_txt_glyph_cache_t cache;
#endif

#if LVGL_VERSION_MAJOR >= 8
static const lv_font_fmt_txt_dsc_t font_dsc = {
#else
static lv_font_fmt_txt_dsc_t font_dsc = {
#endif
    .glyph_bitmap = glyph_bitmap,
    .glyph_dsc = glyph_dsc,
    .cmaps = cmaps,
    .kern_dsc = &kern_pairs,
    .kern_scale = 16,
    .cmap_num = 1,
    .bpp = 1,
    .kern_classes = 0,
    .bitmap_format = 0,
#if LVGL_VERSION_MAJOR == 8
    .cache = &cache
#endif
};



/*-----------------
 *  PUBLIC FONT
 *----------------*/

/*Initialize a public general font descriptor*/
#if LVGL_VERSION_MAJOR >= 8
const lv_font_t ui_font_Font8 = {
#else
lv_font_t ui_font_Font8 = {
#endif
    .get_glyph_dsc = lv_font_get_glyph_dsc_fmt_txt,    /*Function pointer to get glyph's data*/
    .get_glyph_bitmap = lv_font_get_bitmap_fmt_txt,    /*Function pointer to get glyph's bitmap*/
    .line_height = 16,          /*The maximum line height required by the font*/
    .base_line = 3,             /*Baseline measured from the bottom of the line*/
#if !(LVGL_VERSION_MAJOR == 6 && LVGL_VERSION_MINOR == 0)
    .subpx = LV_FONT_SUBPX_NONE,
#endif
#if LV_VERSION_CHECK(7, 4, 0) || LVGL_VERSION_MAJOR >= 8
    .underline_position = -1,
    .underline_thickness = 0,
#endif
    .dsc = &font_dsc,          /*The custom font data. Will be accessed by `get_glyph_bitmap/dsc` */
#if LV_VERSION_CHECK(8, 2, 0) || LVGL_VERSION_MAJOR >= 9
    .fallback = NULL,
#endif
    .user_data = NULL,
};



#endif /*#if UI_FONT_FONT8*/

