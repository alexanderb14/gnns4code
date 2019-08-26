__kernel void A(__global int* a, int2 b) {
  int c = get_global_id(0);
  int d = get_global_id(1);

  if (c > b.x - 1 || d > b.y - 1)
    return;

  a[d * b.x + c] = 0;
}

__kernel void B(__global int* a, int2 b, int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  if (d > b.x - 1 || e > b.y - 1)
    return;

  a[e * b.x + d] = c;
}

__kernel void C(__global int* a, __global int* b, int c, int d, int e) {
  int f = get_global_id(0);

  if (f > c - 1)
    return;

  int g = 0;

  switch (d) {
    case 0:
      if (a[f] == e)
        g = 1;
      break;
    case 1:
      if (a[f] > e)
        g = 1;
      break;
    case 2:
      if (a[f] < e)
        g = 1;
      break;
    case 3:
      if (a[f] >= e)
        g = 1;
      break;
    case 4:
      if (a[f] <= e)
        g = 1;
      break;
  }

  b[f] = g;
}

__kernel void D(__global int* a, __global int* b, __global int* c, int d, int e, int f, int g, int h, int i) {
  int j = get_global_id(0);

  if (j > d - 1)
    return;

  int k = 0;
  int l = 0;

  switch (e) {
    case 0:
      if (a[j] == g)
        k = 1;
      break;
    case 1:
      if (a[j] > g)
        k = 1;
      break;
    case 2:
      if (a[j] < g)
        k = 1;
      break;
    case 3:
      if (a[j] >= g)
        k = 1;
      break;
    case 4:
      if (a[j] <= g)
        k = 1;
      break;
  }

  switch (f) {
    case 0:
      if (b[j] == h)
        l = 1;
      break;
    case 1:
      if (b[j] > h)
        l = 1;
      break;
    case 2:
      if (b[j] < h)
        l = 1;
      break;
    case 3:
      if (b[j] >= h)
        l = 1;
      break;
    case 4:
      if (b[j] <= h)
        l = 1;
      break;
  }

  switch (i) {
    case 0:
      k = k && l;
      break;
    case 1:
      k = k || l;
      break;
  }

  c[j] = k;
}

__kernel void E(__global int* a, __global int* b, __global int* c, int d, int e, int f, int g, int h, int i, int j) {
  int k = get_global_id(0);

  if (k > d - 1)
    return;

  int l = 0;
  int m = 0;

  switch (e) {
    case 0:
      if (a[k] == g)
        l = 1;
      break;
    case 1:
      if (a[k] > g)
        l = 1;
      break;
    case 2:
      if (a[k] < g)
        l = 1;
      break;
    case 3:
      if (a[k] >= g)
        l = 1;
      break;
    case 4:
      if (a[k] <= g)
        l = 1;
      break;
  }

  switch (f) {
    case 0:
      if (b[k] == h)
        m = 1;
      break;
    case 1:
      if (b[k] > h)
        m = 1;
      break;
    case 2:
      if (b[k] < h)
        m = 1;
      break;
    case 3:
      if (b[k] >= h)
        m = 1;
      break;
    case 4:
      if (b[k] <= h)
        m = 1;
      break;
  }

  switch (i) {
    case 0:
      l = l && m;
      break;
    case 1:
      l = l || m;
      break;
  }

  if (l)
    c[k] = j;
}

__kernel void F(__global int* a, int2 b, int c, __global int* d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
 int2 g = (int2) (e f;

 int h = (f/16)*16 + e/16;

    int i;
    if (a[h] == c)
        i = 0xFF0000FF;
    else
        i = 0xFF000000;

    d[f*b[0] + e] = i;
}