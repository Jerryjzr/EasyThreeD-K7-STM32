    //Marlin Logo
    #define START_BMPWIDTH      56
    #define START_BMPHEIGHT     19
    #define START_BMPBYTEWIDTH  7
    #define START_BMPBYTES      133 // START_BMPWIDTH * START_BMPHEIGHT / 8

    const unsigned char start_bmp[START_BMPBYTES] PROGMEM = {
      0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
      0x60, 0x00, 0x00, 0x00, 0x00, 0x01, 0xFF,
      0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,
      0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7F,
      0x83, 0xCF, 0x00, 0x00, 0x0C, 0x30, 0x3F,
      0x87, 0xFF, 0x80, 0x00, 0x0C, 0x30, 0x1F,
      0x86, 0x79, 0x80, 0x00, 0x0C, 0x00, 0x0F,
      0x8C, 0x30, 0xC7, 0x83, 0x8C, 0x30, 0xE7,
      0x8C, 0x30, 0xCF, 0xC7, 0xCC, 0x31, 0xF3,
      0x8C, 0x30, 0xDC, 0xEC, 0xEC, 0x33, 0xB9,
      0x8C, 0x30, 0xD8, 0x6C, 0x6C, 0x33, 0x19,
      0x8C, 0x30, 0xD0, 0x6C, 0x0C, 0x33, 0x19,
      0x8C, 0x30, 0xD8, 0x6C, 0x0C, 0x33, 0x19,
      0x8C, 0x30, 0xDC, 0x6C, 0x0E, 0x3B, 0x19,
      0x8C, 0x30, 0xCF, 0x7C, 0x07, 0x9F, 0x19,
      0x8C, 0x30, 0xC7, 0x7C, 0x03, 0x8F, 0x19,
      0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02,
      0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06,
      0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xF8  };