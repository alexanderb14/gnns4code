typedef float4 keypoint; __kernel void A(__global keypoint* a, __global unsigned char* b, __global float* c, __global float* d, int e, int f, __global int* g, int h, int i) {
  int j = get_local_id(0);
  int k = get_local_id(1);
  int l = get_local_id(2);
  int m = (j * 8 + k) * 8 + l;
  int n = get_group_id(0);
  keypoint o = a[n];
  if (!(f <= n && n < *g && o.s1 >= 0.0f))
    return;

  int p, q, r;

  __local volatile float s[128];
  __local volatile float t[128];
  __local volatile unsigned int u[128 * 8];

  float v, w;
  float x = 1.0f / e;
  float y = o.s1 * x, z = o.s0 * x;
  int aa = (int)((o.s1 * x) + 0.5f), ab = (int)((o.s0 * x) + 0.5f);
  float ac = sin((float)o.s3), ad = cos((float)o.s3);
  float ae = o.s2 * x * 3.0f;
  int af = (int)((1.414f * (o.s2 * x * 3.0f) * 2.5f) + 0.5f);

  int ag = -64 + 16 * k, ah = -64 + 16 * l;
  int ai = ag + 16, aj = ah + 16;

  for (p = 0; p < 2; p++) {
    u[p * 512 + m] = 0;
  }
  if (m < 128) {
    s[m] = 0.0f;
    t[m] = 0.0f;
  }
  for (p = ag; p < ai; p++) {
    for (r = ah / 8; r < aj / 8; r++) {
      q = r * 8 + j;
      v = ((ad * p - ac * q) - (y - aa)) / ae + 1.5f;
      w = ((ac * p + ad * q) - (z - ab)) / ae + 1.5f;

      if ((v > -1.0f && v < 4.0f && w > -1.0f && w < 4.0f && (aa + p) >= 0 && (aa + p) < i && (ab + q) >= 0 && (ab + q) < h)) {
        float ak = c[ab + q + (aa + p) * h] * exp(-0.125f * ((v - 1.5f) * (v - 1.5f) + (w - 1.5f) * (w - 1.5f)));
        float al = d[ab + q + (aa + p) * h] - o.s3;
        while (al > 2.0f * 0x1.921fb6p+1f)
          al -= 2.0f * 0x1.921fb6p+1f;
        while (al < 0.0f)
          al += 2.0f * 0x1.921fb6p+1f;
        int am, an, ao, ap;
        float aq, ar;
        float as = 4.0f * al * 0x1.45f306p-2f;

        int at = (int)((v >= 0.0f) ? v : v - 1.0f), au = (int)((w >= 0.0f) ? w : w - 1.0f), av = (int)((as >= 0.0f) ? as : as - 1.0f);

        float aw = v - at, ax = w - au, ay = as - av;
        if ((at >= -1 && at < 4 && av >= 0 && av <= 8 && aw >= 0.0f && aw <= 1.0f)) {
          for (int az = 0; az < 2; az++) {
            an = at + az;
            if ((an >= 0 && an < 4)) {
              aq = ak * ((az == 0) ? 1.0f - aw : aw);

              for (int ba = 0; ba < 2; ba++) {
                ao = au + ba;
                if ((ao >= 0 && ao < 4)) {
                  ar = aq * ((ba == 0) ? 1.0f - ax : ax);
                  for (am = 0; am < 2; am++) {
                    ap = av + am;
                    if (ap >= 8) {
                      ap = 0;
                    }
                    int bb = (an * 4 + ao) * 8 + ap;

                    atomic_add(u + bb * 8 + j, (unsigned int)(100000 * (ar * ((am == 0) ? 1.0f - ay : ay))));
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
  if (m < 128)
    s[m] += (float)((u[m * 8] + u[m * 8 + 1] + u[m * 8 + 2] + u[m * 8 + 3] + u[m * 8 + 4] + u[m * 8 + 5] + u[m * 8 + 6] + u[m * 8 + 7]) * 0.00001f);

  barrier(1);

  if (m < 128)
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

  if (m < 128) {
    s[m] *= t[0];

    __local int bc[1];
    if (m == 0)
      bc[0] = 0;
    if (s[m] > 0.2f) {
      s[m] = 0.2f;
      atomic_add(bc, 1);
    }
    barrier(1);

    if (bc[0]) {
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
}