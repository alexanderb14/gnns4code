kernel void A(const unsigned int a, const unsigned int b, const unsigned int c, const unsigned int d, const unsigned int e, global const double* restrict f, global const double* restrict g, global const double* restrict h, global const double* restrict i, global const double* restrict j, global const double* restrict k, global const double* restrict l, global const double* restrict m, global const double* restrict n, global const double* restrict o, global const double* restrict p, global const double* restrict q, global const double* restrict r, global const double* restrict s, global const double* restrict t, global const double* restrict u, global const double* restrict v, global const double* restrict w, global double* restrict x, local double* restrict y) {
  const size_t z = get_local_id(0);
  const size_t aa = get_group_id(0);

  const size_t ab = get_global_id(1) % a;
  const size_t ac = (get_global_id(1) / a) % b;
  const size_t ad = get_global_id(1) / (a * b);

  y[z] = 0.0;
  for (unsigned int ae = z; ae < d; ae += get_local_size(0)) {
    const double af = w[ae];
    if (v[aa] != 0.0) {
      y[z] += af * (0.5 * (n[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + f[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))])) +
              af * (0.5 * (o[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + g[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))])) +
              af * (0.5 * (p[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + h[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))])) +
              af * (0.5 * (q[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + i[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))])) +
              af * (0.5 * (r[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + j[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))])) +
              af * (0.5 * (s[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + k[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))])) +
              af * (0.5 * (t[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + l[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))])) +
              af * (0.5 * (u[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + m[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))]));
    } else {
      y[z] += af * n[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + af * o[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + af * p[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] +
              af * q[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + af * r[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + af * s[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] +
              af * t[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))] + af * u[(((ae)) + ((d) * ((aa))) + ((d) * (e) * ((ab))) + ((d) * (e) * (a) * ((ac))) + ((d) * (e) * (a) * (b) * ((ad))))];
    }
  }

  barrier(1);

  for (unsigned int ag = get_local_size(0) / 2; ag > 0; ag /= 2) {
    if (z < ag) {
      y[z] += y[z + ag];
    }
    barrier(1);
  }

  if (z == 0) {
    x[(((aa)) + ((e) * ((ab))) + ((e) * (a) * ((ac))) + ((e) * (a) * (b) * ((ad))))] = y[0];
  }
}