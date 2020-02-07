kernel void A(const int a, const int b, global float const* c, global float* d) {
  const int e = get_global_id(0);
  const int f = e;

  if (f >= a) {
    return;
  }

  float g = 0;
  global const float* h = c + f * b;
  for (int i = 0; i < b; i++) {
    g += h[i];
  }
  d[f] = g;
}