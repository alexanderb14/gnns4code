typedef float4 keypoint; __kernel void A(__global keypoint* a, __global unsigned char* b, __global float* c, __global float* d, int e, int f, __global int* g, int h, int i) {
  int j = get_global_id(0);
  keypoint k = a[j];
  if (!(f <= j && j < *g && k.s1 >= 0.0f))
    return;

  int l, m, n, o, p;

  __local volatile float q[128];
  for (l = 0; l < 128; l++)
    q[l] = 0.0f;

  float r, s;
  float t = k.s1 / e, u = k.s0 / e, v = k.s3;
  int w = (int)(t + 0.5f), x = (int)(u + 0.5f);
  float y = sin((float)v), z = cos((float)v);
  float aa = k.s2 / e * 3.0f;
  int ab = (int)((1.414f * aa * 2.5f) + 0.5f);

  for (l = -ab; l <= ab; l++) {
    for (m = -ab; m <= ab; m++) {
      r = ((z * l - y * m) - (t - w)) / aa + 1.5f;
      s = ((y * l + z * m) - (u - x)) / aa + 1.5f;
      if ((r > -1.0f && r < 4.0f && s > -1.0f && s < 4.0f && (w + l) >= 0 && (w + l) < i && (x + m) >= 0 && (x + m) < h)) {
        float ac = c[(int)(x + m) + (int)(w + l) * h] * exp(-0.125f * ((r - 1.5f) * (r - 1.5f) + (s - 1.5f) * (s - 1.5f)));
        float ad = d[(int)(x + m) + (int)(w + l) * h] - v;
        while (ad > 2.0f * 0x1.921fb6p+1f)
          ad -= 2.0f * 0x1.921fb6p+1f;
        while (ad < 0.0f)
          ad += 2.0f * 0x1.921fb6p+1f;
        int ae, af, ag, ah;
        float ai, aj;

        float ak = 4.0f * ad * 0x1.45f306p-2f;

        int al = (int)((r >= 0.0f) ? r : r - 1.0f), am = (int)((s >= 0.0f) ? s : s - 1.0f), an = (int)((ak >= 0.0f) ? ak : ak - 1.0f);

        float ao = r - al, ap = s - am, aq = ak - an;
        if ((al >= -1 && al < 4 && an >= 0 && an <= 8 && ao >= 0.0f && ao <= 1.0f)) {
          for (int ar = 0; ar < 2; ar++) {
            af = al + ar;
            if ((af >= 0 && af < 4)) {
              float ai = (float)(ac * (float)((ar == 0) ? 1.0f - ao : ao));

              for (int as = 0; as < 2; as++) {
                ag = am + as;
                if ((ag >= 0 && ag < 4)) {
                  aj = ai * ((as == 0) ? 1.0f - ap : ap);
                  for (ae = 0; ae < 2; ae++) {
                    ah = an + ae;
                    if (ah >= 8) {
                      ah = 0;
                    }
                    q[(af * 4 + ag) * 8 + ah] += aj * ((ae == 0) ? 1.0f - aq : aq);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  float at = 0;
  for (l = 0; l < 128; l++)
    at += q[l] * q[l];
  at = (1.f / sqrt(at));
  for (l = 0; l < 128; l++) {
    q[l] *= at;
  }

  bool au = false;
  at = 0;
  for (l = 0; l < 128; l++) {
    if (q[l] > 0.2f) {
      q[l] = 0.2f;
      au = true;
    }
    at += q[l] * q[l];
  }

  if (au == true) {
    at = (1.f / sqrt(at));
    for (l = 0; l < 128; l++)
      q[l] *= at;
  }

  int av;
  for (l = 0; l < 128; l++) {
    av = (int)(512.0 * q[l]);
    b[128 * j + l] = (unsigned char)((255) < (av) ? (255) : (av));
  }
}