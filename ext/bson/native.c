#include <ruby.h>
#include <stdint.h>

static char null_byte = 0;

static VALUE rb_buffer_bytes(VALUE buffer)
{
  return rb_iv_get(buffer, "@bytes");
}

static VALUE bson_buffer_write_cstring(VALUE buffer, VALUE value)
{
  VALUE bytes = rb_buffer_bytes(buffer);
  rb_str_cat2(bytes, RSTRING_PTR(value));
  rb_str_cat(bytes, &null_byte, 1);
  return buffer;
}

static VALUE bson_buffer_write_int32(VALUE buffer, VALUE value)
{
  const int32_t v = NUM2INT(value);
  const char bytes[4] = { v & 255, (v >> 8) & 255, (v >> 16) & 255, (v >> 24) & 255 };
  rb_str_cat(rb_buffer_bytes(buffer), bytes, 4);
  return buffer;
}

static VALUE bson_buffer_write_string(VALUE buffer, VALUE value)
{
  const int length = RSTRING_LEN(value) + 1;
  VALUE bytes = rb_buffer_bytes(buffer);
  bson_buffer_write_int32(buffer, INT2NUM(length));
  rb_str_cat(bytes, RSTRING_PTR(value), length);
  rb_str_cat(bytes, &null_byte, 1);
  return buffer;
}

void Init_native()
{
  VALUE bson = rb_const_get(rb_cObject, rb_intern("BSON"));
  VALUE buffer = rb_const_get(bson, rb_intern("Buffer"));

  rb_remove_method(buffer, "write_cstring");
  rb_define_method(buffer, "write_cstring", bson_buffer_write_cstring, 1);

  rb_remove_method(buffer, "write_int32");
  rb_define_method(buffer, "write_int32", bson_buffer_write_int32, 1);

  rb_remove_method(buffer, "write_string");
  rb_define_method(buffer, "write_string", bson_buffer_write_string, 1);
}
