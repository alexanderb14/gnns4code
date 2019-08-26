__kernel void A(__global float* restrict a, __global float* restrict b, __global float* restrict c, const int d, const int e, const int f, const int g) {
  int h = get_global_id(0);

  float i[32 + 8 - 1];
  float j[32 + 8 - 1];

  float k[32];
  float l[32];

  int m, n;

  for (m = 0; m < 32 + 8 - 1; m++) {
    i[m] = 0.0f;
    j[m] = 0.0f;
  }

  uchar o = 1;
  ushort p = h * g;
  uchar q = 0;
  ushort r = 0;

  for (m = 0; m < e; m++) {
    int s = 2 * h * d + 2 * 8 * m;

    float t[8] = {0.0f};
    float u[8] = {0.0f};

    for (n = 0; n < 32 - 1; n++) {
      i[n] = i[n + 8];
      j[n] = j[n + 8];
    }

    for (n = 0; n < 8; n++) {
      int v = s + 2 * n;
      i[n + 32 - 1] = a[v];
      j[n + 32 - 1] = a[v + 1];
    }
    if (o) {
      for (n = 0; n < 32 - 32; n += 32) {
        for (int w = 0; w < 32; w++) {
          k[n + w] = k[n + w + 32];
          l[n + w] = l[n + w + 32];
        }
      }

      for (int w = 0; w < 32; w++) {
        k[32 - (32 - w)] = b[2 * p + 2 * w];
        l[32 - (32 - w)] = b[2 * p + 2 * w + 1];
      }

      p += 32;

      if (++q == (32 / 32)) {
        o = 0;
        q = 0;
      }
    }

    for (n = 32 - 1; n >= 0; n--) {
      for (int w = 0; w < 8; w++) {
        t[w] += i[n + w] * k[32 - 1 - n] - j[n + w] * l[32 - 1 - n];
        u[w] += i[n + w] * l[32 - 1 - n] + j[n + w] * k[32 - 1 - n];
      }
    }

    for (int w = 0; w < 8; w++) {
      int x = s + 2 * w;

      c[x] = t[w];
      c[x + 1] = u[w];
    }

    if (r == f) {
      o = 1;
    }
    if (r == f) {
      r = 0;
    } else
      r += 8;
  }
}