typedef float4 keypoint; __kernel void A(__global keypoint* a, __global float* b, __global float* c, __global int* d, int e, float f, int g, int h, int i, int j, int k) {
  int l = get_local_id(0);
  int m = get_group_id(0);

  if ((m < h) || (m >= i))
    return;
  keypoint n = a[m];
  if (n.s1 < 0.0f)
    return;

  int o, p = 0, q = 0;
  int r;
  float s, t, u, v = 0.0;
  float w, x, y;
  __local volatile float z[36];
  __local volatile float aa[256];
  __local volatile int ab[256];
  float ac, ad;
  float ae = 1.0f / 3.0f;
  float af = 1.0f / 18.0f;

  ab[l] = -1;
  aa[l] = 0.0f;
  if (l < 36)
    z[l] = 0.0f;

  int ag = (int)(n.s1 + 0.5), ah = (int)(n.s2 + 0.5);

  float ai = f * n.s3;
  int aj = (int)(ai * 3.0);
  int ak = ((0) < (ag - aj) ? (ag - aj) : (0));
  int al = ((0) < (ah - aj) ? (ah - aj) : (0));
  int am = ((ag + aj) < (k - 2) ? (ag + aj) : (k - 2));
  int an = ((ah + aj) < (j - 2) ? (ah + aj) : (j - 2));
  int ao, ap, aq, ar;
  for (aq = ak; aq <= am; aq++) {
    ab[l] = -1;
    aa[l] = 0.0f;

    ar = al + l;
    ab[l] = -1;
    aa[l] = 0.0f;
    if (ar <= an) {
      t = b[aq * j + ar];
      s = (aq - n.s1) * (aq - n.s1) + (ar - n.s2) * (ar - n.s2);
      if (t > 0.0f && s < ((aj * aj) + 0.5f)) {
        u = c[aq * j + ar];
        o = (int)(18.0f * (u + 0x1.921fb6p+1f) * 0x1.45f306p-2f);
        if (o < 0)
          o += 36;
        if (o > 35)
          o -= 36;
        aa[l] = exp(-s / (2.0f * ai * ai)) * t;
        ab[l] = o;
      }
    }
    barrier(1);

    if (l == 0) {
      for (ao = 0; ao < 256; ao++)
        if (ab[ao] != -1)
          z[ab[ao]] += aa[ao];
    }
    barrier(1);
  }

  for (ap = 0; ap < 6; ap++) {
    if (l == 0) {
      aa[0] = z[0];
      z[0] = (z[35] + z[0] + z[1]) * ae;
    }
    barrier(1);
    if (0 < l && l < 35) {
      aa[l] = z[l];
      z[l] = (aa[l - 1] + z[l] + z[l + 1]) * ae;
    }
    barrier(1);
    if (l == 35) {
      z[35] = (aa[34] + z[35] + z[0]) * ae;
    }
    barrier(1);
  }

  aa[l] = 0.0f;

  float as = 0.0f;
  int at = 0;

  ab[l] = -1;
  aa[l] = 0.0f;

  if (l < 32) {
    if (l + 32 < 36) {
      if (z[l] > z[l + 32]) {
        aa[l] = z[l];
        ab[l] = l;
      } else {
        aa[l] = z[l + 32];
        ab[l] = l + 32;
      }
    } else {
      aa[l] = z[l];
      ab[l] = l;
    }
  }
  barrier(1);
  if (l < 16) {
    if (aa[l + 16] > aa[l]) {
      aa[l] = aa[l + 16];
      ab[l] = ab[l + 16];
    }
  }
  barrier(1);
  if (l < 8) {
    if (aa[l + 8] > aa[l]) {
      aa[l] = aa[l + 8];
      ab[l] = ab[l + 8];
    }
  }
  barrier(1);
  if (l < 04) {
    if (aa[l + 04] > aa[l]) {
      aa[l] = aa[l + 04];
      ab[l] = ab[l + 04];
    }
  }
  barrier(1);
  if (l < 02) {
    if (aa[l + 02] > aa[l]) {
      aa[l] = aa[l + 02];
      ab[l] = ab[l + 02];
    }
  }
  barrier(1);
  if (l == 0) {
    if (aa[1] > aa[0]) {
      aa[0] = aa[1];
      ab[0] = ab[1];
    }
    at = ab[0];
    as = aa[0];

    p = (at == 0 ? 35 : at - 1);
    q = (at == 35 ? 0 : at + 1);
    w = z[p];
    y = z[q];
    v = 0.5f * (w - y) / (w - 2.0f * as + y);
    u = (at + 0.5f + v) * af;
    if (u < 0.0f)
      u += 2.0f;
    else if (u > 2.0f)
      u -= 2.0f;

    n.s0 = n.s2 * e;
    n.s1 = n.s1 * e;
    n.s2 = n.s3 * e;
    n.s3 = (u - 1.0f) * 0x1.921fb6p+1f;
    a[m] = n;

    ab[0] = at;
    aa[0] = as;
    aa[1] = n.s0;
    aa[2] = n.s1;
    aa[3] = n.s2;
    aa[4] = n.s3;
  }
  barrier(1);

  n = (float4)(aa, aa, aa, aa);
  at = ab[0];
  as = aa[0];

  if (l < 36 && l != at) {
    ao = l;
    p = (ao == 0 ? 35 : ao - 1);
    q = (ao == 35 ? 0 : ao + 1);
    w = z[p];
    x = z[ao];
    y = z[q];

    if (x > w && x > y && x >= 0.8f * as) {
      v = 0.5f * (w - y) / (w - 2.0f * x + y);
      u = (ao + 0.5f + v) * af;
      if (u < 0.0f)
        u += 2.0f;
      else if (u > 2.0f)
        u -= 2.0f;
      n.s3 = (u - 1.0f) * 0x1.921fb6p+1f;
      r = atomic_add(d, 1);
      if (r < g)
        a[r] = n;
    }
  }
}