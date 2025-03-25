/*******************************************************************************
 * Size: 25 px
 * Bpp: 1
 * Opts: --bpp 1 --size 25 --font C:/Users/10User/Desktop/lilygoDesign/assets/Economica-Regular.ttf -o C:/Users/10User/Desktop/lilygoDesign/assets\ui_font_Font10.c --format lvgl -r 0x20-0x7f --no-compress --no-prefilter
 ******************************************************************************/

#include "ui.h"

#ifndef UI_FONT_FONT10
#define UI_FONT_FONT10 1
#endif

#if UI_FONT_FONT10

/*-----------------
 *    BITMAPS
 *----------------*/

/*Store the image of the glyphs*/
static LV_ATTRIBUTE_LARGE_CONST const uint8_t glyph_bitmap[] = {
    /* U+0020 " " */
    0x0,

    /* U+0021 "!" */
    0x55, 0x55, 0x55, 0x50, 0x3c,

    /* U+0022 "\"" */
    0xcf, 0x3c, 0xf3, 0x88, 0x0,

    /* U+0023 "#" */
    0x1, 0x84, 0x3, 0x18, 0x4, 0x30, 0x18, 0x40,
    0x31, 0x80, 0x43, 0x1f, 0xff, 0x82, 0x18, 0xc,
    0x20, 0x18, 0xc0, 0x21, 0x80, 0x42, 0xf, 0xff,
    0xc2, 0x18, 0xc, 0x60, 0x10, 0xc0, 0x61, 0x0,
    0xc6, 0x1, 0xc, 0x0,

    /* U+0024 "$" */
    0x10, 0x41, 0x1e, 0xc2, 0x8, 0x30, 0x60, 0xc0,
    0x81, 0x4, 0x10, 0x7e, 0x10, 0x41, 0x0,

    /* U+0025 "%" */
    0x70, 0xc8, 0x8c, 0x88, 0xc8, 0x98, 0x89, 0x88,
    0x98, 0x8b, 0x7, 0x30, 0x7, 0x0, 0x60, 0x6,
    0x0, 0xce, 0xd, 0x10, 0xd1, 0x19, 0x11, 0x91,
    0x19, 0x13, 0x11, 0x30, 0xe0,

    /* U+0026 "&" */
    0x3e, 0x2, 0x0, 0x40, 0x4, 0x0, 0x40, 0x4,
    0x0, 0x40, 0x86, 0x8, 0x31, 0xf6, 0x8, 0x40,
    0x88, 0x8, 0x80, 0x88, 0x8, 0x80, 0x88, 0x8,
    0xc1, 0x86, 0x30, 0x3e, 0x0,

    /* U+0027 "'" */
    0x6d, 0xa4, 0x80,

    /* U+0028 "(" */
    0x32, 0x11, 0x8, 0x42, 0x10, 0x84, 0x21, 0x8,
    0x42, 0x10, 0x84, 0x21, 0x8, 0x20, 0xc0,

    /* U+0029 ")" */
    0xc2, 0x21, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x12, 0xc0,

    /* U+002A "*" */
    0x1, 0xe3, 0x3f, 0x31, 0x20,

    /* U+002B "+" */
    0x21, 0x9, 0xf2, 0x10, 0x80,

    /* U+002C "," */
    0xfe, 0x80,

    /* U+002D "-" */
    0xf8,

    /* U+002E "." */
    0xf0,

    /* U+002F "/" */
    0x1, 0x80, 0xc0, 0x40, 0x60, 0x30, 0x18, 0x8,
    0xc, 0x6, 0x2, 0x3, 0x1, 0x80, 0x80, 0xc0,
    0x60, 0x20, 0x10, 0x18, 0xc, 0x4, 0x6, 0x3,
    0x1, 0x1, 0x80,

    /* U+0030 "0" */
    0x7c, 0x8a, 0x1c, 0x18, 0x30, 0x60, 0xc1, 0x83,
    0x6, 0xc, 0x18, 0x30, 0x60, 0xc1, 0xc6, 0x89,
    0xf0,

    /* U+0031 "1" */
    0x70, 0xe0, 0x40, 0x81, 0x2, 0x4, 0x8, 0x10,
    0x20, 0x40, 0x81, 0x2, 0x4, 0x8, 0x10, 0x23,
    0xf8,

    /* U+0032 "2" */
    0xf8, 0x30, 0x41, 0x4, 0x30, 0xc6, 0x31, 0xc6,
    0x30, 0x82, 0x8, 0x20, 0x82, 0xf, 0xc0,

    /* U+0033 "3" */
    0xfc, 0x20, 0x86, 0x10, 0x43, 0x87, 0x4, 0x10,
    0x41, 0x4, 0x10, 0x41, 0x4, 0x3f, 0x80,

    /* U+0034 "4" */
    0xc, 0xc, 0xc, 0x1c, 0x14, 0x34, 0x34, 0x24,
    0x64, 0x44, 0xc4, 0xff, 0x4, 0x4, 0x4, 0x4,
    0x4, 0x4, 0x4,

    /* U+0035 "5" */
    0xfe, 0x8, 0x20, 0x82, 0x8, 0x3e, 0xc, 0x10,
    0x41, 0x4, 0x10, 0x41, 0x4, 0x3f, 0x80,

    /* U+0036 "6" */
    0x3e, 0x81, 0x6, 0xc, 0x10, 0x20, 0x7e, 0x87,
    0x6, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x82, 0x8d,
    0xf0,

    /* U+0037 "7" */
    0x7f, 0x3, 0x3, 0x6, 0x6, 0x6, 0xc, 0xc,
    0xc, 0x8, 0x18, 0x18, 0x10, 0x30, 0x30, 0x20,
    0x60, 0x60, 0x40,

    /* U+0038 "8" */
    0x3c, 0x49, 0xa, 0x14, 0x28, 0x50, 0xb3, 0x3c,
    0x89, 0x1c, 0x18, 0x30, 0x60, 0xc1, 0x82, 0x88,
    0xe0,

    /* U+0039 "9" */
    0x7d, 0x8e, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x83,
    0x6, 0xe, 0x37, 0xa0, 0x40, 0x83, 0x4, 0x1b,
    0xe0,

    /* U+003A ":" */
    0xf0, 0x0, 0x0, 0xf0,

    /* U+003B ";" */
    0xf0, 0x0, 0x3, 0xfa,

    /* U+003C "<" */
    0x11, 0x88, 0xc4, 0x43, 0x8, 0x61, 0xc, 0x20,

    /* U+003D "=" */
    0xfe, 0x0, 0x7, 0xf0,

    /* U+003E ">" */
    0x43, 0x8, 0x61, 0x4, 0x62, 0x31, 0x18, 0x80,

    /* U+003F "?" */
    0x7c, 0xc, 0x8, 0x10, 0x20, 0x41, 0x82, 0xc,
    0x30, 0x41, 0x82, 0x4, 0x0, 0x0, 0x0, 0xc1,
    0x80,

    /* U+0040 "@" */
    0x7f, 0xf0, 0x6, 0x0, 0xc3, 0x98, 0x93, 0x12,
    0x62, 0x4c, 0x59, 0x8f, 0xf0, 0x2, 0x0, 0x40,
    0x4, 0x0, 0x7f, 0x0,

    /* U+0041 "A" */
    0xc, 0x3, 0x1, 0xc0, 0x50, 0x16, 0x5, 0x81,
    0x20, 0xc8, 0x32, 0x8, 0xc2, 0x31, 0xfc, 0x61,
    0x18, 0x44, 0x19, 0x6, 0xc0, 0xb0, 0x2c, 0xc,

    /* U+0042 "B" */
    0xf9, 0xe, 0xc, 0x18, 0x30, 0x60, 0xc3, 0xfd,
    0xe, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x83, 0xb,
    0xe0,

    /* U+0043 "C" */
    0x3e, 0x81, 0x4, 0x8, 0x10, 0x20, 0x40, 0x81,
    0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x40, 0xc0,
    0xf8,

    /* U+0044 "D" */
    0xfc, 0x86, 0x82, 0x81, 0x81, 0x81, 0x81, 0x81,
    0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81,
    0x82, 0x86, 0xfc,

    /* U+0045 "E" */
    0xfe, 0x8, 0x20, 0x82, 0x8, 0x20, 0xfe, 0x8,
    0x20, 0x82, 0x8, 0x20, 0x82, 0xf, 0xc0,

    /* U+0046 "F" */
    0xfe, 0x8, 0x20, 0x82, 0x8, 0x20, 0xfe, 0x8,
    0x20, 0x82, 0x8, 0x20, 0x82, 0x8, 0x0,

    /* U+0047 "G" */
    0x3e, 0x81, 0x4, 0x8, 0x10, 0x20, 0x40, 0x81,
    0x6, 0xc, 0x18, 0x30, 0x60, 0xc1, 0xc2, 0x84,
    0xf8,

    /* U+0048 "H" */
    0x83, 0x6, 0xc, 0x18, 0x30, 0x60, 0xc1, 0xff,
    0x6, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x83, 0x6,
    0x8,

    /* U+0049 "I" */
    0xff, 0xff, 0xe0,

    /* U+004A "J" */
    0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x11, 0x2c,

    /* U+004B "K" */
    0x87, 0xe, 0x34, 0x69, 0x93, 0x24, 0x58, 0xb1,
    0xc2, 0xc5, 0x89, 0x93, 0x26, 0x46, 0x8d, 0xe,
    0x18,

    /* U+004C "L" */
    0x82, 0x8, 0x20, 0x82, 0x8, 0x20, 0x82, 0x8,
    0x20, 0x82, 0x8, 0x20, 0x82, 0xf, 0xc0,

    /* U+004D "M" */
    0xc0, 0x38, 0xf, 0x81, 0xf0, 0x7a, 0xb, 0x63,
    0x64, 0x4c, 0xd9, 0x8a, 0x31, 0xc6, 0x10, 0xc0,
    0x18, 0x3, 0x0, 0x60, 0xc, 0x1, 0x80, 0x30,
    0x6, 0x0, 0x80,

    /* U+004E "N" */
    0xc3, 0x87, 0xf, 0x1e, 0x3c, 0x6c, 0xd9, 0xb3,
    0x66, 0x6c, 0xd9, 0xb1, 0xe3, 0xc7, 0x87, 0xe,
    0x18,

    /* U+004F "O" */
    0x3c, 0x66, 0x42, 0x83, 0x81, 0x81, 0x81, 0x81,
    0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x83,
    0x42, 0x66, 0x3c,

    /* U+0050 "P" */
    0xfc, 0x82, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81,
    0x83, 0xfc, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
    0x80, 0x80, 0x80,

    /* U+0051 "Q" */
    0x3c, 0x3, 0x30, 0x10, 0x81, 0x6, 0x8, 0x10,
    0x40, 0x82, 0x4, 0x10, 0x20, 0x81, 0x4, 0x8,
    0x20, 0x41, 0x2, 0x8, 0x10, 0x40, 0x82, 0x4,
    0x18, 0x60, 0x42, 0x3, 0x30, 0xf, 0x0, 0x30,
    0x2, 0x0, 0x3f, 0x0, 0x1f, 0xe0,

    /* U+0052 "R" */
    0xfc, 0x43, 0x20, 0x90, 0x48, 0x24, 0x12, 0x9,
    0x4, 0x86, 0x7e, 0x26, 0x13, 0x8, 0xc4, 0x62,
    0x19, 0xc, 0x83, 0x41, 0xa0, 0x60,

    /* U+0053 "S" */
    0x7e, 0xc0, 0x80, 0x80, 0x80, 0xc0, 0x60, 0x30,
    0x18, 0xc, 0x6, 0x3, 0x1, 0x1, 0x1, 0x1,
    0x3, 0xfe, 0xfc,

    /* U+0054 "T" */
    0xfe, 0x20, 0x40, 0x81, 0x2, 0x4, 0x8, 0x10,
    0x20, 0x40, 0x81, 0x2, 0x4, 0x8, 0x10, 0x20,
    0x40,

    /* U+0055 "U" */
    0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81,
    0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81,
    0x81, 0x42, 0x3c,

    /* U+0056 "V" */
    0xc1, 0xe0, 0xf0, 0x68, 0x34, 0x13, 0x9, 0x8c,
    0xc6, 0x23, 0x11, 0x8, 0x86, 0x43, 0x60, 0xa0,
    0x50, 0x28, 0x1c, 0xe, 0x2, 0x0,

    /* U+0057 "W" */
    0xc0, 0xd, 0x0, 0x34, 0x0, 0xd0, 0x3, 0x60,
    0x9, 0x8c, 0x26, 0x30, 0x88, 0xe6, 0x23, 0x98,
    0x9a, 0x62, 0x69, 0x9, 0x24, 0x34, 0x90, 0xd3,
    0x41, 0x45, 0x7, 0x1c, 0x18, 0x60, 0x61, 0x81,
    0x86, 0x0,

    /* U+0058 "X" */
    0xc3, 0xc3, 0x42, 0x62, 0x66, 0x24, 0x24, 0x34,
    0x18, 0x18, 0x18, 0x3c, 0x24, 0x24, 0x66, 0x46,
    0x42, 0xc2, 0x83,

    /* U+0059 "Y" */
    0x83, 0xc3, 0x46, 0x46, 0x64, 0x2c, 0x2c, 0x28,
    0x18, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10,
    0x10, 0x10, 0x10,

    /* U+005A "Z" */
    0xfe, 0xc, 0x18, 0x20, 0xc1, 0x82, 0xc, 0x18,
    0x20, 0xc1, 0x82, 0xc, 0x18, 0x20, 0xc1, 0x83,
    0xf8,

    /* U+005B "[" */
    0xf2, 0x49, 0x24, 0x92, 0x49, 0x24, 0x92, 0x49,
    0xc0,

    /* U+005C "\\" */
    0xc0, 0x20, 0x10, 0xc, 0x6, 0x1, 0x0, 0xc0,
    0x60, 0x10, 0xc, 0x6, 0x1, 0x0, 0xc0, 0x60,
    0x10, 0x8, 0x6, 0x3, 0x0, 0x80, 0x60, 0x30,
    0x8, 0x6, 0x3,

    /* U+005D "]" */
    0xe4, 0x92, 0x49, 0x24, 0x92, 0x49, 0x24, 0x93,
    0xc0,

    /* U+005E "^" */
    0x18, 0x7e, 0xc3,

    /* U+005F "_" */
    0xff, 0xf0,

    /* U+0060 "`" */
    0x46, 0x30,

    /* U+0061 "a" */
    0x7c, 0x10, 0x41, 0x4, 0xfc, 0x61, 0x86, 0x18,
    0x61, 0x9d, 0xd0,

    /* U+0062 "b" */
    0x82, 0x8, 0x20, 0x83, 0xe8, 0xe1, 0x86, 0x18,
    0x61, 0x86, 0x18, 0x61, 0x87, 0x3b, 0x80,

    /* U+0063 "c" */
    0x7b, 0x8, 0x20, 0x82, 0x8, 0x20, 0x82, 0x8,
    0x20, 0xc1, 0xf0,

    /* U+0064 "d" */
    0x4, 0x10, 0x41, 0x5, 0xfc, 0xe1, 0x86, 0x18,
    0x61, 0x86, 0x18, 0x61, 0x87, 0x37, 0x40,

    /* U+0065 "e" */
    0x7b, 0x38, 0x61, 0x86, 0x1f, 0xe0, 0x82, 0x8,
    0x20, 0xc1, 0xf0,

    /* U+0066 "f" */
    0x3d, 0x4, 0x10, 0x43, 0xe4, 0x10, 0x41, 0x4,
    0x10, 0x41, 0x4, 0x10, 0x41, 0x4, 0x10, 0x41,
    0x4, 0x10,

    /* U+0067 "g" */
    0x7e, 0xc6, 0x82, 0x82, 0x82, 0x82, 0x82, 0x82,
    0xc6, 0x7c, 0x80, 0x80, 0x80, 0xfc, 0x2, 0x2,
    0x2, 0x2, 0x7c,

    /* U+0068 "h" */
    0x81, 0x2, 0x4, 0x8, 0x17, 0xb1, 0xc1, 0x83,
    0x6, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x83, 0x6,
    0x8,

    /* U+0069 "i" */
    0xf0, 0x15, 0x55, 0x55, 0x54,

    /* U+006A "j" */
    0x33, 0x0, 0x1, 0x11, 0x11, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x11, 0x2e,

    /* U+006B "k" */
    0x82, 0x8, 0x20, 0x82, 0x38, 0xa6, 0x92, 0xca,
    0x38, 0xa2, 0xc9, 0x26, 0x8a, 0x38, 0xc0,

    /* U+006C "l" */
    0xff, 0xff, 0xe0,

    /* U+006D "m" */
    0xbc, 0xf6, 0x38, 0xe0, 0x83, 0x4, 0x18, 0x20,
    0xc1, 0x6, 0x8, 0x30, 0x41, 0x82, 0xc, 0x10,
    0x60, 0x83, 0x4, 0x18, 0x20, 0xc1, 0x4,

    /* U+006E "n" */
    0xbd, 0x8e, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x83,
    0x6, 0xc, 0x18, 0x30, 0x40,

    /* U+006F "o" */
    0x7d, 0x8e, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x83,
    0x6, 0xc, 0x1c, 0x6f, 0x80,

    /* U+0070 "p" */
    0xfd, 0x8e, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x83,
    0x6, 0xc, 0x1c, 0x57, 0xa0, 0x40, 0x81, 0x2,
    0x0,

    /* U+0071 "q" */
    0x7e, 0x8e, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x83,
    0x6, 0xc, 0x14, 0x6f, 0x40, 0x81, 0x2, 0x4,
    0x8,

    /* U+0072 "r" */
    0xbc, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,

    /* U+0073 "s" */
    0x7e, 0x8, 0x20, 0xc1, 0x83, 0x6, 0xc, 0x10,
    0x41, 0xf, 0xe0,

    /* U+0074 "t" */
    0x42, 0x3e, 0x84, 0x21, 0x8, 0x42, 0x10, 0x84,
    0x21, 0x7,

    /* U+0075 "u" */
    0x83, 0x6, 0xc, 0x18, 0x30, 0x60, 0xc1, 0x83,
    0x6, 0xc, 0x1c, 0xef, 0x40,

    /* U+0076 "v" */
    0x83, 0x8f, 0x1e, 0x34, 0x48, 0x91, 0x36, 0x6c,
    0x50, 0xa1, 0x43, 0x87, 0x0,

    /* U+0077 "w" */
    0x80, 0x18, 0x63, 0xc6, 0x3c, 0x63, 0xc6, 0x24,
    0xe2, 0x4b, 0x24, 0x96, 0x69, 0x66, 0x96, 0x39,
    0x43, 0x9c, 0x39, 0xc3, 0x1c,

    /* U+0078 "x" */
    0xc5, 0x99, 0x23, 0x43, 0x86, 0xc, 0x18, 0x78,
    0x91, 0x26, 0x68, 0x50, 0x80,

    /* U+0079 "y" */
    0x83, 0x8f, 0x1e, 0x34, 0x48, 0x91, 0x36, 0x6c,
    0x50, 0xa1, 0x43, 0x87, 0xc, 0x18, 0x30, 0xc3,
    0x0,

    /* U+007A "z" */
    0xfc, 0x30, 0x86, 0x18, 0x43, 0x8, 0x21, 0x4,
    0x10, 0x83, 0xf0,

    /* U+007B "{" */
    0x39, 0x8, 0x42, 0x10, 0x8c, 0x46, 0x31, 0x84,
    0x20, 0x84, 0x21, 0x8, 0x42, 0x1c,

    /* U+007C "|" */
    0xff, 0xff, 0xff,

    /* U+007D "}" */
    0xe1, 0x8, 0x42, 0x10, 0x86, 0x10, 0xc6, 0x31,
    0x8, 0x84, 0x21, 0x8, 0x42, 0x70,

    /* U+007E "~" */
    0xfe
};


/*---------------------
 *  GLYPH DESCRIPTION
 *--------------------*/

static const lv_font_fmt_txt_glyph_dsc_t glyph_dsc[] = {
    {.bitmap_index = 0, .adv_w = 0, .box_w = 0, .box_h = 0, .ofs_x = 0, .ofs_y = 0} /* id = 0 reserved */,
    {.bitmap_index = 0, .adv_w = 76, .box_w = 1, .box_h = 1, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 1, .adv_w = 64, .box_w = 2, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 6, .adv_w = 133, .box_w = 6, .box_h = 6, .ofs_x = 1, .ofs_y = 13},
    {.bitmap_index = 11, .adv_w = 262, .box_w = 15, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 47, .adv_w = 157, .box_w = 6, .box_h = 19, .ofs_x = 2, .ofs_y = -2},
    {.bitmap_index = 62, .adv_w = 244, .box_w = 12, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 91, .adv_w = 214, .box_w = 12, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 120, .adv_w = 66, .box_w = 3, .box_h = 6, .ofs_x = 0, .ofs_y = 13},
    {.bitmap_index = 123, .adv_w = 99, .box_w = 5, .box_h = 23, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 138, .adv_w = 100, .box_w = 4, .box_h = 23, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 150, .adv_w = 121, .box_w = 6, .box_h = 6, .ofs_x = 1, .ofs_y = 13},
    {.bitmap_index = 155, .adv_w = 97, .box_w = 5, .box_h = 7, .ofs_x = 1, .ofs_y = 5},
    {.bitmap_index = 160, .adv_w = 62, .box_w = 2, .box_h = 5, .ofs_x = 1, .ofs_y = -3},
    {.bitmap_index = 162, .adv_w = 134, .box_w = 5, .box_h = 1, .ofs_x = 1, .ofs_y = 8},
    {.bitmap_index = 163, .adv_w = 71, .box_w = 2, .box_h = 2, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 164, .adv_w = 149, .box_w = 9, .box_h = 24, .ofs_x = 0, .ofs_y = -5},
    {.bitmap_index = 191, .adv_w = 164, .box_w = 7, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 208, .adv_w = 164, .box_w = 7, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 225, .adv_w = 164, .box_w = 6, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 240, .adv_w = 164, .box_w = 6, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 255, .adv_w = 164, .box_w = 8, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 274, .adv_w = 164, .box_w = 6, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 289, .adv_w = 164, .box_w = 7, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 306, .adv_w = 164, .box_w = 8, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 325, .adv_w = 164, .box_w = 7, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 342, .adv_w = 164, .box_w = 7, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 359, .adv_w = 72, .box_w = 2, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 363, .adv_w = 61, .box_w = 2, .box_h = 16, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 367, .adv_w = 95, .box_w = 5, .box_h = 12, .ofs_x = 0, .ofs_y = 2},
    {.bitmap_index = 375, .adv_w = 145, .box_w = 7, .box_h = 4, .ofs_x = 1, .ofs_y = 7},
    {.bitmap_index = 379, .adv_w = 94, .box_w = 5, .box_h = 12, .ofs_x = 1, .ofs_y = 2},
    {.bitmap_index = 387, .adv_w = 136, .box_w = 7, .box_h = 19, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 404, .adv_w = 222, .box_w = 11, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 424, .adv_w = 174, .box_w = 10, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 448, .adv_w = 168, .box_w = 7, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 465, .adv_w = 151, .box_w = 7, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 482, .adv_w = 189, .box_w = 8, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 501, .adv_w = 154, .box_w = 6, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 516, .adv_w = 150, .box_w = 6, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 531, .adv_w = 178, .box_w = 7, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 548, .adv_w = 183, .box_w = 7, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 565, .adv_w = 85, .box_w = 1, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 568, .adv_w = 98, .box_w = 4, .box_h = 24, .ofs_x = 0, .ofs_y = -5},
    {.bitmap_index = 580, .adv_w = 165, .box_w = 7, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 597, .adv_w = 144, .box_w = 6, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 612, .adv_w = 234, .box_w = 11, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 639, .adv_w = 182, .box_w = 7, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 656, .adv_w = 192, .box_w = 8, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 675, .adv_w = 184, .box_w = 8, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 694, .adv_w = 187, .box_w = 13, .box_h = 23, .ofs_x = 2, .ofs_y = -4},
    {.bitmap_index = 732, .adv_w = 181, .box_w = 9, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 754, .adv_w = 156, .box_w = 8, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 773, .adv_w = 133, .box_w = 7, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 790, .adv_w = 187, .box_w = 8, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 809, .adv_w = 166, .box_w = 9, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 831, .adv_w = 244, .box_w = 14, .box_h = 19, .ofs_x = 0, .ofs_y = 0},
    {.bitmap_index = 865, .adv_w = 153, .box_w = 8, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 884, .adv_w = 150, .box_w = 8, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 903, .adv_w = 148, .box_w = 7, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 920, .adv_w = 80, .box_w = 3, .box_h = 22, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 929, .adv_w = 149, .box_w = 9, .box_h = 24, .ofs_x = 0, .ofs_y = -5},
    {.bitmap_index = 956, .adv_w = 82, .box_w = 3, .box_h = 22, .ofs_x = 0, .ofs_y = -2},
    {.bitmap_index = 965, .adv_w = 164, .box_w = 8, .box_h = 3, .ofs_x = 1, .ofs_y = 16},
    {.bitmap_index = 968, .adv_w = 245, .box_w = 12, .box_h = 1, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 970, .adv_w = 69, .box_w = 4, .box_h = 4, .ofs_x = 0, .ofs_y = 15},
    {.bitmap_index = 972, .adv_w = 137, .box_w = 6, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 983, .adv_w = 149, .box_w = 6, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 998, .adv_w = 125, .box_w = 6, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1009, .adv_w = 151, .box_w = 6, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1024, .adv_w = 141, .box_w = 6, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1035, .adv_w = 92, .box_w = 6, .box_h = 24, .ofs_x = 1, .ofs_y = -5},
    {.bitmap_index = 1053, .adv_w = 159, .box_w = 8, .box_h = 19, .ofs_x = 1, .ofs_y = -5},
    {.bitmap_index = 1072, .adv_w = 158, .box_w = 7, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 1089, .adv_w = 81, .box_w = 2, .box_h = 19, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1094, .adv_w = 77, .box_w = 4, .box_h = 24, .ofs_x = -1, .ofs_y = -5},
    {.bitmap_index = 1106, .adv_w = 142, .box_w = 6, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 1121, .adv_w = 72, .box_w = 1, .box_h = 19, .ofs_x = 2, .ofs_y = 0},
    {.bitmap_index = 1124, .adv_w = 241, .box_w = 13, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1147, .adv_w = 156, .box_w = 7, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1160, .adv_w = 150, .box_w = 7, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1173, .adv_w = 152, .box_w = 7, .box_h = 19, .ofs_x = 1, .ofs_y = -5},
    {.bitmap_index = 1190, .adv_w = 154, .box_w = 7, .box_h = 19, .ofs_x = 1, .ofs_y = -5},
    {.bitmap_index = 1207, .adv_w = 108, .box_w = 4, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1214, .adv_w = 134, .box_w = 6, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1225, .adv_w = 92, .box_w = 5, .box_h = 16, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1235, .adv_w = 154, .box_w = 7, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1248, .adv_w = 131, .box_w = 7, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1261, .adv_w = 213, .box_w = 12, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1282, .adv_w = 127, .box_w = 7, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1295, .adv_w = 127, .box_w = 7, .box_h = 19, .ofs_x = 1, .ofs_y = -5},
    {.bitmap_index = 1312, .adv_w = 133, .box_w = 6, .box_h = 14, .ofs_x = 1, .ofs_y = 0},
    {.bitmap_index = 1323, .adv_w = 96, .box_w = 5, .box_h = 22, .ofs_x = 1, .ofs_y = -2},
    {.bitmap_index = 1337, .adv_w = 76, .box_w = 1, .box_h = 24, .ofs_x = 2, .ofs_y = -5},
    {.bitmap_index = 1340, .adv_w = 96, .box_w = 5, .box_h = 22, .ofs_x = 0, .ofs_y = -2},
    {.bitmap_index = 1354, .adv_w = 151, .box_w = 7, .box_h = 1, .ofs_x = 1, .ofs_y = 8}
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
    -9, -16, -20, -12, -6, -6, -6, -6,
    -16, -8, -12, -14, -14, -12, -8, -8,
    -8, -8, -20, -20, -22, -16, -16, -18,
    -6, -6, -6, -6, -6, -14, -14, -8,
    -14, -14, -12, -10, -10, -10, -10, -10,
    -12, -10, -12, -10, -14, -8, -4, -4,
    -4, -4, -8, -14, -10, -10, -6, -8,
    -8, -14, -10, -6, -4, -8, -14, -10,
    -6, 8, -6, -4, -4, -14, -10, -14,
    -6, -4, -4, -8, 4, -10, -10, -10,
    -2, -8, -10, -6
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
const lv_font_t ui_font_Font10 = {
#else
lv_font_t ui_font_Font10 = {
#endif
    .get_glyph_dsc = lv_font_get_glyph_dsc_fmt_txt,    /*Function pointer to get glyph's data*/
    .get_glyph_bitmap = lv_font_get_bitmap_fmt_txt,    /*Function pointer to get glyph's bitmap*/
    .line_height = 25,          /*The maximum line height required by the font*/
    .base_line = 5,             /*Baseline measured from the bottom of the line*/
#if !(LVGL_VERSION_MAJOR == 6 && LVGL_VERSION_MINOR == 0)
    .subpx = LV_FONT_SUBPX_NONE,
#endif
#if LV_VERSION_CHECK(7, 4, 0) || LVGL_VERSION_MAJOR >= 8
    .underline_position = -1,
    .underline_thickness = 1,
#endif
    .dsc = &font_dsc,          /*The custom font data. Will be accessed by `get_glyph_bitmap/dsc` */
#if LV_VERSION_CHECK(8, 2, 0) || LVGL_VERSION_MAJOR >= 9
    .fallback = NULL,
#endif
    .user_data = NULL,
};



#endif /*#if UI_FONT_FONT10*/

