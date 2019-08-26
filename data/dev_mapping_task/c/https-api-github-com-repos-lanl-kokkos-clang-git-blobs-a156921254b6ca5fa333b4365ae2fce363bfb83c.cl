typedef float float8 __attribute((ext_vector_type(8))); typedef float float32_t; typedef __attribute__((__vector_size__(16))) float32_t __neon_float32x4_t; typedef struct __simd128_float32_t { __neon_float32x4_t val; } float32x4_t;

float8 A(float8 a) {
  float32x4_t b;
  float32x4_t c;
  return (float8)(bval, cval);
}