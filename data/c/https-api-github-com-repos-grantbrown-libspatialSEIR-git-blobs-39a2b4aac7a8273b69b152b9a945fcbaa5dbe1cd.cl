__kernel void A(int a, int b, __global double* c, __global double* d, __global double* e, __local double* f, __local double* g) {
  size_t h = get_global_id(0);
  size_t i = get_local_id(0);
  size_t j = get_local_size(0);
  size_t k = a * b;
  int l;

  if (h < k) {
    f[i] = c[h];
    g[i] = e[h];
    l = d[h % b];
    e[h] = 1 - exp(-l * (f[i] + g[i]));
  }
}