__kernel void A(__global const float* a, const int b, const int c, __global float* d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);
  const int g = get_global_id(2);

  const int h = (((g * c) + f) * b) + e;

  float16 i = vload16(0, a + h);
  float16 j = vload16(0, a + h + b);
  float16 k = vload16(0, a + h + b * 2);

  *(d + h + b + (9 - 1) / 2 + 1) = (i.s0 + i.s1 + i.s2 + i.s3 + i.s4 + i.s5 + i.s6 + i.s7 + i.s8 + j.s0 + j.s1 + j.s2 + j.s3 + j.s4 + j.s5 + j.s6 + j.s7 + j.s8 + k.s0 + k.s1 + k.s2 + k.s3 + k.s4 + k.s5 + k.s6 + k.s7 + k.s8) / 81;
}