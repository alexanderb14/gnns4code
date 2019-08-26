__kernel void A(int a, int b, __global int* c, __global int* d, __global double* e, __local int* f, __local int* g, __local double* h) {
  size_t i = get_global_id(0);
  size_t j = get_local_id(0);
  size_t k = get_local_size(0);
  size_t l = a * b;

  if (i < l) {
    f[j] = c[i];
    g[j] = d[i];
    h[j] = e[i];

    h[j] = (exp(h[j]) * f[j]) / (g[j]);

    e[i] = h[j];
  } else {
    h[j] = 0.0;
  }
}