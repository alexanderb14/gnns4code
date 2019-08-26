kernel void A(const int a, const unsigned b, long c, unsigned long d, const float e, global int* f, global unsigned int* g, global long* h, global unsigned long* i, global float* j) {
  const int k = get_global_id(0);

  f[k] = a + k;
  g[k] = b + k;
  h[k] = c + k;
  i[k] = d + k;

  j[k] = e + k;
}