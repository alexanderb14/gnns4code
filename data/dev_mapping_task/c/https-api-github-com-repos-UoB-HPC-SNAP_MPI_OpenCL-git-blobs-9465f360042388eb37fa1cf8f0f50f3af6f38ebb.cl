kernel void A(const double a, const double b, const double c, global const double* restrict d, global const double* restrict e, global double* restrict f, global double* restrict g, global double* restrict h) {
  size_t i = get_global_id(0);

  if (i == 0 && get_group_id(0) == 0)
    f[0] = 2.0 / a;

  g[i] = (2.0 / b) * d[i];
  h[i] = (2.0 / c) * e[i];
}