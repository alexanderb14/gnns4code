__kernel void A(const __global float* a, const __global float* b, __global float* c, const uint d, const uint e, const uint f) {
  const size_t g = (uint)__clc_ceil((float)((float)e / (float)16));

  const size_t h = get_group_id(0);
  const size_t i = get_group_id(1);

  const size_t j = get_local_id(0);
  const size_t k = get_local_id(1);

  float l = 0.0f;

  __local float m[16][16];
  __local float n[16][16];

  for (size_t o = 0; o < g; o++) {
    const size_t p = (h * 16) + j;
    const size_t q = (o * 16) + k;

    const size_t r = (o * 16) + j;
    const size_t s = (i * 16) + k;

    if (p >= d || q >= e)
      m[j][k] = 0.0f;
    else
      m[j][k] = a[p * e + q];

    if (r >= e || s >= f)
      n[j][k] = 0.0f;
    else
      n[j][k] = b[r * f + s];

    barrier(1);

    for (size_t t = 0; t < 16; t++)
      l += m[j][t] * n[t][k];

    barrier(1);
  }

  const size_t u = get_global_id(0);
  const size_t v = get_global_id(1);
  const size_t w = (h * 16 * f) + (i * 16) + (j * f) + k;
  if (u < d && v < f)
    c[w] = l;
}