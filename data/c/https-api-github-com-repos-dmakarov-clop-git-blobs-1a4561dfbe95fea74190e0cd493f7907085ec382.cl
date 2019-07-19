int A(int a, int b, int c) {
  int d = a > b ? a : b;
  return d > c ? d : c;
}

__kernel void B(__global int* a, __global int* b, int c, int d, int e, int f, int g, int h, __local int* i, __local int* j) {
  int k = get_group_id(0);

  int l = get_local_id(0);

  int m = g * c + h;
  int n = k;
  int o = e - 1 - k;
  int p = m + c * 32 * o + 32 * n;
  int q = p + c;
  int r = p + l + 1;
  int s = r + c;
  if (l == 0)
    i[l * (32 + 1)] = b[p];
  barrier(1);
  for (int t = 0; t < 32; ++t)
    j[(t)*32 + (l)] = a[s + c * t];
  barrier(1);
  i[(l + 1) * (32 + 1)] = b[q + c * l];
  barrier(1);
  i[(l + 1)] = b[r];
  barrier(1);
  for (int u = 0; u < 32; ++u) {
    if (l <= u) {
      int v = l + 1;
      int w = u - l + 1;
      i[(v) + (w) * (32 + 1)] = A(i[(v - 1) + (w - 1) * (32 + 1)] + j[(w - 1) * 32 + (v - 1)], i[(v - 1) + (w) * (32 + 1)] - d, i[(v) + (w - 1) * (32 + 1)] - d);
    }
    barrier(1);
  }
  barrier(1);
  for (int u = 32 - 2; u >= 0; --u) {
    if (l <= u) {
      int v = l + 32 - u;
      int w = 32 - l;
      i[(v) + (w) * (32 + 1)] = A(i[(v - 1) + (w - 1) * (32 + 1)] + j[(w - 1) * 32 + (v - 1)], i[(v - 1) + (w) * (32 + 1)] - d, i[(v) + (w - 1) * (32 + 1)] - d);
    }
    barrier(1);
  }
  for (int t = 0; t < 32; ++t)
    b[s + t * c] = i[(l + 1) + (t + 1) * (32 + 1)];
}

__kernel void C(__global int* a, __global int* b, int c, int d, int e, int f, int g, int h, __local int* i, __local int* j) {
  int k = get_group_id(0);

  int l = get_local_id(0);

  int m = g * c + h;
  int n = k + f - e;
  int o = f - k - 1;
  int p = m + c * 32 * o + 32 * n;
  int q = p + c;
  int r = p + l + 1;
  int s = r + c;
  if (l == 0)
    i[l * (32 + 1)] = b[p];
  for (int t = 0; t < 32; ++t)
    j[(t)*32 + (l)] = a[s + c * t];
  barrier(1);
  i[(l + 1) * (32 + 1)] = b[q + c * l];
  barrier(1);
  i[(l + 1)] = b[r];
  barrier(1);
  for (int u = 0; u < 32; ++u) {
    if (l <= u) {
      int v = l + 1;
      int w = u - l + 1;
      int x = i[(v - 1) + (w - 1) * (32 + 1)] + j[(w - 1) * 32 + (v - 1)];
      int y = i[(v - 1) + (w) * (32 + 1)] - d;
      int z = i[(v) + (w - 1) * (32 + 1)] - d;
      i[(v) + (w) * (32 + 1)] = A(x, y, z);
    }
    barrier(1);
  }
  for (int u = 32 - 2; u >= 0; --u) {
    if (l <= u) {
      int v = l + 32 - u;
      int w = 32 - l;
      int x = i[(v - 1) + (w - 1) * (32 + 1)] + j[(w - 1) * 32 + (v - 1)];
      int y = i[(v - 1) + (w) * (32 + 1)] - d;
      int z = i[(v) + (w - 1) * (32 + 1)] - d;
      i[(v) + (w) * (32 + 1)] = A(x, y, z);
    }
    barrier(1);
  }
  for (int t = 0; t < 32; ++t)
    b[s + t * c] = i[(l + 1) + (t + 1) * (32 + 1)];
}

__kernel void D(__global const int* a, __global const int* b, __global const int* c, __global int* d, int e, int f, int g, int h) {
  __local int i[16 * 16];
  __local int j[(32 + 1) * (32 + 2)];
  int k = get_group_id(0);
  int l = get_local_id(0);
  int m = (g - k) * 32 + 1;
  int n = (h + 2 * k) * 32 + 1;

  int o = ((m + l) * e + (n - l));
  int p = ((m - 1) * e + (n + l));
  int q = o - 1;
  int r = 0;

  while (r + l < 16) {
    for (int s = 0; s < 16; ++s)
      i[s * 16 + r + l] = a[s * 16 + r + l];
    r += 32;
  }
  barrier(1);

  if (h == 1 && k == 0)
    for (int t = 0; t < 32; ++t) {
      int u = t - l + 1;
      if (u > 0)
        d[((m + l) * e + (u))] = A(d[((m + l - 1) * e + (u - 1))] + i[b[m + l] * 16 + c[u]], d[((m + l - 1) * e + (u))] - f, d[((m + l) * e + (u - 1))] - f);
      barrier(2);
    }

  int v = (l + 1) + (32 + 1);
  int w = (l + 1) * (32 + 1);
  j[l] = d[((m + l - 1) * e + (n - l - 1))];
  j[v] = d[q];
  j[w] = d[p];
  barrier(1);

  int x = b[m + l];
  int u = c[n - l];
  for (int y = 0; y < 32; ++y) {
    int z = c[n - l + y + 1];
    j[(y + 2) * (32 + 1) + l + 1] = A(j[y * (32 + 1) + l] + i[x * 16 + u], j[(y + 1) * (32 + 1) + l] - f, j[(y + 1) * (32 + 1) + l + 1] - f);
    u = z;
    barrier(1);
  }

  for (int y = 0; y < 32; ++y)
    d[((m + y) * e + (n - y + l))] = j[(l + 2) * (32 + 1) + y + 1];
  barrier(2);

  if (n + 32 == e)
    for (int t = 0; t < 32; ++t) {
      int u = n + 32 + t - l;
      if (u < e)
        d[((m + l) * e + (u))] = A(d[((m + l - 1) * e + (u - 1))] + i[b[m + l] * 16 + c[u]], d[((m + l - 1) * e + (u))] - f, d[((m + l) * e + (u - 1))] - f);
      barrier(2);
    }
}

__kernel void E(__global const int* a, __global int* b, int c, int d, int e) {
  int f = get_group_id(0);
  int g = get_local_id(0);
  int h = (c - 1) / 32;
  int i = 1;
  int j = e < 2 * h ? i - 1 + 32 * (1 - f + e / 2) : c - 1 - 32 * f;
  int k = e < 2 * h ? i - ((e + 1) & 1) * 32 + 2 * f * 32 : i + (e + 1 - 2 * (c - 1) / 32) * 32 + 2 * f * 32;
  int l = j - g;
  k = k + g;
  for (int m = 0; m < 32; ++m) {
    int n = k + m;
    if (0 < n && n < c)
      b[((l)*c + (n))] = A(b[((l - 1) * c + (n - 1))] + a[((l)*c + (n))], b[((l)*c + (n - 1))] - d, b[((l - 1) * c + (n))] - d);
    barrier(2);
  }
}