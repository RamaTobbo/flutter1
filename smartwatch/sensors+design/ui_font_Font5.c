/*******************************************************************************
 * Size: 16 px
 * Bpp: 1
 * Opts: --bpp 1 --size 16 --font C:/Users/10User/Desktop/lilygoDesign/assets/BigShouldersText-ExtraBold.ttf -o C:/Users/10User/Desktop/lilygoDesign/assets\ui_font_Font5.c --format lvgl -r 0x20-0x7f --no-compress --no-prefilter
 ******************************************************************************/

#include "ui.h"

#ifndef UI_FONT_FONT5
#define UI_FONT_FONT5 1
#endif

#if UI_FONT_FONT5

/*-----------------
 *    BITMAPS
 *----------------*/

/*Store the image of the glyphs*/
static LV_ATTRIBUTE_LARGE_CONST const uint8_t glyph_bitmap[] = {
    /* U+0020 " " */
    0x0,

    /* U+0021 "!" */
    0xdb, 0x6d, 0xb6, 0xd8, 0xe,

    /* U+0022 "\"" */
    0xde, 0xf7, 0xb0,

    /* U+0023 "#" */
    0xc, 0xc1, 0x98, 0x37, 0x1f, 0xf1, 0x98, 0x33,
    0x6, 0x60, 0xdc, 0x7f, 0xc6, 0x60, 0xcc, 0x1b,
    0x87, 0x60,

    /* U+0024 "$" */
    0x30, 0xcf, 0xf3, 0xcf, 0x3c, 0x3e, 0x7c, 0x3c,
    0xf3, 0xcf, 0xf3, 0xc,

    /* U+0025 "%" */
    0xe0, 0xbc, 0x6f, 0x33, 0xcc, 0xf6, 0x39, 0x0,
    0xc0, 0x2e, 0x1e, 0xcd, 0xb2, 0x6d, 0x9b, 0x43,
    0x80,

    /* U+0026 "&" */
    0x78, 0x6c, 0xec, 0x6c, 0x7c, 0x78, 0x70, 0xf4,
    0xde, 0xcc, 0xce, 0xce, 0x7f,

    /* U+0027 "'" */
    0xff,

    /* U+0028 "(" */
    0x26, 0x6c, 0xcc, 0xcc, 0xcc, 0xcc, 0x46, 0x62,

    /* U+0029 ")" */
    0x46, 0x66, 0x33, 0x33, 0x33, 0x33, 0x66, 0x64,

    /* U+002A "*" */
    0x36, 0x30,

    /* U+002B "+" */
    0x30, 0x60, 0xc7, 0xf3, 0x6, 0xc, 0x0,

    /* U+002C "," */
    0xed, 0x0,

    /* U+002D "-" */
    0xfc,

    /* U+002E "." */
    0xe0,

    /* U+002F "/" */
    0xc, 0x31, 0xc6, 0x18, 0x61, 0x8c, 0x30, 0xc3,
    0x1c, 0x61, 0x86, 0x18,

    /* U+0030 "0" */
    0x7b, 0x3c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcf, 0x3c,
    0xf3, 0x78,

    /* U+0031 "1" */
    0x7d, 0xb6, 0xdb, 0x6d, 0xb6,

    /* U+0032 "2" */
    0x7b, 0x3c, 0xf3, 0xcc, 0x33, 0xde, 0xf3, 0x8c,
    0x30, 0xfc,

    /* U+0033 "3" */
    0xfe, 0x1c, 0x70, 0xc3, 0x87, 0x8f, 0x83, 0x7,
    0x8f, 0x1e, 0x37, 0xc0,

    /* U+0034 "4" */
    0x1c, 0x38, 0xf1, 0x66, 0xcd, 0x9b, 0x66, 0xfe,
    0x18, 0x30, 0x60, 0xc0,

    /* U+0035 "5" */
    0xff, 0x83, 0x6, 0xc, 0x1f, 0xb1, 0x83, 0x7,
    0x8f, 0x1e, 0x37, 0xc0,

    /* U+0036 "6" */
    0x7b, 0x3c, 0xf3, 0xc3, 0xec, 0xf3, 0xcf, 0x3c,
    0xf3, 0x78,

    /* U+0037 "7" */
    0xfe, 0xc, 0x38, 0x60, 0xc3, 0x86, 0xc, 0x38,
    0x60, 0xc3, 0x86, 0x0,

    /* U+0038 "8" */
    0x7b, 0x3c, 0xf3, 0xcf, 0x37, 0xb3, 0xcf, 0x3c,
    0xf3, 0x78,

    /* U+0039 "9" */
    0x7b, 0x3c, 0xf3, 0xcf, 0x3c, 0xdf, 0xf, 0x3c,
    0xf3, 0x78,

    /* U+003A ":" */
    0xe0, 0x1, 0xc0,

    /* U+003B ";" */
    0xe0, 0x1, 0xda,

    /* U+003C "<" */
    0x3, 0xff, 0xf0, 0xff, 0x1f,

    /* U+003D "=" */
    0xfe, 0x0, 0x7, 0xf0,

    /* U+003E ">" */
    0x80, 0xff, 0xf, 0xff, 0xf8,

    /* U+003F "?" */
    0x7d, 0x8f, 0x1e, 0x30, 0x60, 0xc7, 0x9e, 0x38,
    0x70, 0x0, 0x3, 0x80,

    /* U+0040 "@" */
    0x3f, 0x18, 0x6c, 0xf, 0x3, 0xf6, 0xff, 0xbf,
    0x6f, 0xdb, 0xf6, 0xfd, 0xbf, 0xbb, 0x0, 0xc0,
    0xd8, 0x73, 0xf0,

    /* U+0041 "A" */
    0x38, 0xd9, 0xb3, 0x66, 0xcd, 0x9b, 0x36, 0x6d,
    0xff, 0x1e, 0x3c, 0x60,

    /* U+0042 "B" */
    0xfb, 0x3c, 0xf3, 0xcf, 0x3f, 0xb3, 0xcf, 0x3c,
    0xf3, 0xf8,

    /* U+0043 "C" */
    0x7b, 0x3c, 0xf3, 0xcf, 0xc, 0x30, 0xcf, 0x3c,
    0xf3, 0x78,

    /* U+0044 "D" */
    0xfb, 0x3c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcf, 0x3c,
    0xf3, 0xf8,

    /* U+0045 "E" */
    0xff, 0xc, 0x30, 0xc3, 0xf, 0xf0, 0xc3, 0xc,
    0x30, 0xfc,

    /* U+0046 "F" */
    0xff, 0xc, 0x30, 0xc3, 0xf, 0xf0, 0xc3, 0xc,
    0x30, 0xc0,

    /* U+0047 "G" */
    0x7b, 0x3c, 0xf3, 0xcf, 0xc, 0x37, 0xcf, 0x3c,
    0xf3, 0x78,

    /* U+0048 "H" */
    0xcf, 0x3c, 0xf3, 0xcf, 0x3f, 0xf3, 0xcf, 0x3c,
    0xf3, 0xcc,

    /* U+0049 "I" */
    0xff, 0xff, 0xff, 0xc0,

    /* U+004A "J" */
    0xc, 0x30, 0xc3, 0xc, 0x30, 0xc3, 0xf, 0x3c,
    0xf3, 0x78,

    /* U+004B "K" */
    0xcd, 0x9b, 0x76, 0xcd, 0x9f, 0x3e, 0x7c, 0xf9,
    0x9b, 0x36, 0x6c, 0xe0,

    /* U+004C "L" */
    0xc6, 0x31, 0x8c, 0x63, 0x18, 0xc6, 0x31, 0x8f,
    0x80,

    /* U+004D "M" */
    0xf1, 0xfa, 0x2f, 0x4d, 0xed, 0xbd, 0xb7, 0xb6,
    0xf6, 0xde, 0xdb, 0xdb, 0x7b, 0x6f, 0x29, 0xe5,
    0x3c, 0xe6,

    /* U+004E "N" */
    0xf3, 0xd3, 0xd3, 0xd3, 0xdb, 0xdb, 0xdb, 0xdb,
    0xdb, 0xdb, 0xcb, 0xcb, 0xcf,

    /* U+004F "O" */
    0x7b, 0x3c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcf, 0x3c,
    0xf3, 0x78,

    /* U+0050 "P" */
    0xfb, 0x3c, 0xf3, 0xcf, 0x3c, 0xfe, 0xc3, 0xc,
    0x30, 0xc0,

    /* U+0051 "Q" */
    0x7b, 0x3c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcf, 0x3c,
    0xf3, 0x78, 0x61, 0x80,

    /* U+0052 "R" */
    0xfb, 0x3c, 0xf3, 0xcf, 0x3c, 0xfe, 0xdb, 0x6d,
    0xf3, 0xcc,

    /* U+0053 "S" */
    0x7b, 0x3c, 0xf3, 0xcf, 0xef, 0xcf, 0xcf, 0x3c,
    0xf3, 0x78,

    /* U+0054 "T" */
    0xfc, 0xc3, 0xc, 0x30, 0xc3, 0xc, 0x30, 0xc3,
    0xc, 0x30,

    /* U+0055 "U" */
    0xcf, 0x3c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcf, 0x3c,
    0xf3, 0x78,

    /* U+0056 "V" */
    0xc7, 0x8f, 0x1e, 0x7e, 0xed, 0x9b, 0x36, 0x6c,
    0xd9, 0xb3, 0x63, 0xc0,

    /* U+0057 "W" */
    0xce, 0x79, 0x4f, 0x29, 0xed, 0xbd, 0xb7, 0xb6,
    0xf6, 0xde, 0xdb, 0xdb, 0x7b, 0x6f, 0x6d, 0xad,
    0xa7, 0x1c,

    /* U+0058 "X" */
    0xc6, 0xcd, 0xb3, 0x66, 0xc5, 0x8e, 0x16, 0x6c,
    0xd9, 0xb3, 0x3c, 0x60,

    /* U+0059 "Y" */
    0xcf, 0x3c, 0xff, 0x79, 0xe7, 0x9e, 0x30, 0xc3,
    0xc, 0x30,

    /* U+005A "Z" */
    0xfc, 0x31, 0x86, 0x18, 0xc3, 0xc, 0x61, 0x86,
    0x30, 0xfc,

    /* U+005B "[" */
    0xfc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcf,

    /* U+005C "\\" */
    0xc3, 0x86, 0x18, 0x61, 0x83, 0xc, 0x30, 0xc3,
    0x86, 0x18, 0x61, 0x87,

    /* U+005D "]" */
    0xf3, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x3f,

    /* U+005E "^" */
    0x22, 0xb7, 0x10,

    /* U+005F "_" */
    0xff, 0xc0,

    /* U+0060 "`" */
    0xc0,

    /* U+0061 "a" */
    0x7b, 0x3c, 0xf3, 0x3d, 0xfc, 0xf3, 0xcf, 0xf0,

    /* U+0062 "b" */
    0xc3, 0xc, 0x36, 0xef, 0x3c, 0xf3, 0xcf, 0x3c,
    0xf3, 0xf8,

    /* U+0063 "c" */
    0x7b, 0x3c, 0xf3, 0xc3, 0xc, 0xf3, 0xcd, 0xe0,

    /* U+0064 "d" */
    0xc, 0x30, 0xdb, 0xdf, 0x3c, 0xf3, 0xcf, 0x3c,
    0xf3, 0x7c,

    /* U+0065 "e" */
    0x7b, 0x3c, 0xf3, 0xff, 0xc, 0xf3, 0xcd, 0xe0,

    /* U+0066 "f" */
    0x3d, 0x86, 0x3e, 0x61, 0x86, 0x18, 0x61, 0x86,
    0x18, 0x60,

    /* U+0067 "g" */
    0x7b, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0x78, 0xc0,
    0xc0, 0x78, 0x8c, 0x8c, 0x78,

    /* U+0068 "h" */
    0xc3, 0xc, 0x36, 0xef, 0x3c, 0xf3, 0xcf, 0x3c,
    0xf3, 0xcc,

    /* U+0069 "i" */
    0xc3, 0xff, 0xff, 0xc0,

    /* U+006A "j" */
    0x30, 0x3, 0x33, 0x33, 0x33, 0x33, 0x33, 0x3e,

    /* U+006B "k" */
    0xc1, 0x83, 0x6, 0x6d, 0x9b, 0x3c, 0x78, 0xf9,
    0xb3, 0x76, 0x6c, 0xc0,

    /* U+006C "l" */
    0xff, 0xff, 0xff, 0xc0,

    /* U+006D "m" */
    0xdd, 0xbb, 0xbc, 0xcf, 0x33, 0xcc, 0xf3, 0x3c,
    0xcf, 0x33, 0xcc, 0xf3, 0x30,

    /* U+006E "n" */
    0xdb, 0xbc, 0xf3, 0xcf, 0x3c, 0xf3, 0xcf, 0x30,

    /* U+006F "o" */
    0x7b, 0x3c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcd, 0xe0,

    /* U+0070 "p" */
    0xdb, 0xbc, 0xf3, 0xcf, 0x3c, 0xf3, 0xcf, 0xec,
    0x30, 0xc0,

    /* U+0071 "q" */
    0x6f, 0x7c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcd, 0xf0,
    0xc3, 0xc,

    /* U+0072 "r" */
    0xfe, 0x31, 0x8c, 0x63, 0x18, 0xc6, 0x0,

    /* U+0073 "s" */
    0x7b, 0x3c, 0xf8, 0xf9, 0xf1, 0xf3, 0xcd, 0xe0,

    /* U+0074 "t" */
    0x63, 0x19, 0xf6, 0x31, 0x8c, 0x63, 0x18, 0xc3,
    0x80,

    /* U+0075 "u" */
    0xcf, 0x3c, 0xf3, 0xcf, 0x3c, 0xf3, 0xcd, 0xf0,

    /* U+0076 "v" */
    0xc7, 0xdf, 0xbb, 0x66, 0xcd, 0x9b, 0x36, 0x6c,
    0x70,

    /* U+0077 "w" */
    0xef, 0xb6, 0xdb, 0x6d, 0xb6, 0xdb, 0x6d, 0xb6,
    0xde, 0x6d, 0xe6, 0xde, 0x6d, 0xe3, 0xde,

    /* U+0078 "x" */
    0xcd, 0xb6, 0xda, 0x38, 0xa6, 0x9b, 0x6f, 0x30,

    /* U+0079 "y" */
    0xcf, 0x3c, 0xf3, 0x4d, 0xa6, 0x9e, 0x79, 0xe1,
    0x8c, 0xe0,

    /* U+007A "z" */
    0xfc, 0x71, 0x8e, 0x30, 0xc6, 0x18, 0xe3, 0xf0,

    /* U+007B "{" */
    0x1c, 0xc3, 0xc, 0x30, 0xc3, 0x38, 0x30, 0xc3,
    0xc, 0x30, 0xc3, 0x87,

    /* U+007C "|" */
    0xff, 0xff, 0xff, 0xff, 0xc0,

    /* U+007D "}" */
    0xe1, 0xc3, 0xc, 0x30, 0xc3, 0x7, 0x30, 0xc3,
    0xc, 0x30, 0xc7, 0x38,

    /* U+007E "~" */
    0x73, 0x38
};


/*---------------------
 *  GLYPH DESCRIPTION
 *--------------------*/

static const lv_font_fmt_txt_glyph_dsc_t glyph_dsc[] = {
    {.bitmap_index = 0, .adv_w = 0, .box_w = 0, .box_h = 0, .ofs_x = 0, .ofs_y = 0} /* id = 0 reserved */,
    {.bitmap_index = 0, .adv_w = 56, .box_w = 1, .box_h = 1, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 1, .adv_w = 67, .box_w = 3, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 6, .adv_w = 101, .box_w = 5, .box_h = 4, .ofs_x = 1, .ofs_y = 9},
    {.bitmap_index = 9, .adv_w = 184, .box_w = 11, .box_h = 13, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 27, .adv_w = 123, .box_w = 6, .box_h = 16, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 39, .adv_w = 169, .box_w = 10, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 56, .adv_w = 155, .box_w = 8, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 69, .adv_w = 52, .box_w = 2, .box_h = 4, .ofs_x = 1, .ofs_y = 9},
    {.bitmap_index = 70, .adv_w = 77, .box_w = 4, .box_h = 16, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 78, .adv_w = 72, .box_w = 4, .box_h = 16, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 86, .adv_w = 70, .box_w = 4, .box_h = 3, .ofs_x = 0, .ofs_y = 10},
    {.bitmap_index = 88, .adv_w = 137, .box_w = 7, .box_h = 7, .ofs_x = 1, .ofs_y = 3},
    {.bitmap_index = 95, .adv_w = 66, .box_w = 3, .box_h = 3, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 97, .adv_w = 112, .box_w = 6, .box_h = 1, .ofs_x = 1, .ofs_y = 5},
    {.bitmap_index = 98, .adv_w = 61, .box_w = 3, .box_h = 1, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 99, .adv_w = 106, .box_w = 6, .box_h = 16, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 111, .adv_w = 127, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 121, .adv_w = 71, .box_w = 3, .box_h = 13, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 126, .adv_w = 123, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 136, .adv_w = 123, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 148, .adv_w = 128, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 160, .adv_w = 127, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 172, .adv_w = 126, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 182, .adv_w = 116, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 194, .adv_w = 126, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 204, .adv_w = 126, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 214, .adv_w = 65, .box_w = 3, .box_h = 6, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 217, .adv_w = 68, .box_w = 3, .box_h = 8, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 220, .adv_w = 150, .box_w = 8, .box_h = 5, .ofs_x = 1, .ofs_y = 4},
    {.bitmap_index = 225, .adv_w = 132, .box_w = 7, .box_h = 4, .ofs_x = 1, .ofs_y = 4},
    {.bitmap_index = 229, .adv_w = 141, .box_w = 8, .box_h = 5, .ofs_x = 1, .ofs_y = 4},
    {.bitmap_index = 234, .adv_w = 124, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 246, .adv_w = 178, .box_w = 10, .box_h = 15, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 265, .adv_w = 124, .box_w = 7, .box_h = 13, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 277, .adv_w = 123, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 287, .adv_w = 126, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 297, .adv_w = 127, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 307, .adv_w = 108, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 317, .adv_w = 106, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 327, .adv_w = 127, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 337, .adv_w = 128, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 347, .adv_w = 61, .box_w = 2, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 351, .adv_w = 117, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 361, .adv_w = 126, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 373, .adv_w = 100, .box_w = 5, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 382, .adv_w = 204, .box_w = 11, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 400, .adv_w = 151, .box_w = 8, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 413, .adv_w = 128, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 423, .adv_w = 122, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 433, .adv_w = 128, .box_w = 6, .box_h = 15, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 445, .adv_w = 123, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 455, .adv_w = 123, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 465, .adv_w = 105, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 475, .adv_w = 128, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 485, .adv_w = 126, .box_w = 7, .box_h = 13, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 497, .adv_w = 208, .box_w = 11, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 515, .adv_w = 116, .box_w = 7, .box_h = 13, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 527, .adv_w = 112, .box_w = 6, .box_h = 13, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 537, .adv_w = 104, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 547, .adv_w = 90, .box_w = 4, .box_h = 16, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 555, .adv_w = 100, .box_w = 6, .box_h = 16, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 567, .adv_w = 90, .box_w = 4, .box_h = 16, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 575, .adv_w = 112, .box_w = 5, .box_h = 4, .ofs_x = 1, .ofs_y = 7},
    {.bitmap_index = 578, .adv_w = 173, .box_w = 10, .box_h = 1, .ofs_x = 0, .ofs_y = -1},
    {.bitmap_index = 580, .adv_w = 71, .box_w = 3, .box_h = 1, .ofs_x = 1, .ofs_y = 11},
    {.bitmap_index = 581, .adv_w = 121, .box_w = 6, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 589, .adv_w = 127, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 599, .adv_w = 118, .box_w = 6, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 607, .adv_w = 127, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 617, .adv_w = 118, .box_w = 6, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 625, .adv_w = 88, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 635, .adv_w = 128, .box_w = 8, .box_h = 13, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 648, .adv_w = 129, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 658, .adv_w = 59, .box_w = 2, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 662, .adv_w = 59, .box_w = 4, .box_h = 16, .ofs_x = -1, .ofs_y = -3},
    {.bitmap_index = 670, .adv_w = 115, .box_w = 7, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 682, .adv_w = 59, .box_w = 2, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 686, .adv_w = 194, .box_w = 10, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 699, .adv_w = 129, .box_w = 6, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 707, .adv_w = 122, .box_w = 6, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 715, .adv_w = 127, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 725, .adv_w = 127, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 735, .adv_w = 90, .box_w = 5, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 742, .adv_w = 112, .box_w = 6, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 750, .adv_w = 88, .box_w = 5, .box_h = 13, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 759, .adv_w = 129, .box_w = 6, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 767, .adv_w = 112, .box_w = 7, .box_h = 10, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 776, .adv_w = 189, .box_w = 12, .box_h = 10, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 791, .adv_w = 106, .box_w = 6, .box_h = 10, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 799, .adv_w = 114, .box_w = 6, .box_h = 13, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 809, .adv_w = 102, .box_w = 6, .box_h = 10, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 817, .adv_w = 99, .box_w = 6, .box_h = 16, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 829, .adv_w = 56, .box_w = 2, .box_h = 17, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 834, .adv_w = 99, .box_w = 6, .box_h = 16, .ofs_x = 0, .ofs_y = -3},
    {.bitmap_index = 846, .adv_w = 137, .box_w = 7, .box_h = 2, .ofs_x = 1, .ofs_y = 5}
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
    -5, -4, -2, -5, -3, -5, -2, -2,
    -9, -3, -5, -18, -4, -4, -4, 0,
    0, -4, 0, -4, 0, -14, -4, -13,
    -13, -6, -9, -6, -5, -14, -4, -13,
    -37, -11, -11, -11, -11, -11, -4, -9,
    -13, -3, -3, -3, -3, -9, -9, -6,
    -4, -13, -1, -1, -1, -2, -1, -1,
    -2, -6, -4, -4, -2, -4, -4, -7,
    -8, -1, -1, -2, -2, -4, -1, -4,
    -3, -1, -1, -1, 0, 0, 0, 0,
    0, 0, -5, -1, -1, -10, -10, -4,
    -1, -1, -8, -1, -1, 3, -2, -3,
    -3, -3, -3, -1, -2, 0, 0, -3,
    0, -3, 0, -1, -9, -1, -5, -1,
    -4, -7, -11, -3, -3, -3, -3, -3,
    -3, -3, -3, -3, -2, -5, -19, 9,
    -19, 9, -16, -1, -1, -1, -1, -10,
    -11, -6, -15, -1, -1, -1, -9, -1,
    -1, -4, -1, -7, -5, -7, -2, -2,
    -4, -1, -4, -3, -1, -1, -17, -17,
    -5, -14, -4, -4, -5, -2, -2, -2,
    -4, -1, -4, -3, -1, -1, -2, -9,
    -2, -2, -2, -2, -2, -2, -17, -13,
    -17, -9, -2, -2, -2, -2, 3, -11,
    -12, -12, -12, -15, -10, -10, -12, -10,
    -12, -10, -10, -8, -7, -7, -6, -6,
    -6, -5, -17, -6, -17, -5, -5, -4,
    -9, -4, -4, -9, -4, -4, -3, -10,
    -8, -8, -8, -8, -3, -3, -8, -3,
    -8, -3, -8, -9, -2, -2, -3, -6,
    -6, -2, -6, -5, -1, -1, -9, -1,
    -1, -5, -5, -5, -5, -6, -2, -2,
    -5, -2, -5, -2, -3, -5, -4, -5,
    -4, -9, -4, -4, -4, -9, -4, -4,
    -2, -2, -2, -2, -2, -9, -4, -2,
    -2, -5, -1, -3, -4, -7, -5, -9,
    -22, -22, -13, -3, -3, -19, -3, -3,
    -11, -12, -12, -12, -10, -7, -7, -12,
    -7, -12, -7, -10, -6, -3, -3, -3,
    -1, -5, -9, 0, -1, -1, -4, -1,
    -1, -1, -2, -2, -2, -4, -1, -2,
    -2, -1, -3, -9, -9, -9, -9, -9,
    -15, -7, -7, -1, -5, -2, -4, -12,
    -2, -1, -4, -1, -1, -9, -2, -2,
    -5, -2, -3, -4, -5, -5, -5, -6,
    -5, -5, -12, -2, -2, -4, -2, -4,
    -8, -20, -8, -20, 2, -4, -3, -3,
    -3, -1, -3, -3, -3, -1, -7, -9,
    -9, -1, -3, -1, -1, -1, -3, 3,
    -3, -3, -1, -1, -7, -7, -1, -5,
    -2, -4, -12, -2, -1, -2, -12, -4,
    -4, -4, -3, -4, -4, -3, 0, -4,
    -5, -5, -5, -6, -5, -5, -7, -7,
    -1, -5, -2, -4, -12, -2, -1, -7,
    -7, -1, -5, -2, -4, -12, -2, -1,
    -4, -1, -1, -9, -2, -2, -5, -2,
    -3, -4, -1, -1, -9, -2, -2, -5,
    -2, -3, -4, -5, -5, -5, -6, -5,
    -5, -8, -19, -11, -19, -3, -3, -3,
    -3, -1, -3, -3, -2, -2, -12, -4,
    -4, -11, -4, -9, -5, -5, -3, -3,
    -3, -3, 0, -3, -5, -4, -10, -10,
    -2, -7, -10, -10, -2, -2, -2, -2,
    -2, -2, -2, -4, -4, -5, -4, -7,
    -2, -4, -4, -4, -4, -4, -4, -1,
    -4, -4, -4, -5, -4, -10, -10, -7,
    -4, -2, -2, -2, -5, -4, -4, -4,
    -2, -2, -4, -4, -3, -6, -1, -1,
    -1, -6, -6, -6, -1, -1, 0, -15
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
const lv_font_t ui_font_Font5 = {
#else
lv_font_t ui_font_Font5 = {
#endif
    .get_glyph_dsc = lv_font_get_glyph_dsc_fmt_txt,    /*Function pointer to get glyph's data*/
    .get_glyph_bitmap = lv_font_get_bitmap_fmt_txt,    /*Function pointer to get glyph's bitmap*/
    .line_height = 18,          /*The maximum line height required by the font*/
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



#endif /*#if UI_FONT_FONT5*/

