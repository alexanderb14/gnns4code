typedef float4 keypoint; __kernel void A(__global keypoint* a, __global unsigned char* b, __global float* c, __global float* d, int e, int f, __global int* g, int h, int i) {
  int j = get_local_id(0);
  int k = get_local_id(1);
  int l = get_local_id(2);
  int m = (j * 4 + k) * 4 + l;
  int n = get_group_id(0);
  keypoint o = a[n];
  if (!(f <= n && n < *g && o.s1 >= 0.0f))
    return;

  int p, q, r;

  __local volatile float s[128];
  __local volatile float t[128 * 8];

  float u, v;
  float w = o.s1 / e, x = o.s0 / e, y = o.s3;
  int z = (int)(w + 0.5f), aa = (int)(x + 0.5f);
  float ab = sin((float)y), ac = cos((float)y);
  float ad = o.s2 / e * 3.0f;
  int ae = (int)((1.414f * ad * 2.5f) + 0.5f);

  int af = -64 + 32 * k, ag = -64 + 32 * l;
  int ah = af + 32, ai = ag + 32;

  s[m] = 0.0f;
  for (p = 0; p < 8; p++)
    t[m * 8 + p] = 0.0f;

  for (p = af; p < ah; p++) {
    for (r = ag / 8; r < ai / 8; r++) {
      q = r * 8 + j;

      u = ((ac * p - ab * q) - (w - z)) / ad + 1.5f;
      v = ((ab * p + ac * q) - (x - aa)) / ad + 1.5f;
      if ((u > -1.0f && u < 4.0f && v > -1.0f && v < 4.0f && (z + p) >= 0 && (z + p) < i && (aa + q) >= 0 && (aa + q) < h)) {
        float aj = c[aa + q + (z + p) * h] * exp(-0.125f * ((u - 1.5f) * (u - 1.5f) + (v - 1.5f) * (v - 1.5f)));
        float ak = d[aa + q + (z + p) * h] - y;

        while (ak > 2.0f * 0x1.921fb6p+1f)
          ak -= 2.0f * 0x1.921fb6p+1f;
        while (ak < 0.0f)
          ak += 2.0f * 0x1.921fb6p+1f;
        int al, am, an, ao;
        float ap, aq;
        float ar = 4.0f * ak * 0x1.45f306p-2f;

        int as = (int)((u >= 0.0f) ? u : u - 1.0f), at = (int)((v >= 0.0f) ? v : v - 1.0f), au = (int)((ar >= 0.0f) ? ar : ar - 1.0f);

        float av = u - as, aw = v - at, ax = ar - au;
        if ((as >= -1 && as < 4 && au >= 0 && au <= 8 && av >= 0.0f && av <= 1.0f)) {
          for (int ay = 0; ay < 2; ay++) {
            am = as + ay;
            if ((am >= 0 && am < 4)) {
              ap = aj * ((ay == 0) ? 1.0f - av : av);

              for (int az = 0; az < 2; az++) {
                an = at + az;
                if ((an >= 0 && an < 4)) {
                  aq = ap * ((az == 0) ? 1.0f - aw : aw);
                  for (al = 0; al < 2; al++) {
                    ao = au + al;
                    if (ao >= 8) {
                      ao = 0;
                    }
                    int ba = (am * 4 + an) * 8 + ao;
                    t[j + 8 * ba] += aq * ((al == 0) ? 1.0f - ax : ax);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  barrier(1);
  s[m] += t[m * 8] + t[m * 8 + 1] + t[m * 8 + 2] + t[m * 8 + 3] + t[m * 8 + 4] + t[m * 8 + 5] + t[m * 8 + 6] + t[m * 8 + 7];

  barrier(1);

  t[m] = s[m] * s[m];

  if (m < 64) {
    t[m] += t[m + 64];
  }
  barrier(1);
  if (m < 32) {
    t[m] += t[m + 32];
  }
  barrier(1);
  if (m < 16) {
    t[m] += t[m + 16];
  }
  barrier(1);
  if (m < 8) {
    t[m] += t[m + 8];
  }
  barrier(1);
  if (m < 4) {
    t[m] += t[m + 4];
  }
  barrier(1);
  if (m < 2) {
    t[m] += t[m + 2];
  }
  barrier(1);
  if (m == 0)
    t[0] = (1.f / sqrt(t[1] + t[0]));
  barrier(1);

  s[m] *= t[0];

  __local int bb[1];
  if (m == 0)
    bb[0] = 0;
  if (s[m] > 0.2f) {
    s[m] = 0.2f;
    atomic_add(bb, 1);
  }
  barrier(1);

  if (bb[0]) {
    t[m] = s[m] * s[m];
    if (m < 64) {
      t[m] += t[m + 64];
    }
    barrier(1);
    if (m < 32) {
      t[m] += t[m + 32];
    }
    barrier(1);
    if (m < 16) {
      t[m] += t[m + 16];
    }
    barrier(1);
    if (m < 8) {
      t[m] += t[m + 8];
    }
    barrier(1);
    if (m < 4) {
      t[m] += t[m + 4];
    }
    barrier(1);
    if (m < 2) {
      t[m] += t[m + 2];
    }
    barrier(1);
    if (m == 0)
      t[0] = (1.f / sqrt(t[0] + t[1]));
    barrier(1);
    s[m] *= t[0];
  }

  barrier(1);

  b[128 * n + m] = (unsigned char)((255) < ((unsigned char)(512.0f * s[m])) ? (255) : ((unsigned char)(512.0f * s[m])));
}