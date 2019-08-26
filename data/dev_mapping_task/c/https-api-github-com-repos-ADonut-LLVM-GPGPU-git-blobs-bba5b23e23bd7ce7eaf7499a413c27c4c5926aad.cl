typedef __attribute__((ext_vector_type(2))) int int2; typedef __attribute__((ext_vector_type(3))) int int3; typedef __attribute__((ext_vector_type(4))) int int4; typedef __attribute__((ext_vector_type(8))) int int8; typedef __attribute__((ext_vector_type(4))) float float4; void A() {
  int4 a = (int4)(1, 2, 3, 4);
  int4 b = (int4)((int2)(1, 2), 3, 4);
  int4 c = (int4)(1, (int2)(2, 3), 4);
  int4 d = (int4)(1, 2, (int2)(3, 4));
  int4 e = (int4)((int2)(1, 2), (int2)(3, 4));
  int4 f = (int4)((int3)(1, 2, 3), 4);
  int4 g = (int4)(1, (int3)(2, 3, 4));
  int4 h = (int4)(1);
  int8 i = (int8)(1, 2, h.xy, h);
  float4 j = (float4)(1);
}