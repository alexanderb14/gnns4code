__kernel void A(__global float* a, __constant float* b, __global float* c, const int d, const float e) {
  const int f = get_global_size(0);

  const int g = get_global_id(0);
  const int h = get_global_id(1);

  float2 i = 0;
  float2 j;
  float2 k;

  for (int l = 0; l < d; l++) {
    int m = 0;
    int n = 0;
    while (m <= d - 2) {
      j = vload2(n, b + l * d);
      k = vload2(n, a + (l + h) * (f + d - 1) + g);
      i += k * j;
      m += 2;
      n++;
    }
    for (; m < d; m++) {
      i.x += b[l * d + m] * a[(h + l) * (f + d - 1) + g + m];
    }
  }
  c[h * f + g] = i.x + i.y + e;
}