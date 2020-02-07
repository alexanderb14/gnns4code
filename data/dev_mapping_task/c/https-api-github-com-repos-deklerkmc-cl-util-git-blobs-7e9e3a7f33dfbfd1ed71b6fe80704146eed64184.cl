__kernel void A(__global uint* a, __global uint* b, int c, int d) {
  int e = c * d;
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = g * c + f;

  if (h > e - 1)
    return;

  a[h] = h;
  b[h] = h;
}

__kernel void B(__global uint* a, __global uint* b, __global uint* c, __global uint* d, int e, int f, int g) {
  int h = f * g;
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = j * f + i;

  if (k > h - 1)
    return;

  uint l = a[k];
  uint m = b[k];

  uint n = k;

  int o = max(0, i - e);
  int p = max(0, j - e);
  int q = min(f, i + e);
  int r = min(g, j + e);

  for (int s = o; s < q; s++) {
    for (int t = p; t < r; t++) {
      int u = t * f + s;
      if (l == a[u])
        n = min(n, b[u]);
    }
  }

  if (n < m) {
    c[m] = n;
    *d = 0;
  }
}

__kernel void C(__global uint* a, __global uint* b, int c, int d) {
  uint e = c * d;
  uint f = get_global_id(0);
  uint g = get_global_id(1);
  uint h = g * c + f;

  if (h > e - 1)
    return;

  uint i = a[h];

  if (i != h)
    return;

  uint j = i;
  i = b[j];

  int k = 0;
  while (i != j && k < 128) {
    j = i;
    i = b[j];

    k++;
  }

  b[h] = i;
}

__kernel void D(__global uint* a, __global uint* b, int c, int d) {
  int e = c * d;
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = g * c + f;

  if (h > e - 1)
    return;

  uint i = a[h];
  uint j = b[i];
  a[h] = b[j];
}

__kernel void E(__global uint* a, __global uint* b, int c, int d) {
  uint e = c * d;
  uint f = get_global_id(0);
  uint g = get_global_id(1);
  uint h = g * c + f;

  if (h > e - 1)
    return;

  if (a[h] == h)
    b[h] = 1;
  else
    b[h] = 0;
}

__kernel void F(__global uint* a, __global uint* b, int c, int d, int e) {
  uint f = d * e;
  uint g = get_global_id(0);
  uint h = get_global_id(1);
  uint i = h * d + g;

  if (i > f - 1)
    return;

  uint j = a[i];

  int k = 0;
  for (int l = 0; l < c; l++) {
    if (j == b[l])
      k = l;
  }

  a[i] = k;
}