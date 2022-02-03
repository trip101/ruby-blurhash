#include "decode.h"

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_writer.h"
#include <ruby.h>

VALUE DECODER = Qnil;  /* Ruby Module */

VALUE method_decode(VALUE self, VALUE path, VALUE blurhash, VALUE heigh, VALUE widt, VALUE punc) {
    const char * hash = StringValuePtr(blurhash);
    int height = NUM2INT(heigh);
    int width = NUM2INT(widt);
    int punch = NUM2INT(punc);

    const char * output_file = StringValuePtr(path);

    const int nChannels = 4;

    uint8_t * bytes = decode(hash, width, height, punch, nChannels);
    if (!bytes) {
		fprintf(stderr, "%s is not a valid blurhash, decoding failed.\n", hash);
		return 1;
	}

	if (stbi_write_png(output_file, width, height, nChannels, bytes, nChannels * width) == 0) {
		fprintf(stderr, "Failed to write PNG file %s\n", output_file);
		return 1;
	}
    freePixelArray(bytes);
    fprintf(stdout, "Decoded blurhash successfully, wrote PNG file %s\n", output_file);
    return 0;
}

void
Init_blurhash_decoder(void) {
    DECODER = rb_define_module("DECODER");
    rb_define_method(DECODER, "decode", method_decode, 5);
}

