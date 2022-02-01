#include "encode.h"

#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

#include <ruby.h>
#include <stdio.h>
#include <string.h>


VALUE ENCODER = Qnil;  /* Ruby Module */

const char *blurHashForFile(int xComponents, int yComponents,const char *filename);

VALUE method_encode(VALUE self, VALUE x, VALUE y) {
    int xComponents = NUM2INT(x);
    int yComponents = NUM2INT(y);

    const char * input_file = "buffer/in.png";

    if(xComponents < 1 || xComponents > 8 || yComponents < 1 || yComponents > 8) {
		fprintf(stderr, "Component counts must be between 1 and 8.\n");
		return 1;
	}

	const char *hash = blurHashForFile(xComponents, yComponents, input_file);
	if(!hash) {
		fprintf(stderr, "Failed to load image file \"%s\".\n", input_file);
		return 1;
	}

	return rb_str_new(hash, strlen(hash));
}

const char *blurHashForFile(int xComponents, int yComponents,const char *filename) {
	int width, height, channels;
	unsigned char *data = stbi_load(filename, &width, &height, &channels, 3);
	if(!data) return NULL;

	const char *hash = blurHashForPixels(xComponents, yComponents, width, height, data, width * 3);

	stbi_image_free(data);

	return hash;
}

void
Init_blurhash_encoder(void) {
    ENCODER = rb_define_module("ENCODER");
    rb_define_method(ENCODER, "encode", method_encode, 2);
}

