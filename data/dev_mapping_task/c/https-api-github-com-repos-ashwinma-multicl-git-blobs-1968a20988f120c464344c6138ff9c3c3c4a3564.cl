typedef bool logical; __kernel __attribute__((reqd_work_group_size(64, 1, 1))) void A(__global int* a, __global int* b, int c, int d) {
  int e = (int)(get_global_id(0) / 64);
  int f = get_local_id(0);

  int g = b[e];
  int h = b[e + 1];
  for (int i = g + f; i < h; i += 64) {
    a[i] = a[i] - c;
  }
}

__kernel void B(__global double* a) {
  int b = get_global_id(0);
  if (b >= (14000 + 1))
    return;

  a[b] = 1.0;
}

__kernel void C(__global double* a, __global double* b, __global double* c, __global double* d, int e) {
  int f = get_global_id(0);
  if (f >= e)
    return;

  a[f] = 0.0;
  b[f] = 0.0;
  c[f] = 0;
  d[f] = 0;
}

__kernel void D(__global double* a, __global double* b, __global double* c, __global double* d, __local double* e, __local double* f, int g) {
  int h = get_global_id(0);
  int i = get_local_id(0);

  if (h < g) {
    double j = b[h];
    e[i] = a[h] * j;
    f[i] = j * j;
  } else {
    e[i] = 0.0;
    f[i] = 0.0;
  }

  barrier(1);

  for (int k = get_local_size(0) / 2; k > 0; k >>= 1) {
    if (i < k) {
      e[i] += e[i + k];
      f[i] += f[i + k];
    }
    barrier(1);
  }

  if (i == 0) {
    int l = get_group_id(0);
    c[l] = e[0];
    d[l] = f[0];
  }
}

__kernel void E(__global double* a, __global double* b, double c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;

  a[e] = c * b[e];
}
__kernel void F(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e) {
  int f = get_global_id(0);
  if (f >= (14000 + 1))
    return;

  a[f] = 0.0;
  b[f] = 0.0;
  double g = d[f];
  c[f] = g;
  e[f] = g;
}

__kernel void G(__global double* a, __global double* b, int c, __local double* d) {
  int e = get_global_id(0);
  int f = get_local_id(0);

  if (e < c) {
    double g = a[e];
    d[f] = g * g;
  } else {
    d[f] = 0.0;
  }

  barrier(1);

  for (int h = get_local_size(0) / 2; h > 0; h >>= 1) {
    if (f < h)
      d[f] += d[f + h];
    barrier(1);
  }
  if (f == 0)
    b[get_group_id(0)] = d[0];
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void H(__global int* a, __global double* b, __global double* c, __global int* d, __global double* e, int f) {
  __local double g[64];

  int h = (int)(get_global_id(0) / 64);
  int i = get_local_id(0);

  double j = 0.0;
  int k = a[h];
  int l = a[h + 1];
  for (int m = k + i; m < l; m += 64) {
    j = j + b[m] * c[d[m]];
  }
  g[i] = j;
  barrier(1);

  for (int n = 64 / 2; n > 0; n >>= 1) {
    if (i < n)
      g[i] += g[i + n];
    barrier(1);
  }
  if (i == 0)
    e[h] = g[0];
}

__kernel void I(__global double* a, __global double* b, __global double* c, int d, __local double* e) {
  int f = get_global_id(0);
  int g = get_local_id(0);

  if (f < d) {
    e[g] = a[f] * b[f];
  } else {
    e[g] = 0.0;
  }

  barrier(1);

  for (int h = get_local_size(0) / 2; h > 0; h >>= 1) {
    if (g < h)
      e[g] += e[g + h];
    barrier(1);
  }
  if (g == 0)
    c[get_group_id(0)] = e[0];
}

__kernel void J(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, double f, int g, __local double* h) {
  int i = get_global_id(0);
  int j = get_local_id(0);

  if (i < g) {
    double k;
    d[i] = d[i] + f * a[i];
    k = c[i] - f * b[i];
    c[i] = k;

    h[j] = k * k;
  } else {
    h[j] = 0.0;
  }

  barrier(1);

  for (int l = get_local_size(0) / 2; l > 0; l >>= 1) {
    if (j < l)
      h[j] += h[j + l];
    barrier(1);
  }
  if (j == 0)
    e[get_group_id(0)] = h[0];
}

__kernel void K(__global double* a, __global double* b, const double c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;

  a[e] = b[e] + c * a[e];
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void L(__global int* a, __global double* b, __global double* c, __global int* d, __global double* e, int f) {
  __local double g[64];

  int h = (int)(get_global_id(0) / 64);
  int i = get_local_id(0);

  double j = 0.0;
  int k = a[h];
  int l = a[h + 1];
  for (int m = k + i; m < l; m += 64) {
    j = j + b[m] * c[d[m]];
  }
  g[i] = j;
  barrier(1);

  for (int n = 64 / 2; n > 0; n >>= 1) {
    if (i < n)
      g[i] += g[i + n];
    barrier(1);
  }
  if (i == 0)
    e[h] = g[0];
}

__kernel void M(__global double* a, __global double* b, __global double* c, int d, __local double* e) {
  int f = get_global_id(0);
  int g = get_local_id(0);

  if (f < d) {
    double h = a[f] - b[f];
    e[g] = h * h;
  } else {
    e[g] = 0.0;
  }

  barrier(1);

  for (int i = get_local_size(0) / 2; i > 0; i >>= 1) {
    if (g < i)
      e[g] += e[g + i];
    barrier(1);
  }
  if (g == 0)
    c[get_group_id(0)] = e[0];
}