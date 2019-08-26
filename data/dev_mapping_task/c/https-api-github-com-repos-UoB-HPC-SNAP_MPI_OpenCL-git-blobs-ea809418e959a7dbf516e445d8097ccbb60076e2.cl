kernel void A(const unsigned int a, const unsigned int b, const unsigned int c, const unsigned int d, const unsigned int e, const unsigned int f, global const double* restrict g, global const double* restrict h, global const double* restrict i, global const double* restrict j, global const double* restrict k, global const double* restrict l, global const double* restrict m, global const double* restrict n, global const double* restrict o, global const double* restrict p, global const double* restrict q, global const double* restrict r, global const double* restrict s, global const double* restrict t, global const double* restrict u, global const double* restrict v, global const double* restrict w, global const double* restrict x, global const double* restrict y, global double* restrict z, local double* restrict aa) {
  const size_t ab = get_local_id(0);
  const size_t ac = get_group_id(0);

  const size_t ad = get_global_id(1) % a;
  const size_t ae = (get_global_id(1) / a) % b;
  const size_t af = get_global_id(1) / (a * b);

  for (unsigned int ag = 0; ag < f - 1; ag++) {
    aa[ab] = 0.0;
    for (unsigned int ah = ab; ah < d; ah += get_local_size(0)) {
      const double ai = x[ah];
      if (w[ac] != 0.0) {
        aa[ab] += y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (0)))] * ai * (0.5 * (o[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + g[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))])) +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (1)))] * ai * (0.5 * (p[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + h[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))])) +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (2)))] * ai * (0.5 * (q[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + i[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))])) +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (3)))] * ai * (0.5 * (r[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + j[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))])) +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (4)))] * ai * (0.5 * (s[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + k[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))])) +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (5)))] * ai * (0.5 * (t[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + l[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))])) +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (6)))] * ai * (0.5 * (u[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + m[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))])) +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (7)))] * ai * (0.5 * (v[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + n[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))]));
      } else {
        aa[ab] += y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (0)))] * ai * o[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (1)))] * ai * p[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (2)))] * ai * q[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (3)))] * ai * r[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (4)))] * ai * s[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (5)))] * ai * t[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] +
                  y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (6)))] * ai * u[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))] + y[(((ah)) + ((d) * ((ag + 1))) + ((d) * (f) * (7)))] * ai * v[(((ah)) + ((d) * ((ac))) + ((d) * (e) * ((ad))) + ((d) * (e) * (a) * ((ae))) + ((d) * (e) * (a) * (b) * ((af))))];
      }
    }

    barrier(1);

    for (unsigned int aj = get_local_size(0) / 2; aj > 0; aj /= 2) {
      if (ab < aj) {
        aa[ab] += aa[ab + aj];
      }
      barrier(1);
    }

    if (ab == 0) {
      z[(((ag)) + ((f - 1) * ((ac))) + ((f - 1) * (e) * ((ad))) + ((f - 1) * (e) * (a) * ((ae))) + ((f - 1) * (e) * (a) * (b) * ((af))))] = aa[0];
    }
  }
}