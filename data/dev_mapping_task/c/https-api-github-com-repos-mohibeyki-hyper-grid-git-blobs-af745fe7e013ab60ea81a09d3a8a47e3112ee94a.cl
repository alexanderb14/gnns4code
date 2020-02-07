kernel void A(global float* a, global float* b, global float* c) {
  size_t d = get_global_size(0);
  size_t e = get_global_id(0);
  size_t f = get_global_id(1);

  float g = 0;
  for (int h = 0; h < d; ++h) {
    g += a[f * d + h] * b[h * d + e];
  }

  c[f * d + e] = g;
}