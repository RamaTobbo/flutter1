/*******************************************************************************
 * Size: 21 px
 * Bpp: 1
 * Opts: --bpp 1 --size 21 --font C:/Users/10User/Desktop/lilygoDesign/assets/BigShouldersText-Regular.ttf -o C:/Users/10User/Desktop/lilygoDesign/assets\ui_font_Font2.c --format lvgl -r 0x20-0x7f --no-compress --no-prefilter
 ******************************************************************************/

#include "ui.h"

#ifndef UI_FONT_FONT2
#define UI_FONT_FONT2 1
#endif

#if UI_FONT_FONT2

/*-----------------
 *    BITMAPS
 *----------------*/

/*Store the image of the glyphs*/
static LV_ATTRIBUTE_LARGE_CONST const uint8_t glyph_bitmap[] = {
    /* U+0020 " " */
    0x0,

    /* U+0021 "!" */
    0xdb, 0x6d, 0xb6, 0xdb, 0x6c, 0x7, 0xe0,

    /* U+0022 "\"" */
    0xde, 0xf7, 0xb0,

    /* U+0023 "#" */
    0x4, 0x41, 0x98, 0x33, 0x6, 0x60, 0x88, 0xff,
    0xc6, 0x60, 0x88, 0x33, 0x6, 0x60, 0xcc, 0x7f,
    0xc6, 0x60, 0xcc, 0x19, 0x2, 0x20, 0xcc, 0x0,

    /* U+0024 "$" */
    0x30, 0xc7, 0xb3, 0xcf, 0x3c, 0xf3, 0xc3, 0x87,
    0x87, 0xf, 0x3c, 0xf3, 0xcf, 0x3f, 0xcc, 0x30,

    /* U+0025 "%" */
    0xf1, 0x48, 0xa4, 0x52, 0x49, 0x24, 0xa2, 0x51,
    0xc8, 0x8, 0x5, 0xc4, 0xa2, 0x53, 0x29, 0x14,
    0x8a, 0x85, 0x43, 0x80,

    /* U+0026 "&" */
    0x78, 0x66, 0x33, 0x19, 0x8c, 0xc2, 0xc1, 0xe0,
    0x60, 0x60, 0x3b, 0x35, 0x9b, 0xcc, 0xe6, 0x73,
    0x1d, 0x9e, 0x7d, 0x0,

    /* U+0027 "'" */
    0xff,

    /* U+0028 "(" */
    0x11, 0x88, 0xc6, 0x33, 0x18, 0xc6, 0x31, 0x8c,
    0x63, 0xc, 0x63, 0x8, 0x61, 0x0,

    /* U+0029 ")" */
    0x43, 0x8, 0x63, 0x18, 0x63, 0x18, 0xc6, 0x31,
    0x8c, 0x66, 0x31, 0x88, 0xc4, 0x0,

    /* U+002A "*" */
    0x23, 0x9e, 0x40,

    /* U+002B "+" */
    0x18, 0x30, 0x67, 0xf1, 0x83, 0x6, 0x0,

    /* U+002C "," */
    0xfd, 0xa4,

    /* U+002D "-" */
    0xfc,

    /* U+002E "." */
    0xfc,

    /* U+002F "/" */
    0xc, 0x30, 0x86, 0x18, 0x61, 0x4, 0x30, 0xc3,
    0x8, 0x61, 0x86, 0x18, 0x43, 0xc, 0x30, 0x80,

    /* U+0030 "0" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0031 "1" */
    0x7d, 0xb6, 0xdb, 0x6d, 0xb6, 0xdb, 0x60,

    /* U+0032 "2" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xc1, 0x87, 0x1c,
    0xf1, 0xc7, 0xc, 0x18, 0x30, 0x60, 0xfe,

    /* U+0033 "3" */
    0xfe, 0xc, 0x30, 0x61, 0x82, 0xc, 0x1e, 0x6,
    0xc, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0034 "4" */
    0x1c, 0x38, 0xf1, 0x62, 0xc5, 0x9b, 0x26, 0x4d,
    0x9b, 0x37, 0xf0, 0xc1, 0x83, 0x6, 0xc,

    /* U+0035 "5" */
    0xff, 0x83, 0x6, 0xc, 0x18, 0x30, 0x6e, 0xe6,
    0xc, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0036 "6" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf0, 0x6e, 0xe7,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0037 "7" */
    0xfe, 0xc, 0x18, 0x20, 0xc1, 0x83, 0xc, 0x18,
    0x30, 0x61, 0x83, 0x6, 0x8, 0x30, 0x60,

    /* U+0038 "8" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0x9c, 0xc5,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0039 "9" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc6,
    0xec, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+003A ":" */
    0xfc, 0x0, 0x3f,

    /* U+003B ";" */
    0xfc, 0x0, 0x7, 0xed, 0x20,

    /* U+003C "<" */
    0x1, 0x7f, 0x80, 0xfc, 0xf,

    /* U+003D "=" */
    0xfe, 0x0, 0x7, 0xf0,

    /* U+003E ">" */
    0x80, 0xff, 0x1, 0x3f, 0xf0,

    /* U+003F "?" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xc1, 0x83, 0x1e,
    0x70, 0xc1, 0x83, 0x0, 0x0, 0x38, 0x70,

    /* U+0040 "@" */
    0x3f, 0x38, 0x6c, 0xf, 0x3, 0xfe, 0xfd, 0xbf,
    0x6f, 0xdb, 0xf6, 0xfd, 0xbf, 0x6f, 0xdb, 0xff,
    0xb0, 0xc, 0xf, 0x3, 0xe1, 0xcf, 0xc0,

    /* U+0041 "A" */
    0x78, 0xd1, 0xa2, 0x44, 0x89, 0x12, 0x26, 0xcd,
    0x9b, 0x37, 0xec, 0xd8, 0xa1, 0x42, 0x86,

    /* U+0042 "B" */
    0xfd, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xf9,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xfc,

    /* U+0043 "C" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf0, 0x60, 0xc1,
    0x83, 0x6, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0044 "D" */
    0xfd, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xfc,

    /* U+0045 "E" */
    0xff, 0xc, 0x30, 0xc3, 0xc, 0x30, 0xff, 0xc,
    0x30, 0xc3, 0xc, 0x30, 0xfc,

    /* U+0046 "F" */
    0xff, 0xc, 0x30, 0xc3, 0xc, 0x30, 0xff, 0xc,
    0x30, 0xc3, 0xc, 0x30, 0xc0,

    /* U+0047 "G" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf0, 0x60, 0xc1,
    0x83, 0x3e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0048 "H" */
    0xc7, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xff,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc6,

    /* U+0049 "I" */
    0xff, 0xff, 0xff, 0xff, 0xc0,

    /* U+004A "J" */
    0xc, 0x30, 0xc3, 0xc, 0x30, 0xc3, 0xc, 0x30,
    0xf3, 0xcf, 0x3c, 0xf3, 0x78,

    /* U+004B "K" */
    0xc7, 0x8b, 0x36, 0x6c, 0x9b, 0x36, 0x68, 0xd9,
    0xf3, 0xa7, 0x6c, 0xd9, 0xb1, 0x63, 0xc6,

    /* U+004C "L" */
    0xc3, 0xc, 0x30, 0xc3, 0xc, 0x30, 0xc3, 0xc,
    0x30, 0xc3, 0xc, 0x30, 0xfc,

    /* U+004D "M" */
    0xf1, 0xfa, 0x2f, 0x45, 0xe8, 0xbd, 0x17, 0xa2,
    0xf6, 0xde, 0xdb, 0xdb, 0x7b, 0x6f, 0x29, 0xe5,
    0x3c, 0xa7, 0x94, 0xf2, 0x9e, 0x53, 0xce, 0x60,

    /* U+004E "N" */
    0xf3, 0xd3, 0xd3, 0xd3, 0xd3, 0xd3, 0xd3, 0xd3,
    0xdb, 0xdb, 0xcb, 0xcb, 0xcb, 0xcb, 0xcb, 0xcb,
    0xcf,

    /* U+004F "O" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0050 "P" */
    0xfb, 0x3c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcf, 0xec,
    0x30, 0xc3, 0xc, 0x30, 0xc0,

    /* U+0051 "Q" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c, 0x30,
    0x30, 0x20,

    /* U+0052 "R" */
    0xfb, 0x3c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcf, 0xed,
    0xb6, 0xcb, 0x2c, 0xf3, 0xcc,

    /* U+0053 "S" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf0, 0x78, 0x7c,
    0x3c, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0054 "T" */
    0xfe, 0x60, 0xc1, 0x83, 0x6, 0xc, 0x18, 0x30,
    0x60, 0xc1, 0x83, 0x6, 0xc, 0x18, 0x30,

    /* U+0055 "U" */
    0xc7, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0x7c,

    /* U+0056 "V" */
    0xc3, 0x8f, 0x1e, 0x34, 0x68, 0xd9, 0xb3, 0x66,
    0xc9, 0xb3, 0x66, 0xc5, 0x8b, 0x16, 0x3c,

    /* U+0057 "W" */
    0xe7, 0x3b, 0x29, 0x99, 0x4c, 0xdb, 0x66, 0xdb,
    0x36, 0xd9, 0xb6, 0xcd, 0xb6, 0x6d, 0xb3, 0x6d,
    0x9b, 0x6c, 0xdb, 0x66, 0xdb, 0x36, 0xd9, 0xb6,
    0xcd, 0x16, 0x38, 0xe0,

    /* U+0058 "X" */
    0x42, 0x8d, 0x9b, 0x32, 0x44, 0x8b, 0x16, 0x38,
    0x58, 0xb1, 0x26, 0x4c, 0xd9, 0xa3, 0x42,

    /* U+0059 "Y" */
    0x42, 0x42, 0x66, 0x66, 0x66, 0x66, 0x24, 0x24,
    0x24, 0x3c, 0x3c, 0x18, 0x18, 0x18, 0x18, 0x18,
    0x18,

    /* U+005A "Z" */
    0xfc, 0x30, 0xc2, 0x18, 0x61, 0x4, 0x30, 0xc2,
    0x18, 0x61, 0x8c, 0x30, 0xfc,

    /* U+005B "[" */
    0xfe, 0x31, 0x8c, 0x63, 0x18, 0xc6, 0x31, 0x8c,
    0x63, 0x18, 0xc6, 0x31, 0x8f, 0x80,

    /* U+005C "\\" */
    0xc3, 0xc, 0x10, 0x61, 0x86, 0x8, 0x20, 0xc3,
    0xc, 0x10, 0x61, 0x86, 0x8, 0x20, 0xc3, 0xc,

    /* U+005D "]" */
    0xf8, 0xc6, 0x31, 0x8c, 0x63, 0x18, 0xc6, 0x31,
    0x8c, 0x63, 0x18, 0xc6, 0x3f, 0x80,

    /* U+005E "^" */
    0x30, 0xc6, 0x92, 0xc4,

    /* U+005F "_" */
    0xff, 0xf8,

    /* U+0060 "`" */
    0x89, 0x80,

    /* U+0061 "a" */
    0x7b, 0x3c, 0xf3, 0xc, 0x77, 0xfb, 0xcf, 0x3c,
    0xf3, 0x7c,

    /* U+0062 "b" */
    0xc1, 0x83, 0x6, 0xd, 0xdc, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xf3, 0xdc,

    /* U+0063 "c" */
    0x7b, 0x3c, 0xf3, 0xc3, 0xc, 0x30, 0xc3, 0x3c,
    0xf3, 0x78,

    /* U+0064 "d" */
    0x6, 0xc, 0x18, 0x37, 0x79, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xef, 0x76,

    /* U+0065 "e" */
    0x7b, 0x3c, 0xf3, 0xcf, 0x3f, 0xf0, 0xc3, 0x3c,
    0xf3, 0x78,

    /* U+0066 "f" */
    0x3b, 0x18, 0xcf, 0xb1, 0x8c, 0x63, 0x18, 0xc6,
    0x31, 0x8c, 0x60,

    /* U+0067 "g" */
    0x7d, 0xc6, 0xc6, 0xc6, 0xc6, 0xc6, 0xc6, 0xc6,
    0xc6, 0x7c, 0x40, 0x40, 0x7c, 0x42, 0xc2, 0xc2,
    0x7c,

    /* U+0068 "h" */
    0xc1, 0x83, 0x6, 0xd, 0xdc, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc6,

    /* U+0069 "i" */
    0xc0, 0xff, 0xff, 0xff, 0xc0,

    /* U+006A "j" */
    0x18, 0x0, 0x1, 0x8c, 0x63, 0x18, 0xc6, 0x31,
    0x8c, 0x63, 0x18, 0xc6, 0x3f, 0x0,

    /* U+006B "k" */
    0xc1, 0x83, 0x6, 0xc, 0xd9, 0xb2, 0x6c, 0xd1,
    0xe3, 0xc7, 0xcd, 0x99, 0xb3, 0x62, 0xc6,

    /* U+006C "l" */
    0xff, 0xff, 0xff, 0xff, 0xc0,

    /* U+006D "m" */
    0xd9, 0xbb, 0xbc, 0xcf, 0x33, 0xcc, 0xf3, 0x3c,
    0xcf, 0x33, 0xcc, 0xf3, 0x3c, 0xcf, 0x33, 0xcc,
    0xc0,

    /* U+006E "n" */
    0xdd, 0xcf, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x3c, 0x60,

    /* U+006F "o" */
    0x7d, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x37, 0xc0,

    /* U+0070 "p" */
    0xdd, 0xcf, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1f, 0x3d, 0xd8, 0x30, 0x60, 0xc0,

    /* U+0071 "q" */
    0x77, 0x9f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x77, 0x60, 0xc1, 0x83, 0x6,

    /* U+0072 "r" */
    0xdf, 0x31, 0x8c, 0x63, 0x18, 0xc6, 0x31, 0x8c,
    0x0,

    /* U+0073 "s" */
    0x7b, 0x3c, 0xf3, 0xc3, 0x87, 0x87, 0xf, 0x3c,
    0xf3, 0x78,

    /* U+0074 "t" */
    0x63, 0x18, 0xcf, 0xb1, 0x8c, 0x63, 0x18, 0xc6,
    0x31, 0x8c, 0x38,

    /* U+0075 "u" */
    0xc7, 0x8f, 0x1e, 0x3c, 0x78, 0xf1, 0xe3, 0xc7,
    0x8f, 0x1e, 0x77, 0x60,

    /* U+0076 "v" */
    0xc6, 0x8d, 0x1a, 0x36, 0x4c, 0x99, 0x36, 0x2c,
    0x58, 0xb1, 0x43, 0x80,

    /* U+0077 "w" */
    0x8e, 0x31, 0x46, 0x28, 0xed, 0xbd, 0xb7, 0xb6,
    0xf6, 0xde, 0xdb, 0xdb, 0x6b, 0x69, 0x6d, 0x2c,
    0xa7, 0x1c,

    /* U+0078 "x" */
    0xc4, 0x89, 0xb3, 0x62, 0x85, 0xe, 0x14, 0x28,
    0xd9, 0xb2, 0x2c, 0x60,

    /* U+0079 "y" */
    0xc7, 0x8f, 0x12, 0x24, 0x49, 0x9b, 0x36, 0x6c,
    0xd0, 0xa1, 0x43, 0x83, 0x6, 0x8, 0xf0,

    /* U+007A "z" */
    0xfc, 0x30, 0x86, 0x18, 0xc3, 0x8, 0x61, 0x84,
    0x30, 0xfc,

    /* U+007B "{" */
    0xc, 0xe3, 0xc, 0x30, 0xc3, 0xc, 0x33, 0x8e,
    0xc, 0x30, 0xc3, 0xc, 0x30, 0xc3, 0x6, 0xc,

    /* U+007C "|" */
    0xff, 0xff, 0xff, 0xff, 0xff, 0xf0,

    /* U+007D "}" */
    0xc3, 0x8c, 0x63, 0x18, 0xc6, 0x30, 0xc6, 0x63,
    0x18, 0xc6, 0x31, 0x8c, 0xcc, 0x0,

    /* U+007E "~" */
    0x61, 0xfb, 0x8e
};


/*---------------------
 *  GLYPH DESCRIPTION
 *--------------------*/

static const lv_font_fmt_txt_glyph_dsc_t glyph_dsc[] = {
    {.bitmap_index = 0, .adv_w = 0, .box_w = 0, .box_h = 0, .ofs_x = 0, .ofs_y = 0} /* id = 0 reserved */,
    {.bitmap_index = 0, .adv_w = 70, .box_w = 1, .box_h = 1, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 1, .adv_w = 79, .box_w = 3, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 8, .adv_w = 105, .box_w = 5, .box_h = 4, .ofs_x = 1, .ofs_y = 13},
    {.bitmap_index = 11, .adv_w = 203, .box_w = 11, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 35, .adv_w = 135, .box_w = 6, .box_h = 21, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 51, .adv_w = 185, .box_w = 9, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 71, .adv_w = 172, .box_w = 9, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 91, .adv_w = 57, .box_w = 2, .box_h = 4, .ofs_x = 1, .ofs_y = 13},
    {.bitmap_index = 92, .adv_w = 88, .box_w = 5, .box_h = 21, .ofs_x = 1, .ofs_y = -4},
    {.bitmap_index = 106, .adv_w = 86, .box_w = 5, .box_h = 21, .ofs_x = 0, .ofs_y = -4},
    {.bitmap_index = 120, .adv_w = 89, .box_w = 5, .box_h = 4, .ofs_x = 0, .ofs_y = 13},
    {.bitmap_index = 123, .adv_w = 156, .box_w = 7, .box_h = 7, .ofs_x = 1, .ofs_y = 4},
    {.bitmap_index = 130, .adv_w = 72, .box_w = 3, .box_h = 5, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 132, .adv_w = 120, .box_w = 6, .box_h = 1, .ofs_x = 1, .ofs_y = 8},
    {.bitmap_index = 133, .adv_w = 70, .box_w = 3, .box_h = 2, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 134, .adv_w = 121, .box_w = 6, .box_h = 21, .ofs_x = 1, .ofs_y = -4},
    {.bitmap_index = 150, .adv_w = 138, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 165, .adv_w = 78, .box_w = 3, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 172, .adv_w = 134, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 187, .adv_w = 134, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 202, .adv_w = 134, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 217, .adv_w = 136, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 232, .adv_w = 138, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 247, .adv_w = 114, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 262, .adv_w = 135, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 277, .adv_w = 137, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 292, .adv_w = 71, .box_w = 3, .box_h = 8, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 295, .adv_w = 72, .box_w = 3, .box_h = 12, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 300, .adv_w = 168, .box_w = 8, .box_h = 5, .ofs_x = 1, .ofs_y = 6},
    {.bitmap_index = 305, .adv_w = 154, .box_w = 7, .box_h = 4, .ofs_x = 1, .ofs_y = 6},
    {.bitmap_index = 309, .adv_w = 163, .box_w = 8, .box_h = 5, .ofs_x = 1, .ofs_y = 6},
    {.bitmap_index = 314, .adv_w = 125, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 329, .adv_w = 185, .box_w = 10, .box_h = 18, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 352, .adv_w = 131, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 367, .adv_w = 138, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 382, .adv_w = 140, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 397, .adv_w = 140, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 412, .adv_w = 119, .box_w = 6, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 425, .adv_w = 118, .box_w = 6, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 438, .adv_w = 140, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 453, .adv_w = 144, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 468, .adv_w = 67, .box_w = 2, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 473, .adv_w = 126, .box_w = 6, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 486, .adv_w = 132, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 501, .adv_w = 111, .box_w = 6, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 514, .adv_w = 218, .box_w = 11, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 538, .adv_w = 169, .box_w = 8, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 555, .adv_w = 141, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 570, .adv_w = 130, .box_w = 6, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 583, .adv_w = 141, .box_w = 7, .box_h = 20, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 601, .adv_w = 136, .box_w = 6, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 614, .adv_w = 135, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 629, .adv_w = 113, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 644, .adv_w = 139, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 659, .adv_w = 133, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 674, .adv_w = 218, .box_w = 13, .box_h = 17, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 702, .adv_w = 124, .box_w = 7, .box_h = 17, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 717, .adv_w = 122, .box_w = 8, .box_h = 17, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 734, .adv_w = 108, .box_w = 6, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 747, .adv_w = 96, .box_w = 5, .box_h = 21, .ofs_x = 1, .ofs_y = -4},
    {.bitmap_index = 761, .adv_w = 110, .box_w = 6, .box_h = 21, .ofs_x = 0, .ofs_y = -4},
    {.bitmap_index = 777, .adv_w = 96, .box_w = 5, .box_h = 21, .ofs_x = 0, .ofs_y = -4},
    {.bitmap_index = 791, .adv_w = 132, .box_w = 6, .box_h = 5, .ofs_x = 1, .ofs_y = 10},
    {.bitmap_index = 795, .adv_w = 227, .box_w = 13, .box_h = 1, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 797, .adv_w = 85, .box_w = 3, .box_h = 3, .ofs_x = 1, .ofs_y = 14},
    {.bitmap_index = 799, .adv_w = 131, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 809, .adv_w = 137, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 824, .adv_w = 129, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 834, .adv_w = 138, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 849, .adv_w = 129, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 859, .adv_w = 92, .box_w = 5, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 870, .adv_w = 137, .box_w = 8, .box_h = 17, .ofs_x = 1, .ofs_y = -4},
    {.bitmap_index = 887, .adv_w = 140, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 902, .adv_w = 64, .box_w = 2, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 907, .adv_w = 64, .box_w = 5, .box_h = 21, .ofs_x = -2, .ofs_y = -4},
    {.bitmap_index = 921, .adv_w = 122, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 936, .adv_w = 64, .box_w = 2, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 941, .adv_w = 209, .box_w = 10, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 958, .adv_w = 140, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 970, .adv_w = 134, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 982, .adv_w = 137, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = -4},
    {.bitmap_index = 997, .adv_w = 137, .box_w = 7, .box_h = 17, .ofs_x = 1, .ofs_y = -4},
    {.bitmap_index = 1012, .adv_w = 96, .box_w = 5, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1021, .adv_w = 122, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1031, .adv_w = 91, .box_w = 5, .box_h = 17, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1042, .adv_w = 139, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1054, .adv_w = 118, .box_w = 7, .box_h = 13, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 1066, .adv_w = 195, .box_w = 11, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1084, .adv_w = 111, .box_w = 7, .box_h = 13, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 1096, .adv_w = 121, .box_w = 7, .box_h = 17, .ofs_x = 0, .ofs_y = -4},
    {.bitmap_index = 1111, .adv_w = 108, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1121, .adv_w = 108, .box_w = 6, .box_h = 21, .ofs_x = 0, .ofs_y = -4},
    {.bitmap_index = 1137, .adv_w = 62, .box_w = 2, .box_h = 22, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 1143, .adv_w = 108, .box_w = 5, .box_h = 21, .ofs_x = 1, .ofs_y = -4},
    {.bitmap_index = 1157, .adv_w = 161, .box_w = 8, .box_h = 3, .ofs_x = 1, .ofs_y = 7}
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
    1, 14,
    1, 34,
    1, 53,
    1, 55,
    1, 71,
    1, 85,
    1, 88,
    1, 89,
    1, 90,
    1, 91,
    11, 1,
    11, 43,
    11, 68,
    11, 69,
    11, 70,
    11, 78,
    11, 79,
    11, 80,
    11, 81,
    11, 82,
    11, 83,
    13, 11,
    13, 71,
    13, 90,
    14, 53,
    14, 55,
    14, 57,
    14, 59,
    14, 89,
    15, 11,
    15, 71,
    15, 90,
    16, 16,
    16, 68,
    16, 69,
    16, 70,
    16, 80,
    16, 82,
    19, 21,
    24, 21,
    34, 11,
    34, 36,
    34, 40,
    34, 48,
    34, 50,
    34, 53,
    34, 55,
    34, 56,
    34, 57,
    34, 58,
    34, 68,
    34, 69,
    34, 70,
    34, 71,
    34, 80,
    34, 82,
    34, 85,
    34, 87,
    34, 88,
    34, 90,
    35, 34,
    35, 55,
    35, 56,
    35, 57,
    35, 58,
    36, 34,
    36, 53,
    37, 34,
    37, 53,
    37, 55,
    37, 56,
    37, 57,
    37, 58,
    37, 59,
    37, 86,
    38, 11,
    38, 72,
    38, 78,
    38, 79,
    38, 81,
    38, 83,
    38, 84,
    38, 85,
    38, 87,
    39, 11,
    39, 13,
    39, 15,
    39, 34,
    39, 36,
    39, 40,
    39, 43,
    39, 48,
    39, 50,
    39, 53,
    39, 66,
    39, 68,
    39, 69,
    39, 70,
    39, 71,
    39, 74,
    39, 75,
    39, 78,
    39, 79,
    39, 80,
    39, 81,
    39, 82,
    39, 83,
    39, 86,
    39, 89,
    39, 90,
    39, 91,
    40, 34,
    40, 57,
    44, 14,
    44, 32,
    44, 36,
    44, 40,
    44, 48,
    44, 50,
    44, 68,
    44, 69,
    44, 70,
    44, 80,
    44, 82,
    44, 86,
    44, 90,
    45, 11,
    45, 13,
    45, 14,
    45, 15,
    45, 32,
    45, 36,
    45, 40,
    45, 48,
    45, 50,
    45, 53,
    45, 55,
    45, 56,
    45, 58,
    45, 68,
    45, 69,
    45, 70,
    45, 71,
    45, 80,
    45, 82,
    45, 84,
    45, 86,
    45, 87,
    45, 88,
    45, 90,
    48, 34,
    48, 53,
    48, 55,
    48, 56,
    48, 57,
    48, 58,
    48, 59,
    48, 86,
    49, 13,
    49, 15,
    49, 34,
    49, 43,
    49, 57,
    49, 58,
    49, 59,
    49, 66,
    50, 34,
    50, 53,
    50, 55,
    50, 56,
    50, 57,
    50, 58,
    50, 59,
    50, 86,
    51, 43,
    51, 58,
    51, 68,
    51, 69,
    51, 70,
    51, 80,
    51, 82,
    53, 1,
    53, 13,
    53, 14,
    53, 15,
    53, 34,
    53, 36,
    53, 40,
    53, 48,
    53, 50,
    53, 53,
    53, 66,
    53, 68,
    53, 69,
    53, 70,
    53, 72,
    53, 78,
    53, 79,
    53, 80,
    53, 81,
    53, 82,
    53, 83,
    53, 84,
    53, 86,
    53, 87,
    53, 88,
    53, 89,
    53, 90,
    53, 91,
    55, 1,
    55, 13,
    55, 14,
    55, 15,
    55, 27,
    55, 28,
    55, 32,
    55, 34,
    55, 36,
    55, 40,
    55, 43,
    55, 48,
    55, 50,
    55, 59,
    55, 66,
    55, 68,
    55, 69,
    55, 70,
    55, 72,
    55, 78,
    55, 79,
    55, 80,
    55, 81,
    55, 82,
    55, 83,
    55, 84,
    55, 86,
    55, 87,
    55, 88,
    55, 90,
    55, 91,
    56, 13,
    56, 14,
    56, 15,
    56, 34,
    56, 36,
    56, 40,
    56, 43,
    56, 48,
    56, 50,
    56, 66,
    56, 68,
    56, 69,
    56, 70,
    56, 72,
    56, 78,
    56, 79,
    56, 80,
    56, 81,
    56, 82,
    56, 83,
    56, 84,
    56, 86,
    56, 89,
    56, 91,
    57, 1,
    57, 14,
    57, 34,
    57, 36,
    57, 40,
    57, 43,
    57, 48,
    57, 50,
    57, 56,
    57, 66,
    57, 68,
    57, 69,
    57, 70,
    57, 71,
    57, 72,
    57, 80,
    57, 82,
    57, 84,
    57, 85,
    57, 86,
    57, 87,
    57, 88,
    57, 89,
    57, 90,
    58, 13,
    58, 15,
    58, 34,
    58, 36,
    58, 40,
    58, 43,
    58, 48,
    58, 50,
    58, 66,
    58, 68,
    58, 69,
    58, 70,
    58, 72,
    58, 78,
    58, 79,
    58, 80,
    58, 81,
    58, 82,
    58, 83,
    58, 84,
    58, 86,
    58, 87,
    58, 88,
    58, 89,
    58, 90,
    58, 91,
    59, 14,
    59, 34,
    59, 36,
    59, 40,
    59, 43,
    59, 48,
    59, 50,
    59, 66,
    59, 68,
    59, 69,
    59, 70,
    59, 72,
    59, 75,
    59, 80,
    59, 82,
    59, 84,
    59, 86,
    60, 68,
    60, 69,
    60, 70,
    60, 80,
    60, 82,
    60, 92,
    66, 3,
    66, 8,
    66, 10,
    66, 11,
    66, 24,
    66, 32,
    66, 62,
    66, 88,
    66, 94,
    67, 11,
    67, 13,
    67, 15,
    67, 62,
    67, 87,
    67, 88,
    67, 89,
    67, 90,
    67, 91,
    69, 66,
    69, 68,
    69, 69,
    69, 70,
    69, 72,
    69, 80,
    69, 82,
    70, 11,
    70, 66,
    70, 87,
    70, 88,
    70, 89,
    70, 91,
    71, 1,
    71, 13,
    71, 14,
    71, 15,
    71, 32,
    71, 66,
    71, 68,
    71, 69,
    71, 70,
    71, 72,
    71, 74,
    71, 80,
    71, 82,
    71, 85,
    71, 90,
    72, 13,
    72, 15,
    72, 66,
    72, 67,
    72, 68,
    72, 69,
    72, 70,
    72, 73,
    72, 75,
    72, 76,
    72, 77,
    72, 80,
    72, 82,
    73, 3,
    73, 8,
    73, 10,
    73, 11,
    73, 24,
    73, 32,
    73, 62,
    73, 88,
    73, 94,
    76, 1,
    76, 14,
    76, 68,
    76, 69,
    76, 70,
    76, 72,
    76, 80,
    76, 82,
    76, 84,
    76, 87,
    77, 66,
    77, 68,
    77, 69,
    77, 70,
    77, 72,
    77, 80,
    77, 82,
    78, 3,
    78, 8,
    78, 10,
    78, 11,
    78, 24,
    78, 32,
    78, 62,
    78, 88,
    78, 94,
    79, 3,
    79, 8,
    79, 10,
    79, 11,
    79, 24,
    79, 32,
    79, 62,
    79, 88,
    79, 94,
    80, 11,
    80, 13,
    80, 15,
    80, 62,
    80, 87,
    80, 88,
    80, 89,
    80, 90,
    80, 91,
    81, 11,
    81, 13,
    81, 15,
    81, 62,
    81, 87,
    81, 88,
    81, 89,
    81, 90,
    81, 91,
    82, 66,
    82, 68,
    82, 69,
    82, 70,
    82, 72,
    82, 80,
    82, 82,
    83, 1,
    83, 13,
    83, 14,
    83, 15,
    83, 66,
    83, 68,
    83, 69,
    83, 70,
    83, 72,
    83, 80,
    83, 82,
    84, 3,
    84, 8,
    84, 11,
    84, 13,
    84, 15,
    84, 32,
    84, 89,
    85, 1,
    85, 14,
    85, 75,
    85, 78,
    85, 79,
    85, 81,
    85, 83,
    85, 88,
    85, 90,
    87, 1,
    87, 11,
    87, 13,
    87, 15,
    87, 66,
    87, 72,
    88, 13,
    88, 15,
    88, 66,
    88, 68,
    88, 69,
    88, 70,
    88, 72,
    88, 80,
    88, 82,
    89, 11,
    89, 13,
    89, 14,
    89, 15,
    89, 32,
    89, 66,
    89, 68,
    89, 69,
    89, 70,
    89, 80,
    89, 82,
    89, 84,
    89, 85,
    89, 86,
    89, 88,
    89, 90,
    90, 1,
    90, 11,
    90, 13,
    90, 15,
    90, 66,
    90, 67,
    90, 68,
    90, 69,
    90, 70,
    90, 72,
    90, 73,
    90, 76,
    90, 77,
    90, 80,
    90, 82,
    90, 89,
    91, 11,
    91, 66,
    91, 67,
    91, 68,
    91, 69,
    91, 70,
    91, 73,
    91, 76,
    91, 77,
    91, 80,
    91, 82,
    91, 91,
    94, 62
};

/* Kerning between the respective left and right glyphs
 * 4.4 format which needs to scaled with `kern_scale`*/
static const int8_t kern_pair_values[] =
{
    -7, -2, -3, -4, -6, -8, -1, -2,
    -5, -8, -5, -14, -4, -4, -4, -2,
    -2, -4, -2, -4, -2, -25, -2, -7,
    -11, -7, -8, -6, -4, -25, -2, -7,
    -49, -16, -16, -16, -16, -16, -3, -8,
    -17, -1, -1, -1, -1, -9, -8, -7,
    -3, -9, -1, -1, -1, -1, -1, -1,
    -1, -6, -3, -5, -2, -2, -2, -9,
    -9, 0, -2, -2, -2, -4, -2, -4,
    -3, -1, 0, -4, -1, -2, -2, -2,
    -2, -2, -7, -3, -4, -11, -11, -6,
    -1, -1, -10, -1, -1, 5, -3, -4,
    -4, -4, -3, -4, -5, -2, -2, -4,
    -2, -4, -2, -3, -8, -4, -6, -2,
    -3, -4, -6, -2, -2, -2, -2, -3,
    -3, -3, -3, -3, -2, -3, -18, 12,
    -21, 12, -8, -2, -2, -2, -2, -11,
    -12, -6, -15, -2, -2, -2, -5, -2,
    -2, -2, -3, -4, -5, -4, -2, -2,
    -4, -2, -4, -3, -1, 0, -20, -20,
    -3, -17, -4, -2, -7, -2, -2, -2,
    -4, -2, -4, -3, -1, 0, -2, -5,
    -2, -2, -2, -2, -2, -3, -16, -11,
    -16, -9, -2, -2, -2, -2, 5, -13,
    -15, -15, -15, -15, -12, -12, -15, -12,
    -15, -12, -12, -11, -8, -8, -7, -8,
    -8, -5, -18, -7, -18, -8, -8, -2,
    -8, -4, -4, -11, -4, -4, -3, -12,
    -11, -11, -11, -9, -6, -6, -11, -6,
    -11, -6, -6, -8, -3, -8, -3, -10,
    -8, -3, -8, -7, -2, -2, -6, -2,
    -2, -3, -7, -7, -7, -8, -5, -5,
    -7, -5, -7, -5, -3, -7, -2, -5,
    -2, -8, -3, -4, -4, -5, -4, -4,
    -1, -1, -3, -3, -3, -5, -4, -3,
    -3, -5, 0, -6, -9, -8, -5, -9,
    -22, -22, -9, -3, -3, -16, -3, -3,
    -11, -12, -12, -12, -11, -8, -8, -12,
    -8, -12, -8, -11, -6, -3, -2, -4,
    -3, -6, -9, -2, -2, -2, -2, -2,
    -2, -4, -5, -5, -5, -4, -4, -5,
    -5, -5, -3, -5, -5, -5, -5, -5,
    -8, -4, -4, -7, -5, -1, -2, -10,
    -2, -7, -4, -2, -2, -5, -1, -2,
    -4, -3, -3, -1, -4, -4, -4, -2,
    -4, -4, -10, -2, -1, -2, -2, -2,
    -2, -21, -7, -21, 7, -4, -4, -4,
    -4, -2, -1, -4, -4, -3, -6, -8,
    -8, -2, -3, -1, -1, -1, -3, 3,
    -3, -3, -1, -1, -4, -4, -7, -5,
    -1, -2, -10, -2, -7, -1, -12, -4,
    -4, -4, -2, -4, -4, -1, -1, -1,
    -4, -4, -4, -2, -4, -4, -4, -4,
    -7, -5, -1, -2, -10, -2, -7, -4,
    -4, -7, -5, -1, -2, -10, -2, -7,
    -4, -2, -2, -5, -1, -2, -4, -3,
    -3, -4, -2, -2, -5, -1, -2, -4,
    -3, -3, -1, -4, -4, -4, -2, -4,
    -4, -10, -20, -6, -20, -3, -5, -5,
    -5, -2, -5, -5, -9, -9, -10, -2,
    -2, -6, -2, -6, -8, -7, -1, -1,
    -1, -1, -2, -3, -7, -2, -13, -13,
    -2, -4, -13, -13, -2, -2, -2, -2,
    -3, -2, -2, -2, -2, -4, -2, -4,
    -3, -3, -3, -3, -3, -3, -2, -3,
    -2, -2, -2, -7, -2, -13, -13, -4,
    -1, -3, -3, -3, -4, -1, -1, -1,
    -3, -3, -2, -2, -3, -2, -3, -3,
    -3, -2, -2, -2, -3, -3, -2, -8
};

/*Collect the kern pair's data in one place*/
static const lv_font_fmt_txt_kern_pair_t kern_pairs =
{
    .glyph_ids = kern_pair_glyph_ids,
    .values = kern_pair_values,
    .pair_cnt = 552,
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
const lv_font_t ui_font_Font2 = {
#else
lv_font_t ui_font_Font2 = {
#endif
    .get_glyph_dsc = lv_font_get_glyph_dsc_fmt_txt,    /*Function pointer to get glyph's data*/
    .get_glyph_bitmap = lv_font_get_bitmap_fmt_txt,    /*Function pointer to get glyph's bitmap*/
    .line_height = 23,          /*The maximum line height required by the font*/
    .base_line = 4,             /*Baseline measured from the bottom of the line*/
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



#endif /*#if UI_FONT_FONT2*/

