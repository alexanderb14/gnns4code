__kernel void A(__global double* a, __global double* b, __global double* c, const int d) {
  const int e = 32;

  __local double f[32][32];

  __local double g[32][32];

  double h = 0.;

  size_t i = get_global_id(0);
  size_t j = get_global_id(1);

  for (size_t k = 0; k < d / e; ++k) {
    f[get_local_id(0)][get_local_id(1)] = a[i * d + (k * e + get_local_id(1))];
    g[get_local_id(0)][get_local_id(1)] = b[(k * e + get_local_id(0)) * d + j];

    barrier(1);

    for (size_t l = 0; l < e; l++)
      h += f[get_local_id(0)][l] * g[l][get_local_id(1)];

    barrier(1);
  }

  c[i * d + j] = h;
}