kernel void A(const unsigned int a, const unsigned int b, const unsigned int c, const unsigned int d, const unsigned int e, global const double* restrict f, global const double* restrict g, global const double* restrict h, global const double* restrict i, global const double* restrict j, global const double* restrict k, global double* restrict l) {
  size_t m = get_global_id(0);
  size_t n = get_global_id(1);

  for (unsigned int o = 0; o < c; o++)
    for (unsigned int p = 0; p < b; p++)
      for (unsigned int q = 0; q < a; q++)
        l[(((m)) + ((d) * ((n))) + ((d) * (e) * ((q))) + ((d) * (e) * (a) * ((p))) + ((d) * (e) * (a) * (b) * ((o))))] = 1.0 / (f[n] + g[n] + h[m] * i[0] + j[m] + k[m]);
}