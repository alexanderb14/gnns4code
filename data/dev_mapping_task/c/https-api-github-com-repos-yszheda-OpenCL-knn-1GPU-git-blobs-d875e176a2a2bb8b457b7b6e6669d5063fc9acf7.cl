__kernel void A(int a, int b, __global int* c, __global int* d) {
  __local int e[32][128];
  __local int f[128][32];
  __local int g[32][32];

  int h = get_group_id(0);
  int i = get_group_id(1);

  int j = get_local_id(0);
  int k = get_local_id(1);

  int l;
  int m;
  int n;
  int o;

  for (o = k; o < 32; o += get_local_size(1)) {
    for (n = j; n < 32; n += get_local_size(0)) {
      l = i * 32 + o;
      m = h * 32 + n;
      g[o][n] = 0;
      barrier(1);

      for (int p = 0; p < (int)(__clc_ceil((float)b / 128)); p++) {
        for (int q = j; q < 128; q += get_local_size(0)) {
          e[o][q] = c[l * b + p * 128 + q];
        }
        for (int q = k; q < 128; q += get_local_size(1)) {
          f[q][n] = c[m * b + p * 128 + q];
        }
        barrier(1);

        for (int q = 0; q < 128; q++) {
          g[o][n] += (e[o][q] - f[q][n]) * (e[o][q] - f[q][n]);
        }
        barrier(1);
      }
      d[l * a + m] = g[o][n];
    }
  }
}

__kernel void B(int a, int b, int c, __global int* d, __global int* e, __global int* f, __local int* g) {
  int h = get_group_id(0);

  int i = get_local_id(0);

  int j = get_local_size(0) / 2;
  int k = 10000000;
  int l = 10000000;

  int m = (a < 1024) ? a : 1024;

  for (int n = 0; n < a; n += 1024) {
    for (int o = i; o < m; o += get_local_size(0)) {
      if (o + n == h) {
        g[o] = 10000000;
      } else {
        g[o] = e[h * a + n + o];
      }

      g[m + o] = o + n;
      barrier(1);
    }
    for (int o = 0; o < c; o++) {
      if (f[h * b + o] - n >= 0 && f[h * b + o] - n < m) {
        g[f[h * b + o] - n] = 10000000;
      }
      barrier(1);
    }
    barrier(1);
    for (j = m / 2; j > 0; j >>= 1)

    {
      for (int o = i; o < m; o += get_local_size(0)) {
        if (o < j) {
          if (g[o] == g[o + j]) {
            if (g[m + o] > g[m + o + j]) {
              g[m + o] = g[m + o + j];
            }
          } else if (g[o] > g[o + j]) {
            g[o] = g[o + j];
            g[m + o] = g[m + o + j];
          }
        }
        barrier(1);
      }
    }
    barrier(1);
    if (k == g[0]) {
      if (l > g[m]) {
        l = g[m];
      }
    } else if (k > g[0]) {
      k = g[0];
      l = g[m];
    }
    barrier(1);
  }
  (*d) = l;
}

__kernel void C(int a, int b, __global int* c, __global int* d, __global int* e, __local int* f) {
  int g;
  int h;

  g = get_group_id(0);

  barrier(1);
  for (h = 0; h < b; h++) {
    B(a, b, h, (e + g * b + h), d, e, f);

    barrier(1);
  }
}