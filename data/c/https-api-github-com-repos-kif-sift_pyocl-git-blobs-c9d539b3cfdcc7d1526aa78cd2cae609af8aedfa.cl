typedef float4 keypoint; __kernel void A(__global keypoint* a, __global float* b, __global float* c, __global int* d, int e, float f, int g, int h, int i, int j, int k) {
  int l = get_global_id(0);
  keypoint m = a[l];
  if (!(h <= l && l < i && m.s1 >= 0.0f))
    return;
  int n, o = 0, p = 0;
  int q, r, s, t;
  int u;
  float v, w, x, y = 0.0;
  float z, aa, ab;
  float ac[36];

  for (q = 0; q < 36; q++)
    ac[q] = 0.0f;

  int ad = (int)(m.s1 + 0.5), ae = (int)(m.s2 + 0.5);

  float af = f * m.s3;
  int ag = (int)(af * 3.0);
  int ah = ((0) < (ad - ag) ? (ad - ag) : (0));
  int ai = ((0) < (ae - ag) ? (ae - ag) : (0));
  int aj = ((ad + ag) < (k - 2) ? (ad + ag) : (k - 2));
  int ak = ((ae + ag) < (j - 2) ? (ae + ag) : (j - 2));

  for (s = ah; s <= aj; s++) {
    for (t = ai; t <= ak; t++) {
      w = b[s * j + t];

      float al = (s - m.s1);
      v = al * al;
      al = (t - m.s2);
      v += al * al;

      if (w > 0.0f && v < ((float)(ag * ag)) + 0.5f) {
        x = c[s * j + t];
        n = (int)(36.0f * (x + 0x1.921fb6p+1f + 0.001f) / (2.0f * 0x1.921fb6p+1f));
        if (n >= 0 && n <= 36) {
          n = ((n) < (35) ? (n) : (35));
          ac[n] += exp(-v / (2.0f * af * af)) * w;
        }
      }
    }
  }

  for (r = 0; r < 6; r++) {
    float o, am;
    o = ac[35];
    for (q = 0; q < 36; q++) {
      am = ac[q];
      ac[q] = (o + ac[q] + ac[(q + 1 == 36) ? 0 : q + 1]) / 3.0;
      o = am;
    }
  }

  float an = 0.0f;
  int ao = 0;
  for (q = 0; q < 36; q++) {
    if (an < ac[q]) {
      an = ac[q];
      ao = q;
    }
  }

  o = (ao == 0 ? 35 : ao - 1);
  p = (ao == 35 ? 0 : ao + 1);
  z = ac[o];
  ab = ac[p];
  if (an < 0.0f) {
    z = -z;
    an = -an;
    ab = -ab;
  }
  y = 0.5f * (z - ab) / (z - 2.0f * an + ab);
  x = 2.0f * 0x1.921fb6p+1f * (ao + 0.5f + y) / 36.0f - 0x1.921fb6p+1f;

  m.s0 = m.s2 * e;
  m.s1 = m.s1 * e;
  m.s2 = m.s3 * e;
  m.s3 = x;
  a[l] = m;

  for (q = 0; q < 36; q++) {
    int o = (q == 0 ? 35 : q - 1);
    int p = (q == 35 ? 0 : q + 1);
    float z = ac[o];
    float aa = ac[q];
    float ab = ac[p];
    if (aa > z && aa > ab && aa >= 0.8f * an && q != ao) {
      if (aa < 0.0f) {
        z = -z;
        aa = -aa;
        ab = -ab;
      }
      float y = 0.5f * (z - ab) / (z - 2.0f * aa + ab);
      float x = 2.0f * 0x1.921fb6p+1f * (q + 0.5f + y) / 36.0 - 0x1.921fb6p+1f;
      if (x >= -0x1.921fb6p+1f && x <= 0x1.921fb6p+1f) {
        m.s3 = x;
        u = atomic_add(d, 1);
        if (u < g)
          a[u] = m;
      }
    }
  }
}