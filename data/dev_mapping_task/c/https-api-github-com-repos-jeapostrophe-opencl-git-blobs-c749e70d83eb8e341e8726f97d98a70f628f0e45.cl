__kernel void A(__global float* a, __global float* b, __global float* c, __local float* d, uint e, uint f, uint g, uint h) {
  size_t i = get_local_id(0);
  size_t j = get_group_id(0);
  size_t k = get_global_id(0);
  size_t l = get_local_size(0);

  d[i * 2] = a[j * l * 2 + i * 2];
  d[i * 2 + 1] = a[j * l * 2 + i * 2 + 1];

  if (0 == g) {
    d[i * 2] /= sqrt((float)f);
    d[i * 2 + 1] /= sqrt((float)f);
  }

  barrier(1);

  uint m = e > h ? h : e;
  uint n = (1 << m) / 2;
  uint o = f / 2;

  for (uint p = 0; p < m; ++p) {
    if (i < n) {
      float q = d[2 * i];
      float r = d[2 * i + 1];

      d[i] = (q + r) / sqrt((float)2);
      uint s = o + j * n + i;
      b[s] = (q - r) / sqrt((float)2);

      o >>= 1;
    }
    n >>= 1;
    barrier(1);
  }

  if (0 == i)
    c[j] = d[0];
}