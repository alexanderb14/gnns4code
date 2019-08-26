kernel void A(global float* a, global float* b, global float* c, unsigned int d) {
  uint e, f = get_global_id(0);
  uint g = get_global_id(1);
  uint h = get_global_size(0);

  float i = c[f + g * h];

  for (e = 0; e < d; ++e)
    i += a[e + g * d] * b[f + e * h];

  c[f + g * h] = i;
}