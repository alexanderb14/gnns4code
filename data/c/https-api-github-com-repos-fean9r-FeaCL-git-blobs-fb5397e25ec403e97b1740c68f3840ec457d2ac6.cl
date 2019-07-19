__kernel void A(const __global float* a, __constant float* b, __global float* c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  float h = 0.0f;
  for (int i = 0; i < e; i++) {
    const int j = (g + i) * d + f;
    for (int k = 0; k < e; k++) {
      h += b[(i * e) + k] * a[j + k];
    }
  }
  c[g * get_global_size(0) + f] = h;
}