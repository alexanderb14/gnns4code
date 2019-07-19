kernel void A(const unsigned int a, const unsigned int b, const unsigned int c, const unsigned int d, const unsigned int e, const unsigned int f, global const double* restrict g, global const double* restrict h, global const double* restrict i, global const double* restrict j, global double* restrict k) {
  const size_t l = get_global_id(0);
  const size_t m = get_global_id(1);
  const size_t n = get_global_id(2);

  for (unsigned int o = 0; o < d; o++) {
    k[(((0)) + ((e) * ((o))) + ((e) * (d) * ((l))) + ((e) * (d) * (a) * ((m))) + ((e) * (d) * (a) * (b) * ((n))))] = g[(((o)) + ((d) * ((l))) + ((d) * (a) * ((m))) + ((d) * (a) * (b) * ((n))))];

    for (unsigned int p = 0; p < d; p++) {
      if (o == p)
        continue;

      k[(((0)) + ((e) * ((o))) + ((e) * (d) * ((l))) + ((e) * (d) * (a) * ((m))) + ((e) * (d) * (a) * (b) * ((n))))] += h[(((0)) + ((f) * ((p))) + ((f) * (d) * ((o))))] * i[(((p)) + ((d) * ((l))) + ((d) * (a) * ((m))) + ((d) * (a) * (b) * ((n))))];

      unsigned int q = 1;
      for (unsigned int r = 1; r < f; r++) {
        for (unsigned int s = 0; s < 2 * r + 1; s++) {
          k[(((q)) + ((e) * ((o))) + ((e) * (d) * ((l))) + ((e) * (d) * (a) * ((m))) + ((e) * (d) * (a) * (b) * ((n))))] += h[(((r)) + ((f) * ((p))) + ((f) * (d) * ((o))))] * j[(((q - 1)) + ((e - 1) * ((p))) + ((e - 1) * (d) * ((l))) + ((e - 1) * (d) * (a) * ((m))) + ((e - 1) * (d) * (a) * (b) * ((n))))];
          q += 1;
        }
      }
    }
  }
}