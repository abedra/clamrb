#include <ruby.h>
#include "clamav.h"

static void clamav_free(void *engine) {
  cl_engine_free(engine);
}

VALUE constructor(VALUE self, VALUE filename)
{
  VALUE t_data;
  const char *dbDir;
  unsigned int signature;

  if (cl_init(CL_INIT_DEFAULT) == CL_SUCCESS) {
    struct cl_engine *engine = cl_engine_new();
    t_data = Data_Wrap_Struct(self, 0, clamav_free, engine);
    dbDir = cl_retdbdir();
    printf("Initializing clamav engine from database located at %s\n", dbDir);
    signature = 0;
    if (cl_load(dbDir, engine, &signature, CL_DB_STDOPT) == CL_SUCCESS
        && cl_engine_compile(engine) == CL_SUCCESS) {
      return t_data;
    } else {
      rb_raise(rb_eRuntimeError, "Error loading clamav database\n");
      return Qnil;
    }
  } else {
    rb_raise(rb_eRuntimeError, "Unable to initialize clamav\n");
    return Qnil;
  }
}

VALUE scan(VALUE self, VALUE filename)
{
  struct cl_engine *engine;
  const char *name;
  long unsigned int scanned;
  int ret;
  VALUE clamrb;
  VALUE clamrb_result;

  Data_Get_Struct(self, struct cl_engine, engine);
  name = NULL;
  scanned = 0;
  ret = cl_scanfile(StringValueCStr(filename), &name, &scanned, engine, CL_SCAN_STDOPT);

  clamrb = rb_const_get(rb_cObject, rb_intern("Clamrb"));
  clamrb_result = rb_const_get(clamrb, rb_intern("Result"));

  switch (ret) {
  case CL_VIRUS:
    return rb_funcall(clamrb_result, rb_intern("new"), 2,
                      ID2SYM(rb_intern("infected")),
                      rb_str_new_cstr(name));

  case CL_CLEAN:
    return rb_funcall(clamrb_result, rb_intern("new"), 1,
		      ID2SYM(rb_intern("clean")));
  default:
    return rb_funcall(clamrb_result, rb_intern("new"), 1,
		      ID2SYM(rb_intern("unknown")));
  }
}

void Init_clamrb(void)
{
  VALUE klass = rb_define_class("Clamrb", rb_cObject);
  rb_define_singleton_method(klass, "new", constructor, 0);
  rb_define_method(klass, "scan", scan, 1);
}
