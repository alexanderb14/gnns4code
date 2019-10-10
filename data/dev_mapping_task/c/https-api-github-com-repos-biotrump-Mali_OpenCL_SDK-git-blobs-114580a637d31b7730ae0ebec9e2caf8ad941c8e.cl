__kernel void A(__global const float* restrict a, __global float* restrict b, const int c) {
  const int d = get_global_id(0) * 4;
  const int e = get_global_id(1);

  const int f = e * c + d;

  float4 g = (float4)0.0f;
  float4 h = vload4(0, a + f);
  float4 i = vload4(0, a + f + 2);
  float4 j = (float4)(h, i);

  g += h * (30.0f * 0.00390625f);
  g += j * (5.0f * 0.00390625f);
  g += i * (6.0f * 0.00390625f);

  h = vload4(0, a + f + c);
  i = vload4(0, a + f + c + 2);
  j = (float4)(h, i);

  g += h * (19.0f * 0.00390625f);
  g += j * (30.0f * 0.00390625f);
  g += i * (9.0f * 0.00390625f);

  h = vload4(0, a + f + c * 2);
  i = vload4(0, a + f + c * 2 + 2);
  j = (float4)(h, i);

  g += h * (15.0f * 0.00390625f);
  g += j * (5.0f * 0.00390625f);
  g += i * (40.0f * 0.00390625f);

  vstore4(g, 0, b + f);
}