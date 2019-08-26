__kernel void A(const __global float* a, __global float* b, int c, int d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);
  float g = 0.0f;
  for (int h = 0; h < d; h++) {
    const int i = (f + h) * c + e;
    for (int j = 0; j < d; j++) {
      g += a[i + j];
    }
  }
  b[f * get_global_size(0) + e] = g;
}