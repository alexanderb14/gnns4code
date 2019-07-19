__kernel void A(int a, __global float* b, __global float* c, __constant float* d, __constant float* e, __constant int* f, __constant int* g, __global float* h) {
  int i, j, k, l, m, n;

  i = get_group_id(0) + 20 + 2;
  j = get_local_id(0) + 20 + 2;

  float o = 0.f;

  for (k = 0; k < 7; k++) {
    float p = 0.f, q = 0.f, r = 0.f;

    for (l = 0; l < 150; l++) {
      n = j + g[(k * 150) + l];
      m = i + f[(k * 150) + l];

      int s = m * a + n;
      float t = b[s] * e[l] + c[s] * d[l];

      p += t;

      float u = t - r;
      r = r + (u / (float)(l + 1));
      q = q + (u * (t - r));
    }

    r = p / ((float)150);

    float v = q / ((float)(150 - 1));

    if (((r * r) / v) > o)
      o = (r * r) / v;
  }

  h[(i * a) + j] = o;
}
__kernel void B(int a, int b, int c, int d, __constant float* e, __global float* f, __global float* g) {
  int h = c / 2;
  int i = d / 2;

  int j = get_global_id(0);
  int k = j % a;
  int l = j / a;

  float m = 0.0f;

  int n, o, p, q;
  for (n = 0; n < c; n++) {
    q = k - h + n;

    if ((q >= 0) && (q < a)) {
      for (o = 0; o < d; o++) {
        p = l - i + o;

        if ((p >= 0) && (p < b) && (e[(n * d) + o] != 0)) {
          int r = (p * a) + q;
          float s = f[r];

          if (s > m)
            m = s;
        }
      }
    }
  }

  g[(k * b) + l] = m;
}