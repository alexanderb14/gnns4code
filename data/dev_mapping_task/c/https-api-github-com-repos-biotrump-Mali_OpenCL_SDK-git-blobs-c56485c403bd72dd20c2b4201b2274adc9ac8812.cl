float4 A(int a) {
  return (float4)(a, a + 1, a + 2, a + 3);
}
__kernel void B(__global uchar* restrict a, const int b, const int c) {
  int d = get_global_id(0) * 4;
  int e = get_global_id(1);
  float4 f = -2 + (A(d) / (float)b * 2.5f);
  float4 g = -1 + (e / (float)c * 2);

  float4 h = f;
  float4 i = g;

  int4 j = (int4)(0, 0, 0, 0);

  int k = 0;
  int4 l;

  do {
    k++;
    if (k > 255) {
      break;
    }

    float4 m = h;

    h = h * h - i * i + f;
    i = 2 * m * i + g;
    float4 n = h * h + i * i;

    l = isless(n, (float4)4.0f);

    j -= l;
  } while (any(l));

  vstore4(convert_uchar4(j), 0, a + d + e * b);
}