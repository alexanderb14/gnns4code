__kernel void A(const int a, const int b, const __global float* c, const int d, const int e, __global float* f) {
  const int g = get_group_id(0) * 16 + get_local_id(0);
  const int h = get_group_id(1) * 16 + get_local_id(1);

  if (g < d && h < e) {
    float i;
    if (g < a && h < b) {
      i = c[g * b + h];
    } else {
      i = 0.0f;
    }

    f[g * e + h] = i;
  }
}

__kernel void B(const int a, const int b, const __global float* c, const int d, const int e, __global float* f) {
  const int g = get_group_id(0) * 16 + get_local_id(0);
  const int h = get_group_id(1) * 16 + get_local_id(1);

  if (g < d && h < e) {
    f[g * e + h] = c[g * b + h];
  }
}

__kernel void C(const int a, const int b, const __global float* c, __global float* d) {
  const int e = get_local_id(0);
  const int f = get_local_id(1);
  const int g = get_group_id(0) * 16 + e;
  const int h = get_group_id(1) * 16 + f;

  __local float i[16][16];

  if (g < a && h < b) {
    i[e][f] = c[g * b + h];
  }

  barrier(1);

  const int j = get_group_id(1) * 16 + e;
  const int k = get_group_id(0) * 16 + f;

  if (j < b && k < a) {
    d[j * a + k] = i[f][e];
  }
}

__kernel void D(const int a, const int b, const int c, const __global float* d, const __global float* e, __global float* f) {
  const int g = get_local_id(0);
  const int h = get_local_id(1);
  const int i = get_group_id(0) * 128;
  const int j = get_group_id(1) * 128;

  __local float k[128][16];
  __local float l[128][16 + 2];

  float m;
  float n[8];
  float o[8][8];

  for (int p = 0; p < 8; p++) {
    for (int q = 0; q < 8; q++) {
      o[p][q] = 0.0f;
    }
  }

  const int r = c / 16;
  for (int s = 0; s < r; s++) {
    for (int p = 0; p < 8; p++) {
      int t = g + (128 / 8) * p;

      for (int u = 0; u < 16; u++) {
        k[t][u] = d[(i + t) * c + 16 * s + u];
        l[t][u] = e[(j + t) * c + 16 * s + u];
      }
    }

    barrier(1);

    for (int v = 0; v < 16; v++) {
      for (int q = 0; q < 8; q++) {
        int w = h + q * (128 / 8);
        n[q] = l[w][v];
      }

      for (int p = 0; p < 8; p++) {
        int x = g + p * (128 / 8);
        m = k[x][v];
        for (int q = 0; q < 8; q++) {
          o[p][q] += m * n[q];
        }
      }
    }

    barrier(1);
  }

  for (int p = 0; p < 8; p++) {
    int y = i + g + p * (128 / 8);
    for (int q = 0; q < 8; q++) {
      int z = j + h + q * (128 / 8);
      f[y * b + z] = o[p][q];
    }
  }
}

__kernel void E(const int a, const int b, const int c, const __global float* d, const __global float* e, __global float* f) {
  const int g = get_local_id(0);
  const int h = get_local_id(1);
  const int i = get_global_id(0);
  const int j = get_global_id(1);

  __local float k[16][16];
  __local float l[16][16];

  float m[16];
  float n;
  float o[16][16];

  for (int p = 0; p < 16; p++) {
    for (int q = 0; q < 16; q++) {
      o[p][q] = 0.0f;
    }
  }

  const int r = c / 16;
  for (int s = 0; s < r; s++) {
    for (int p = 0; p < 16; p++) {
      for (int q = 0; q < 16; q++) {
        k[p][q] = d[(i + g + p) * c + s * 16 + q];
        l[p][q] = e[(j + h + p) * c + s * 16 + q];
      }
    }

    barrier(1);
    for (int t = 0; t < 16; t++) {
      for (int q = 0; q < 16; q++) {
        m[q] = k[t][q];
      }

      for (int u = 0; u < 16; u++) {
        for (int q = 0; q < 16; q++) {
          n = l[u][q];
          o[t][u] += n * m[q];
        }
      }
    }
    barrier(1);
  }

  for (int p = 0; p < 16; p++) {
    for (int q = 0; q < 16; q++) {
      f[(i + g + p) * b + j + h + q] = o[p][q];
    }
  }
}
__kernel void F(__global float* a, __global float* b, __global float* c, int d, int e) {
  int f = get_group_id(0);
  int g = get_group_id(1);

  int h = get_local_id(0);
  int i = get_local_id(1);

  int j = d * 16 * g;

  int k = j + d - 1;

  int l = 16;

  int m = 16 * f;

  int n = 16 * e;

  float o = 0.0f;
  for (int p = j, q = m; p <= k; p += l, q += n) {
    __local float r[16][16];

    __local float s[16][16];

    r[i][h] = b[p + d * i + h];
    s[i][h] = c[q + e * i + h];

    barrier(1);

    for (int t = 0; t < 16; ++t) {
      o += r[i][t] * s[t][h];
    }

    barrier(1);
  }

  int u = e * 16 * g + 16 * f;
  a[u + e * i + h] = o;
}

__kernel void G() {
}