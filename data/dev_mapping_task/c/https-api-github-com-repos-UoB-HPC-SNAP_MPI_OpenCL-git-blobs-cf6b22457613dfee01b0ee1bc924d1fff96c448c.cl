struct cell_id {
  unsigned int i, j, k;
};
kernel void A(const unsigned int a, const unsigned int b, const unsigned int c, const unsigned int d, const unsigned int e, const unsigned int f, const int g, const int h, const int i, const unsigned int j, const unsigned int k, global const struct cell_id* l, global const double* restrict m, global const double* restrict n, global const double* restrict o, global const double* restrict p, global const double* restrict q, global const double* restrict r, global const double* restrict s,
              global const double* restrict t, global const double* restrict u, global const double* restrict v, global double* restrict w, global double* restrict x, global double* restrict y, global double* restrict z) {
  const size_t aa = get_global_id(0) % d;
  const size_t ab = get_global_id(0) / d;

  const size_t ac = (g > 0) ? l[get_global_id(1)].i : a - l[get_global_id(1)].i - 1;
  const size_t ad = (h > 0) ? l[get_global_id(1)].j : b - l[get_global_id(1)].j - 1;
  const size_t ae = (i > 0) ? l[get_global_id(1)].k + k : c - l[get_global_id(1)].k - k - 1;

  double af = m[(((0)) + ((f) * ((ab))) + ((f) * (e) * ((ac))) + ((f) * (e) * (a) * ((ad))) + ((f) * (e) * (a) * (b) * ((ae))))];

  for (unsigned int ag = 1; ag < f; ag++) {
    af += n[(((aa)) + ((d) * ((ag))) + ((d) * (f) * (j)))] * m[(((ag)) + ((f) * ((ab))) + ((f) * (e) * ((ac))) + ((f) * (e) * (a) * ((ad))) + ((f) * (e) * (a) * (b) * ((ae))))];
  }

  double ah = af + w[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ad))) + ((d) * (e) * (b) * ((ae))))] * r[aa] * o[0] + x[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ae))))] * p[aa] + y[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))))] * q[aa];

  if (s[ab] != 0.0) {
    ah += s[ab] * v[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))) + ((d) * (e) * (a) * (b) * ((ae))))];
  }

  ah *= u[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))) + ((d) * (e) * (a) * (b) * ((ae))))];

  double ai = 2.0 * ah - w[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ad))) + ((d) * (e) * (b) * ((ae))))];
  double aj = 2.0 * ah - x[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ae))))];
  double ak = 2.0 * ah - y[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))))];

  if (s[ab] != 0.0) {
    ah = 2.0 * ah - v[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))) + ((d) * (e) * (a) * (b) * ((ae))))];
  }

  double al[4];
  int am = 4;
  for (int an = 0; an < 4; an++) {
    al[0] = (ai < 0.0) ? 0.0 : 1.0;
    al[1] = (aj < 0.0) ? 0.0 : 1.0;
    al[2] = (ak < 0.0) ? 0.0 : 1.0;
    al[3] = (ah < 0.0) ? 0.0 : 1.0;

    if (am == al[0] + al[1] + al[2] + al[3])
      continue;

    am = al[0] + al[1] + al[2] + al[3];

    ah = w[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ad))) + ((d) * (e) * (b) * ((ae))))] * r[aa] * o[0] * (1.0 + al[0]) + x[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ae))))] * p[aa] * (1.0 + al[1]) + y[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))))] * q[aa] * (1.0 + al[2]);

    if (s[ab] != 0.0) {
      ah += s[ab] * v[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))) + ((d) * (e) * (a) * (b) * ((ae))))] * (1.0 + al[3]);
    }

    ah = 0.5 * ah + af;

    double ao = t[ab] + r[aa] * o[0] * al[0] + p[aa] * al[1] + q[aa] * al[2] + s[ab] * al[3];
    if (ao > 1.0E-12) {
      ah /= ao;
    } else {
      ah = 0.0;
    }

    ai = 2.0 * ah - w[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ad))) + ((d) * (e) * (b) * ((ae))))];
    aj = 2.0 * ah - x[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ae))))];
    ak = 2.0 * ah - y[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))))];

    if (s[ab] != 0.0) {
      ah = 2.0 * ah - v[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))) + ((d) * (e) * (a) * (b) * ((ae))))];
    }
  }

  w[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ad))) + ((d) * (e) * (b) * ((ae))))] = ai * al[0];
  x[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ae))))] = aj * al[1];
  y[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))))] = ak * al[2];
  z[(((aa)) + ((d) * ((ab))) + ((d) * (e) * ((ac))) + ((d) * (e) * (a) * ((ad))) + ((d) * (e) * (a) * (b) * ((ae))))] = ah * al[3];
}