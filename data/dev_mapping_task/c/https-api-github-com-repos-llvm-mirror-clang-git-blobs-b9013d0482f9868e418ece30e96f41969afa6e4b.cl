typedef int int2 __attribute((ext_vector_type(2))); typedef int int4 __attribute((ext_vector_type(4))); __constant const int4 Ga = (int4)(1, 2, ((int2)(3, 4))); __constant const int4 Gb = (int4)(1, 2, ((int2)(3))); typedef float float2 __attribute((ext_vector_type(2))); typedef float float4 __attribute((ext_vector_type(4))); void A(float4* a) {
  *a = (float4)(1.1f, 1.2f, ((float2)(1.3f, 1.4f)));
}

float4 B(float4* a) {
  *a = (float4)(1.1f, 1.2f, ((float2)(1.3f)));
}