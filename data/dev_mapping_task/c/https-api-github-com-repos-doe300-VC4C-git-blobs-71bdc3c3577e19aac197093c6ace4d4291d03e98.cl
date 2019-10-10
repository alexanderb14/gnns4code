kernel void A(const int a, const float b, const float c, global float* d, global const float* e, global float* f) {
  const int g = get_global_id(0);
  if (g >= a) {
    return;
  }

  d[g] = c * d[g] - b * e[g];

  f[g] += d[g];
}