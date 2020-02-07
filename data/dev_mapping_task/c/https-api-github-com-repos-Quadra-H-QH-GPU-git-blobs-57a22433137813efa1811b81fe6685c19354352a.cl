int A(int a, int b) {
  int c;
  if (0) {
    int d, e;
    d = a / (b / 16 / 16);
    e = a % (b / 16 / 16);
    c = e * (16 * 16) + d;
  } else {
    c = a;
  }
  return c;
}

__kernel void B(const __global int* a, __global int* b, const int c, __local int* d, const int e) {
  int f = get_local_id(0);
  int g = get_global_id(0);

  int h = get_group_id(0);

  int i = get_num_groups(0);
  int j = get_local_size(0);

  for (int k = 0; k < (1 << 5); k++) {
    d[k * j + f] = 0;
  }

  barrier(1);

  int l = g * (e / i / j);
  int m = e / i / j;

  int n, o;

  for (int p = l; p < l + m; p++) {
    n = a[A(p, e)];

    o = ((n >> (c * 5)) & ((1 << 5) - 1));

    d[o * j + f]++;
  }
  barrier(1);

  for (int k = 0; k < (1 << 5); k++) {
    b[k * i * j + j * h + f] = d[k * j + f];
  }
  barrier(2);
}

__kernel void C(const __global int* a, __global int* b, const int c, const int d, const __global int* e, __global int* f, __local int* g, __local int* h, const int i) {
  int j = get_global_id(0) * i;
  int k = get_global_id(1);

  int l = 0;
  int m = get_local_id(1);

  for (l = 0; l < i; l++) {
    int n = (j + l) * c + k;
    g[l * i + m] = a[n];
    if (1) {
      h[l * i + m] = e[n];
    }
  }

  barrier(1);

  int o = get_group_id(1) * i;

  for (l = 0; l < i; l++) {
    int p = (o + l) * d + j + m;
    b[p] = g[m * i + l];
    if (1) {
      f[p] = h[m * i + l];
    }
  }
}

__kernel void D(const __global int* a, __global int* b, __global int* c, const int d, __global int* e, __global int* f, __local int* g, const int h) {
  int i = get_local_id(0);
  int j = get_global_id(0);

  int k = get_group_id(0);
  int l = get_num_groups(0);
  int m = get_local_size(0);

  int n = j * (h / l / m);
  int o = h / l / m;

  for (int p = 0; p < (1 << 5); p++) {
    g[p * m + i] = c[p * l * m + m * k + i];
  }
  barrier(1);

  int q, r, s, t;

  for (int u = n; u < n + o; u++) {
    s = a[A(u, h)];
    t = ((s >> (d * 5)) & ((1 << 5) - 1));

    q = g[t * m + i];
    b[A(q, h)] = s;

    if (1) {
      f[A(q, h)] = e[A(u, h)];
    }
    q++;
    g[t * m + i] = q;
  }
}

__kernel void E(__global int* a, __local int* b, __global int* c) {
  int d = get_local_id(0);
  int e = get_global_id(0);
  int f = 1;
  int g = get_local_size(0) * 2;
  int h = get_group_id(0);

  b[2 * d] = a[2 * e];
  b[2 * d + 1] = a[2 * e + 1];

  for (int i = g >> 1; i > 0; i >>= 1) {
    barrier(1);
    if (d < i) {
      int j = f * (2 * d + 1) - 1;
      int k = f * (2 * d + 2) - 1;
      b[k] += b[j];
    }
    f *= 2;
  }

  if (d == 0) {
    c[h] = b[g - 1];
    b[g - 1] = 0;
  }

  for (int i = 1; i < g; i *= 2) {
    f >>= 1;
    barrier(1);

    if (d < i) {
      int j = f * (2 * d + 1) - 1;
      int k = f * (2 * d + 2) - 1;

      int l = b[j];
      b[j] = b[k];
      b[k] += l;
    }
  }
  barrier(1);

  a[2 * e] = b[2 * d];
  a[2 * e + 1] = b[2 * d + 1];

  barrier(2);
}

__kernel void F(__global int* a, __global int* b) {
  int c = get_global_id(0);
  int d = get_group_id(0);

  int e;

  e = b[d];

  a[2 * c] += e;
  a[2 * c + 1] += e;

  barrier(2);
}