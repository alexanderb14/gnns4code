__kernel void A(int a, int b, int c, __global int* d, __global int* e, __global float* f) {
  int g = get_global_id(0);

  if (g < a) {
    int h = 0;

    int i = g * b;
    for (int j = 0; j < b - 1; j++) {
      int k = d[i + j] - d[i + j + 1];
      int l = e[i + j] - e[i + j + 1];
      h += k * k + l * l;
    }

    f[g] = (float)c / (float)h;
  }
}

__kernel void B(int a, __global float* b, __global float* c, __global float* d) {
  int e = get_global_id(0);

  if (e < a) {
    float f = 0.0f;

    for (int g = 0; g <= e; g++)
      f += b[g];
    c[e] = f;

    if (e == (a - 1))
      *d = f;
  }
}

__kernel void C(int a, __global float* b, float c) {
  int d = get_global_id(0);
  if (d < a) {
    b[d] /= c;
  }
}

__kernel void D(int a, __global float* b, __local float* c, __local int* d, __global float* e, __global int* f) {
  int g = get_global_id(0);
  int h;
  float i = -__builtin_inff();

  while (g < a) {
    float j = b[g];
    if (j > i) {
      i = j;
      h = g;
    }
    g += get_global_size(0);
  }

  int k = get_local_id(0);
  c[k] = i;
  d[k] = h;
  barrier(1);

  for (int l = get_local_size(0) / 2; l > 0; l /= 2) {
    if (k < l) {
      float m = c[k + l];
      float n = c[k];
      if (m > n) {
        c[k] = m;
        d[k] = d[k + l];
      }
    }
    barrier(1);
  }
  if (k == 0) {
    int o = get_group_id(0);
    e[o] = c[0];
    f[o] = d[0];
  }
}

__kernel void E(int a, __global float* b, __global int* c) {
  int d = get_global_id(0);
  if (d == 0) {
    float e = b[0];
    int f = c[0];

    for (int g = 1; g < a; g++) {
      float h = b[g];
      if (h > e) {
        e = h;
        f = c[g];
      }
    }
    c[0] = f;
  }
}

__kernel void F(int a, __global float* b, __global float* c, __global int* d) {
  int e = get_global_id(0);

  if (e < (2 * a)) {
    for (int f = 0; f < a; f++) {
      if (c[e] < b[f]) {
        d[e] = f;
        break;
      }
    }
  }
}

__kernel void G(int a, int b, __global const int* c, __global const int* d, __global int* e, __global int* f, __global int* g, float h, __global float* i, __global int* j) {
  int k = get_global_id(0);

  if (k < a) {
    if (i[k] < h) {
      int l = j[k];

      int m = g[2 * k];
      int n = m * b;
      int o = k * b;

      for (int p = 0; p <= l; p++) {
        e[o + p] = c[n + p];
        f[o + p] = d[n + p];
      }

      int q = b - l - 1;
      int r = 0;
      int s = g[2 * k + 1];
      n = s * b;
      o = k * b;

      for (int p = 0; p < b; p++) {
        bool t = false;

        for (int u = 0; u <= l; u++) {
          if (e[o + u] == c[n + p] && f[o + u] == d[n + p]) {
            t = true;
            break;
          }
        }

        if (!t) {
          r++;
          e[o + l + r] = c[n + p];
          f[o + l + r] = d[n + p];
        }

        if (r == q)
          break;
      }
    }
  }
}

__kernel void H(int a, int b, __global const int* c, __global const int* d, __global int* e, __global int* f, float g, __global const float* h, __global const int* i) {
  int j = get_global_id(0);

  if (j < a) {
    if (h[j] >= g) {
      int k = i[2 * j];
      int l = k * b;
      int m = j * b;

      for (int n = 0; n < b; n++) {
        e[m + n] = c[l + n];
        f[m + n] = d[l + n];
      }
    }
  }
}

__kernel void I(int a, int b, __global int* c, __global int* d, float e, __global const float* f, __global const int* g) {
  int h = get_global_id(0);

  if (h < a) {
    if (f[h] < e) {
      int i = g[2 * h];
      int j = g[2 * h + 1];
      int k = h * b + i;
      int l = h * b + j;

      int m = c[k];
      c[k] = c[l];
      c[l] = m;

      m = d[k];
      d[k] = d[l];
      d[l] = m;
    }
  }
}