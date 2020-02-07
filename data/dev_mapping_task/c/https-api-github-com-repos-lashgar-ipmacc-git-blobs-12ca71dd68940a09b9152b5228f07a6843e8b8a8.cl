__kernel void A(int a, global double* b, global double* c, global double* d, int e, int f, int g, int h, double i, double j, double k, double l, double m, double n, double o, double p, double q) {
  local double r[16][16];
  local double s[16][16];
  local double t[16][16];

  double u = 80.0f;

  int v = get_group_id(0);
  int w = get_group_id(1);

  int x = get_local_id(0);
  int y = get_local_id(1);
  int z = 16 - a * 2;
  int aa = 16 - a * 2;

  int ab = z * w - h;
  int ac = aa * v - g;
  int ad = ab + 16 - 1;
  int ae = ac + 16 - 1;

  int af = ab + y;
  int ag = ac + x;

  int ah = af, ai = ag;
  int aj = e * ah + ai;

  if (((ah) >= (0) && (ah) <= (f - 1)) && ((ai) >= (0) && (ai) <= (e - 1))) {
    r[y][x] = c[aj];
    s[y][x] = b[aj];
  }
  barrier(1);

  int ak = (ab < 0) ? -ab : 0;
  int al = (ad > f - 1) ? 16 - 1 - (ad - f + 1) : 16 - 1;
  int am = (ac < 0) ? -ac : 0;
  int an = (ae > e - 1) ? 16 - 1 - (ae - e + 1) : 16 - 1;

  int ao = y - 1;
  int ap = y + 1;
  int aq = x - 1;
  int ar = x + 1;

  ao = (ao < ak) ? ak : ao;
  ap = (ap > al) ? al : ap;
  aq = (aq < am) ? am : aq;
  ar = (ar > an) ? an : ar;

  bool as;
  for (int at = 0; at < a; at++) {
    as = false;
    if (((x) >= (at + 1) && (x) <= (16 - at - 2)) && ((y) >= (at + 1) && (y) <= (16 - at - 2)) && ((x) >= (am) && (x) <= (an)) && ((y) >= (ak) && (y) <= (al))) {
      as = true;
      t[y][x] = r[y][x] + n * (s[y][x] + (r[ap][x] + r[ao][x] - 2.0f * r[y][x]) * p + (r[y][ar] + r[y][aq] - 2.0f * r[y][x]) * o + (u - r[y][x]) * q);
    }
    barrier(1);

    if (at == a - 1)
      break;
    if (as)
      r[y][x] = t[y][x];

    barrier(1);
  }

  if (as) {
    d[aj] = t[y][x];
  }
}