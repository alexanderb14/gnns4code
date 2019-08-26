kernel void A(const unsigned int a, const unsigned int b, const unsigned int c, const unsigned int d, const unsigned int e, const unsigned int f, global const double* restrict g, global const double* restrict h, global const double* restrict i, global const double* restrict j, global double* restrict k) {
  const size_t l = get_global_id(0);
  const size_t m = get_global_id(1);
  const size_t n = get_global_id(2);

  for (unsigned int o = 0; o < d; o++) {
    k[(((0)) + ((e) * ((o))) + ((e) * (d) * ((l))) + ((e) * (d) * (a) * ((m))) + ((e) * (d) * (a) * (b) * ((n))))] = g[(((0)) + ((e) * ((o))) + ((e) * (d) * ((l))) + ((e) * (d) * (a) * ((m))) + ((e) * (d) * (a) * (b) * ((n))))] + h[(((0)) + ((f) * ((o))) + ((f) * (d) * ((o))))] * i[(((o)) + ((d) * ((l))) + ((d) * (a) * ((m))) + ((d) * (a) * (b) * ((n))))];

    unsigned int p = 1;
    for (unsigned int q = 1; q < f; q++) {
      for (unsigned int r = 0; r < 2 * q + 1; r++) {
        k[(((p)) + ((e) * ((o))) + ((e) * (d) * ((l))) + ((e) * (d) * (a) * ((m))) + ((e) * (d) * (a) * (b) * ((n))))] = g[(((p)) + ((e) * ((o))) + ((e) * (d) * ((l))) + ((e) * (d) * (a) * ((m))) + ((e) * (d) * (a) * (b) * ((n))))] + h[(((q)) + ((f) * ((o))) + ((f) * (d) * ((o))))] * j[(((p - 1)) + ((e - 1) * ((o))) + ((e - 1) * (d) * ((l))) + ((e - 1) * (d) * (a) * ((m))) + ((e - 1) * (d) * (a) * (b) * ((n))))];
        p += 1;
      }
    }
  }
}