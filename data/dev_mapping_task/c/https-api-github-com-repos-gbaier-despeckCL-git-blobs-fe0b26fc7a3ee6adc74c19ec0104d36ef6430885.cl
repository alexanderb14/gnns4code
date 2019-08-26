__kernel void A(__global float* a, __global float* b, const int c, const int d, const int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  const int h = (e - 1) / 2;

  float i = 0.0f;
  float j = 0.0f;

  if (f < c && g < d) {
    for (int k = 0; k < e * e; k++) {
      const int l = k * c * d + f * d + g;
      const float m = a[l];
      i += m;
      j += m * m;
    }
    b[f * d + g] = i * i / j;
  }
}