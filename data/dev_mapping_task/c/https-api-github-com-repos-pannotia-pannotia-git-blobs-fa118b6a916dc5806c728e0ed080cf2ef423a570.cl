inline float A(__global float* const a, const float b) {
  uint c, d, e;

  *(float*)&c = *a;
  *(float*)&d = (*(float*)&c + b);
  while ((e = atomic_cmpxchg((__global uint*)a, c, d)) != c) {
    c = e;
    *(float*)&d = (*(float*)&c + b);
  }
  return *(float*)&c;
}
__kernel void B(__global int* a, __global int* b, __global int* c, __global float* d, __global int* e, __global int* f, const int g, const int h, const int i) {
  int j = get_global_id(0);

  if (j < g && c[j] == i) {
    int k = a[j];
    int l;
    if (j + 1 < g)
      l = a[j + 1];
    else
      l = h;

    for (int m = k; m < l; m++) {
      int n = b[m];
      if (c[n] < 0) {
        *f = 1;

        c[n] = i + 1;
      }

      if (c[n] == (i + 1)) {
        A(&d[n], d[j]);
      }
    }
  }
}
__kernel void C(__global int* a, __global int* b, __global int* c, __global float* d, __global float* e, __global int* f, const int g, const int h, const int i, const int j, __global float* k) {
  int l = get_global_id(0);

  if (l < g && c[l] == i - 1) {
    int m = a[l];
    int n;
    if (l + 1 < g)
      n = a[l + 1];
    else
      n = h;

    for (int o = m; o < n; o++) {
      int p = b[o];

      if (c[p] == i - 2)
        A(&e[p], d[p] / d[l] * (1 + e[l]));
    }

    if (l != j)
      k[l] = k[l] + e[l];
  }
}
__kernel void D(const int a, const int b, __global int* c, __global float* d, __global float* e, const int f) {
  int g = get_global_id(0);

  if (g < f) {
    if (a != g && c[g] == b - 1) {
      e[g] = e[g] + d[g];
    }
  }
}
__kernel void E(const int a, __global int* b, __global float* c, __global float* d, const int e) {
  int f = get_global_id(0);

  if (f < e) {
    c[f] = 0;

    if (f == a) {
      d[f] = 1;
      b[f] = 0;

    } else {
      d[f] = 0;
      b[f] = -1;
    }
  }
}

__kernel void F(__global int* a, const int b) {
  int c = get_global_id(0);

  if (c < b * b)
    a[c] = 0;
}

__kernel void G(__global float* a, const int b) {
  int c = get_global_id(0);

  if (c < b)
    a[c] = 0;
}