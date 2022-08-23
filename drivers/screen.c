// screen driver "implementation" file

#include "screen.h"


// print char on screen at col, row, or at cursor position
void
print_char(char character, int col, int row, char attribute_byte)
{
    unsigned char *vidmem = (unsigned char*) VIDEO_ADDRESS;

    if(!attribute_byte){
        attribute_byte = WHITE_ON_BLACK;
    }

    // get the video mem offset for the screen location
    int offset;
    // if col and row are non-negative use them for offset
    if(col >= 0 && row >= 0){
        offset = get_screen_offset(col, row);
        // otherwise use the current cursor position
    }else{
        offset = get_cursor();
    }


    // if we see a newline char, set offset to the end of
    // current row, so it will be advanced to the first col of next row
    if(character == '\n'){
        int rows = offset / (2 * MAX_COLS);
        // Otherwise write the char and it's attribute byte to 
        // video memory at our calculated offset
    }else{
        vidmem[offset] = character;
        vidmem[offset + 1] = attribute_byte;
    }


    // Update the offset to the next character cell, which is
    // is two bytes ahead of current cell 
    offset += 2;
    // make scrolling adjustment, for when we reach the bottom 
    // of the screen
    offset = handle_scrolling(offset);
    // update the cursor position on the screen device
    set_cursor(offset);

}