/*******************************************************************************
 * Size: 17 px
 * Bpp: 1
 * Opts: --bpp 1 --size 17 --font C:/Users/10User/Desktop/lilygoDesign/assets/Economica-Regular.ttf -o C:/Users/10User/Desktop/lilygoDesign/assets\ui_font_Font9.c --format lvgl -r 0x20-0x7f --no-compress --no-prefilter
 ******************************************************************************/

#include "ui.h"

#ifndef UI_FONT_FONT9
#define UI_FONT_FONT9 1
#endif

#if UI_FONT_FONT9

/*-----------------
 *    BITMAPS
 *----------------*/

/*Store the image of the glyphs*/
static LV_ATTRIBUTE_LARGE_CONST const uint8_t glyph_bitmap[] = {
    /* U+0020 " " */
    0x0,

    /* U+0021 "!" */
    0x55, 0x55, 0x43,

    /* U+0022 "\"" */
    0xaa, 0xa0,

    /* U+0023 "#" */
    0x6, 0x40, 0x88, 0x13, 0x4, 0x47, 0xfe, 0x32,
    0x4, 0x47, 0xfe, 0x22, 0x4, 0x81, 0x10, 0x26,
    0x0,

    /* U+0024 "$" */
    0x2, 0xe8, 0x84, 0x21, 0x11, 0xf2, 0x20,

    /* U+0025 "%" */
    0xe2, 0xa4, 0xa4, 0xa8, 0xe8, 0x8, 0x10, 0x17,
    0x25, 0x25, 0x25, 0x47,

    /* U+0026 "&" */
    0x71, 0x2, 0x4, 0x8, 0x4d, 0xf1, 0x42, 0x85,
    0xb, 0x33, 0xc0,

    /* U+0027 "'" */
    0xa8,

    /* U+0028 "(" */
    0x72, 0x49, 0x24, 0x92, 0x49, 0x18,

    /* U+0029 ")" */
    0xc8, 0x92, 0x49, 0x24, 0x92, 0xf0,

    /* U+002A "*" */
    0x2, 0xbe, 0xc0, 0x0,

    /* U+002B "+" */
    0x4b, 0xa4,

    /* U+002C "," */
    0xa8,

    /* U+002D "-" */
    0xf0,

    /* U+002E "." */
    0x80,

    /* U+002F "/" */
    0x4, 0x10, 0x82, 0x8, 0x41, 0x4, 0x20, 0x82,
    0x10, 0x41, 0x8, 0x0,

    /* U+0030 "0" */
    0x74, 0x63, 0x18, 0xc6, 0x31, 0x8c, 0x62, 0xe0,

    /* U+0031 "1" */
    0x61, 0x8, 0x42, 0x10, 0x84, 0x21, 0x9, 0xf0,

    /* U+0032 "2" */
    0xf0, 0x42, 0x11, 0x11, 0x10, 0x84, 0x21, 0xf0,

    /* U+0033 "3" */
    0xf2, 0x24, 0x71, 0x11, 0x11, 0x1e,

    /* U+0034 "4" */
    0x8, 0x61, 0x8a, 0x29, 0x24, 0x9f, 0x8, 0x20,
    0x82,

    /* U+0035 "5" */
    0xf8, 0x88, 0xf1, 0x11, 0x11, 0x1f,

    /* U+0036 "6" */
    0x7e, 0x21, 0xf, 0x46, 0x31, 0x8c, 0x62, 0xe0,

    /* U+0037 "7" */
    0xf8, 0x44, 0x21, 0x10, 0x84, 0x42, 0x31, 0x0,

    /* U+0038 "8" */
    0x74, 0x63, 0x18, 0xbb, 0x71, 0x8c, 0x72, 0xe0,

    /* U+0039 "9" */
    0x74, 0x63, 0x18, 0xc6, 0x2f, 0x8, 0x45, 0xe0,

    /* U+003A ":" */
    0x80, 0x80,

    /* U+003B ";" */
    0x81, 0xc0,

    /* U+003C "<" */
    0x29, 0x48, 0x91,

    /* U+003D "=" */
    0xf8, 0x3e,

    /* U+003E ">" */
    0x89, 0x12, 0x94,

    /* U+003F "?" */
    0xe1, 0x11, 0x32, 0x48, 0x80, 0x8,

    /* U+0040 "@" */
    0xff, 0x81, 0xb9, 0xa9, 0xa9, 0xbf, 0x80, 0x80,
    0x7c,

    /* U+0041 "A" */
    0x10, 0x60, 0xc1, 0x42, 0x89, 0x12, 0x3e, 0x45,
    0x8a, 0x14, 0x20,

    /* U+0042 "B" */
    0xf4, 0x63, 0x18, 0xfa, 0x31, 0x8c, 0x63, 0xe0,

    /* U+0043 "C" */
    0x7e, 0x21, 0x8, 0x42, 0x10, 0x84, 0x30, 0xf0,

    /* U+0044 "D" */
    0xfa, 0x38, 0x61, 0x86, 0x18, 0x61, 0x86, 0x18,
    0xfe,

    /* U+0045 "E" */
    0xf4, 0x21, 0x8, 0x7a, 0x10, 0x84, 0x21, 0xf0,

    /* U+0046 "F" */
    0xf8, 0x88, 0x8f, 0x88, 0x88, 0x88,

    /* U+0047 "G" */
    0x7e, 0x21, 0x8, 0x42, 0x31, 0x8c, 0x72, 0xf0,

    /* U+0048 "H" */
    0x8c, 0x63, 0x18, 0xfe, 0x31, 0x8c, 0x63, 0x10,

    /* U+0049 "I" */
    0xff, 0xf0,

    /* U+004A "J" */
    0x24, 0x92, 0x49, 0x24, 0x92, 0xf0,

    /* U+004B "K" */
    0x8c, 0xa5, 0x6a, 0x73, 0x94, 0xb4, 0xa7, 0x10,

    /* U+004C "L" */
    0x88, 0x88, 0x88, 0x88, 0x88, 0x8f,

    /* U+004D "M" */
    0x83, 0x8f, 0x1e, 0x5a, 0xb6, 0x64, 0xc1, 0x83,
    0x6, 0xc, 0x10,

    /* U+004E "N" */
    0x8e, 0x73, 0x9c, 0xd6, 0xb5, 0x9c, 0xe7, 0x10,

    /* U+004F "O" */
    0x79, 0x28, 0x61, 0x86, 0x18, 0x61, 0x86, 0x14,
    0x9e,

    /* U+0050 "P" */
    0xf4, 0x63, 0x18, 0xfa, 0x10, 0x84, 0x21, 0x0,

    /* U+0051 "Q" */
    0x78, 0x24, 0x21, 0x10, 0x88, 0x44, 0x22, 0x11,
    0x8, 0x84, 0x42, 0x12, 0xf, 0x2, 0x3, 0x0,
    0x7e,

    /* U+0052 "R" */
    0xf2, 0x28, 0xa2, 0x8b, 0xeb, 0x24, 0x92, 0x28,
    0xa1,

    /* U+0053 "S" */
    0x74, 0x21, 0x4, 0x10, 0x41, 0x8, 0x43, 0xe0,

    /* U+0054 "T" */
    0xf9, 0x8, 0x42, 0x10, 0x84, 0x21, 0x8, 0x40,

    /* U+0055 "U" */
    0x8c, 0x63, 0x18, 0xc6, 0x31, 0x8c, 0x62, 0xe0,

    /* U+0056 "V" */
    0x86, 0x18, 0x52, 0x49, 0x24, 0x92, 0x30, 0xc3,
    0xc,

    /* U+0057 "W" */
    0x80, 0xc0, 0x60, 0x31, 0x39, 0x92, 0xc9, 0x54,
    0xaa, 0x55, 0x33, 0x18, 0x84, 0x40,

    /* U+0058 "X" */
    0x45, 0x14, 0x8a, 0x30, 0xc3, 0xc, 0x29, 0x24,
    0x91,

    /* U+0059 "Y" */
    0x8a, 0x25, 0x94, 0x50, 0x82, 0x8, 0x20, 0x82,
    0x8,

    /* U+005A "Z" */
    0xf8, 0x44, 0x23, 0x10, 0x88, 0x42, 0x21, 0xf0,

    /* U+005B "[" */
    0xea, 0xaa, 0xaa, 0xb0,

    /* U+005C "\\" */
    0x81, 0x4, 0x10, 0x20, 0x82, 0x4, 0x10, 0x40,
    0x82, 0x8, 0x10, 0x40,

    /* U+005D "]" */
    0xd5, 0x55, 0x55, 0x70,

    /* U+005E "^" */
    0x33, 0x30,

    /* U+005F "_" */
    0xff,

    /* U+0060 "`" */
    0xc8,

    /* U+0061 "a" */
    0xf1, 0x17, 0x99, 0x99, 0xf0,

    /* U+0062 "b" */
    0x84, 0x21, 0xe8, 0xc6, 0x31, 0x8c, 0x63, 0xe0,

    /* U+0063 "c" */
    0x78, 0x88, 0x88, 0x88, 0x70,

    /* U+0064 "d" */
    0x8, 0x42, 0xf8, 0xc6, 0x31, 0x8c, 0x62, 0xf0,

    /* U+0065 "e" */
    0x79, 0x99, 0xf8, 0x88, 0x70,

    /* U+0066 "f" */
    0x74, 0x4e, 0x44, 0x44, 0x44, 0x44, 0x44, 0x40,

    /* U+0067 "g" */
    0x7c, 0x63, 0x18, 0xbe, 0x10, 0xf8, 0x42, 0xf0,

    /* U+0068 "h" */
    0x84, 0x21, 0xe8, 0xc6, 0x31, 0x8c, 0x63, 0x10,

    /* U+0069 "i" */
    0x9f, 0xf0,

    /* U+006A "j" */
    0x20, 0x12, 0x49, 0x24, 0x92, 0x70,

    /* U+006B "k" */
    0x84, 0x21, 0x2b, 0x53, 0x98, 0xa5, 0x25, 0x20,

    /* U+006C "l" */
    0xff, 0xf0,

    /* U+006D "m" */
    0xf7, 0xc4, 0x62, 0x31, 0x18, 0x8c, 0x46, 0x23,
    0x11, 0x88, 0x80,

    /* U+006E "n" */
    0xf4, 0x63, 0x18, 0xc6, 0x31, 0x88,

    /* U+006F "o" */
    0x74, 0x63, 0x18, 0xc6, 0x31, 0x70,

    /* U+0070 "p" */
    0xf4, 0xe3, 0x18, 0xc6, 0x31, 0xf4, 0x21, 0x0,

    /* U+0071 "q" */
    0x7c, 0x63, 0x18, 0xc6, 0x31, 0x78, 0x42, 0x10,

    /* U+0072 "r" */
    0xba, 0x49, 0x24, 0x80,

    /* U+0073 "s" */
    0xf8, 0x84, 0x21, 0x11, 0xe0,

    /* U+0074 "t" */
    0x4, 0xe4, 0x44, 0x44, 0x44, 0x70,

    /* U+0075 "u" */
    0x8c, 0x63, 0x18, 0xc6, 0x33, 0x68,

    /* U+0076 "v" */
    0x8c, 0x52, 0xa5, 0x29, 0x4a, 0x20,

    /* U+0077 "w" */
    0x81, 0x99, 0x99, 0x9a, 0xaa, 0x6a, 0x6a, 0x66,
    0x66,

    /* U+0078 "x" */
    0x99, 0x66, 0x66, 0x99, 0x90,

    /* U+0079 "y" */
    0x8c, 0x52, 0xa5, 0x29, 0x46, 0x21, 0x9, 0x80,

    /* U+007A "z" */
    0xf8, 0x84, 0x42, 0x21, 0x10, 0xf0,

    /* U+007B "{" */
    0x69, 0x25, 0x24, 0x89, 0x24, 0xc0,

    /* U+007C "|" */
    0xff, 0xfe,

    /* U+007D "}" */
    0xc9, 0x24, 0x49, 0x49, 0x25, 0x80,

    /* U+007E "~" */
    0xf0
};


/*---------------------
 *  GLYPH DESCRIPTION
 *--------------------*/

static const lv_font_fmt_txt_glyph_dsc_t glyph_dsc[] = {
    {.bitmap_index = 0, .adv_w = 0, .box_w = 0, .box_h = 0, .ofs_x = 0, .ofs_y = 0} /* id = 0 reserved */,
    {.bitmap_index = 0, .adv_w = 52, .box_w = 1, .box_h = 1, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 1, .adv_w = 44, .box_w = 2, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 4, .adv_w = 90, .box_w = 4, .box_h = 4, .ofs_x = 1, .ofs_y = 8},
    {.bitmap_index = 6, .adv_w = 178, .box_w = 11, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 23, .adv_w = 107, .box_w = 4, .box_h = 13, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 30, .adv_w = 166, .box_w = 8, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 42, .adv_w = 146, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 53, .adv_w = 45, .box_w = 2, .box_h = 4, .ofs_x = 1, .ofs_y = 8},
    {.bitmap_index = 54, .adv_w = 67, .box_w = 3, .box_h = 15, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 60, .adv_w = 68, .box_w = 3, .box_h = 15, .ofs_x = 0, .ofs_y = -2},
    {.bitmap_index = 66, .adv_w = 82, .box_w = 5, .box_h = 5, .ofs_x = 0, .ofs_y = 8},
    {.bitmap_index = 70, .adv_w = 66, .box_w = 3, .box_h = 5, .ofs_x = 1, .ofs_y = 3},
    {.bitmap_index = 72, .adv_w = 42, .box_w = 2, .box_h = 3, .ofs_x = 1, .ofs_y = -1},
    {.bitmap_index = 73, .adv_w = 91, .box_w = 4, .box_h = 1, .ofs_x = 1, .ofs_y = 5},
    {.bitmap_index = 74, .adv_w = 48, .box_w = 1, .box_h = 1, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 75, .adv_w = 101, .box_w = 6, .box_h = 15, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 87, .adv_w = 112, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 95, .adv_w = 112, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 103, .adv_w = 112, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 111, .adv_w = 112, .box_w = 4, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 117, .adv_w = 112, .box_w = 6, .box_h = 12, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 126, .adv_w = 112, .box_w = 4, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 132, .adv_w = 112, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 140, .adv_w = 112, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 148, .adv_w = 112, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 156, .adv_w = 112, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 164, .adv_w = 49, .box_w = 1, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 166, .adv_w = 42, .box_w = 1, .box_h = 10, .ofs_x = 1, .ofs_y = -1},
    {.bitmap_index = 168, .adv_w = 64, .box_w = 3, .box_h = 8, .ofs_x = 0, .ofs_y = 1},
    {.bitmap_index = 171, .adv_w = 99, .box_w = 5, .box_h = 3, .ofs_x = 1, .ofs_y = 4},
    {.bitmap_index = 173, .adv_w = 64, .box_w = 3, .box_h = 8, .ofs_x = 1, .ofs_y = 1},
    {.bitmap_index = 176, .adv_w = 92, .box_w = 4, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 182, .adv_w = 151, .box_w = 8, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 191, .adv_w = 118, .box_w = 7, .box_h = 12, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 202, .adv_w = 115, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 210, .adv_w = 103, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 218, .adv_w = 128, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 227, .adv_w = 105, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 235, .adv_w = 102, .box_w = 4, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 241, .adv_w = 121, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 249, .adv_w = 124, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 257, .adv_w = 58, .box_w = 1, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 259, .adv_w = 67, .box_w = 3, .box_h = 15, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 265, .adv_w = 112, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 273, .adv_w = 98, .box_w = 4, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 279, .adv_w = 159, .box_w = 7, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 290, .adv_w = 124, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 298, .adv_w = 131, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 307, .adv_w = 125, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 315, .adv_w = 127, .box_w = 9, .box_h = 15, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 332, .adv_w = 123, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 341, .adv_w = 106, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 349, .adv_w = 91, .box_w = 5, .box_h = 12, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 357, .adv_w = 127, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 365, .adv_w = 113, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 374, .adv_w = 166, .box_w = 9, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 388, .adv_w = 104, .box_w = 6, .box_h = 12, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 397, .adv_w = 102, .box_w = 6, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 406, .adv_w = 101, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 414, .adv_w = 55, .box_w = 2, .box_h = 14, .ofs_x = 1, .ofs_y = -1},
    {.bitmap_index = 418, .adv_w = 101, .box_w = 6, .box_h = 15, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 430, .adv_w = 55, .box_w = 2, .box_h = 14, .ofs_x = 0, .ofs_y = -1},
    {.bitmap_index = 434, .adv_w = 112, .box_w = 6, .box_h = 2, .ofs_x = 1, .ofs_y = 10},
    {.bitmap_index = 436, .adv_w = 167, .box_w = 8, .box_h = 1, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 437, .adv_w = 47, .box_w = 3, .box_h = 2, .ofs_x = 0, .ofs_y = 10},
    {.bitmap_index = 438, .adv_w = 93, .box_w = 4, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 443, .adv_w = 101, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 451, .adv_w = 85, .box_w = 4, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 456, .adv_w = 103, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 464, .adv_w = 96, .box_w = 4, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 469, .adv_w = 63, .box_w = 4, .box_h = 15, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 477, .adv_w = 108, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 485, .adv_w = 107, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 493, .adv_w = 55, .box_w = 1, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 495, .adv_w = 52, .box_w = 3, .box_h = 15, .ofs_x = -1, .ofs_y = -3},
    {.bitmap_index = 501, .adv_w = 97, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 509, .adv_w = 49, .box_w = 1, .box_h = 12, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 511, .adv_w = 164, .box_w = 9, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 522, .adv_w = 106, .box_w = 5, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 528, .adv_w = 102, .box_w = 5, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 534, .adv_w = 103, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 542, .adv_w = 105, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 550, .adv_w = 73, .box_w = 3, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 554, .adv_w = 91, .box_w = 4, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 559, .adv_w = 62, .box_w = 4, .box_h = 11, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 565, .adv_w = 105, .box_w = 5, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 571, .adv_w = 89, .box_w = 5, .box_h = 9, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 577, .adv_w = 145, .box_w = 8, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 586, .adv_w = 86, .box_w = 4, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 591, .adv_w = 86, .box_w = 5, .box_h = 12, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 599, .adv_w = 91, .box_w = 5, .box_h = 9, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 605, .adv_w = 65, .box_w = 3, .box_h = 14, .ofs_x = 1, .ofs_y = -1},
    {.bitmap_index = 611, .adv_w = 52, .box_w = 1, .box_h = 15, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 613, .adv_w = 65, .box_w = 3, .box_h = 14, .ofs_x = 1, .ofs_y = -1},
    {.bitmap_index = 619, .adv_w = 103, .box_w = 4, .box_h = 1, .ofs_x = 1, .ofs_y = 5}
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
    34, 36,
    34, 52,
    34, 56,
    34, 87,
    39, 66,
    39, 70,
    39, 74,
    39, 80,
    44, 34,
    44, 66,
    44, 70,
    44, 74,
    44, 80,
    44, 86,
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
    66, 48,
    66, 53,
    66, 55,
    66, 56,
    68, 73,
    68, 74,
    70, 48,
    70, 53,
    70, 55,
    70, 56,
    71, 66,
    74, 48,
    74, 53,
    74, 55,
    74, 56,
    77, 85,
    80, 39,
    80, 44,
    80, 51,
    80, 53,
    80, 55,
    80, 56,
    80, 74,
    81, 66,
    82, 86,
    83, 66,
    83, 85,
    84, 66,
    84, 74,
    84, 84,
    85, 74,
    86, 48,
    86, 55,
    86, 56
};

/* Kerning between the respective left and right glyphs
 * 4.4 format which needs to scaled with `kern_scale`*/
static const int8_t kern_pair_values[] =
{
    -6, -11, -14, -8, -4, -4, -4, -4,
    -11, -5, -8, -10, -10, -8, -5, -5,
    -5, -5, -14, -14, -15, -11, -11, -12,
    -4, -4, -4, -4, -4, -10, -10, -5,
    -10, -10, -8, -7, -7, -7, -7, -7,
    -8, -7, -8, -7, -10, -5, -3, -3,
    -3, -3, -5, -10, -7, -7, -4, -5,
    -5, -10, -7, -4, -3, -5, -10, -7,
    -4, 5, -4, -3, -3, -10, -7, -10,
    -4, -3, -3, -5, 3, -7, -7, -7,
    -1, -5, -7, -4
};

/*Collect the kern pair's data in one place*/
static const lv_font_fmt_txt_kern_pair_t kern_pairs =
{
    .glyph_ids = kern_pair_glyph_ids,
    .values = kern_pair_values,
    .pair_cnt = 84,
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
const lv_font_t ui_font_Font9 = {
#else
lv_font_t ui_font_Font9 = {
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



#endif /*#if UI_FONT_FONT9*/

