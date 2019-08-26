__kernel void A(__global float* a, __constant float* b, __global float* c, const int d, const float e) {
  const int f = get_global_size(0);

  const int g = get_global_id(0);
  const int h = get_global_id(1);

  float i = 0;
  int j = 0;

  for (int k = 0; k < d; k++) {
    for (j = 0; j < d; j++) {
      i += b[k * d + j] * a[(h + k) * (f + d - 1) + g + j];
    }
  }
  c[h * f + g] = i + e;
}