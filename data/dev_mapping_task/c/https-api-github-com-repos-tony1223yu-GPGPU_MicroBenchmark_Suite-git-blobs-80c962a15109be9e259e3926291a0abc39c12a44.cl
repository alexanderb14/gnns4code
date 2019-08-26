__kernel void A(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e;
  int f;
  e = d[0];
  f = e;
  while (b-- > 1) {
    e = e + f;
    f = f + f;
  }
  d[0] = e;
}

__kernel void B(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f;
  int g;
  e = d[0];
  f = d[1];
  g = e;
  while (b-- > 1) {
    e = e + g;
    f = f + g;
    g = g + g;
  }
  d[0] = e;
  d[1] = f;
}

__kernel void C(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g;
  int h;
  e = d[0];
  f = d[1];
  g = d[2];
  h = e;
  while (b-- > 1) {
    e = e + h;
    f = f + h;
    g = g + h;
    h = h + h;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
}

__kernel void D(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h;
  int i;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = e;
  while (b-- > 1) {
    e = e + i;
    f = f + i;
    g = g + i;
    h = h + i;
    i = i + i;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
}

__kernel void E(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i;
  int j;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = e;
  while (b-- > 1) {
    e = e + j;
    f = f + j;
    g = g + j;
    h = h + j;
    i = i + j;
    j = j + j;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
}

__kernel void F(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j;
  int k;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = e;
  while (b-- > 1) {
    e = e + k;
    f = f + k;
    g = g + k;
    h = h + k;
    i = i + k;
    j = j + k;
    k = k + k;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
}

__kernel void G(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k;
  int l;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = e;
  while (b-- > 1) {
    e = e + l;
    f = f + l;
    g = g + l;
    h = h + l;
    i = i + l;
    j = j + l;
    k = k + l;
    l = l + l;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
}

__kernel void H(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l;
  int m;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = e;
  while (b-- > 1) {
    e = e + m;
    f = f + m;
    g = g + m;
    h = h + m;
    i = i + m;
    j = j + m;
    k = k + m;
    l = l + m;
    m = m + m;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
}

__kernel void I(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m;
  int n;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = e;
  while (b-- > 1) {
    e = e + n;
    f = f + n;
    g = g + n;
    h = h + n;
    i = i + n;
    j = j + n;
    k = k + n;
    l = l + n;
    m = m + n;
    n = n + n;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
}

__kernel void J(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n;
  int o;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = e;
  while (b-- > 1) {
    e = e + o;
    f = f + o;
    g = g + o;
    h = h + o;
    i = i + o;
    j = j + o;
    k = k + o;
    l = l + o;
    m = m + o;
    n = n + o;
    o = o + o;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
}

__kernel void K(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o;
  int p;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = e;
  while (b-- > 1) {
    e = e + p;
    f = f + p;
    g = g + p;
    h = h + p;
    i = i + p;
    j = j + p;
    k = k + p;
    l = l + p;
    m = m + p;
    n = n + p;
    o = o + p;
    p = p + p;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
}

__kernel void L(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p;
  int q;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = e;
  while (b-- > 1) {
    e = e + q;
    f = f + q;
    g = g + q;
    h = h + q;
    i = i + q;
    j = j + q;
    k = k + q;
    l = l + q;
    m = m + q;
    n = n + q;
    o = o + q;
    p = p + q;
    q = q + q;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
}

__kernel void M(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q;
  int r;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = e;
  while (b-- > 1) {
    e = e + r;
    f = f + r;
    g = g + r;
    h = h + r;
    i = i + r;
    j = j + r;
    k = k + r;
    l = l + r;
    m = m + r;
    n = n + r;
    o = o + r;
    p = p + r;
    q = q + r;
    r = r + r;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
}

__kernel void N(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r;
  int s;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = e;
  while (b-- > 1) {
    e = e + s;
    f = f + s;
    g = g + s;
    h = h + s;
    i = i + s;
    j = j + s;
    k = k + s;
    l = l + s;
    m = m + s;
    n = n + s;
    o = o + s;
    p = p + s;
    q = q + s;
    r = r + s;
    s = s + s;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
}

__kernel void O(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s;
  int t;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = e;
  while (b-- > 1) {
    e = e + t;
    f = f + t;
    g = g + t;
    h = h + t;
    i = i + t;
    j = j + t;
    k = k + t;
    l = l + t;
    m = m + t;
    n = n + t;
    o = o + t;
    p = p + t;
    q = q + t;
    r = r + t;
    s = s + t;
    t = t + t;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
}

__kernel void P(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t;
  int u;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = e;
  while (b-- > 1) {
    e = e + u;
    f = f + u;
    g = g + u;
    h = h + u;
    i = i + u;
    j = j + u;
    k = k + u;
    l = l + u;
    m = m + u;
    n = n + u;
    o = o + u;
    p = p + u;
    q = q + u;
    r = r + u;
    s = s + u;
    t = t + u;
    u = u + u;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
}

__kernel void Q(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;
  int v;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = d[16];
  v = e;
  while (b-- > 1) {
    e = e + v;
    f = f + v;
    g = g + v;
    h = h + v;
    i = i + v;
    j = j + v;
    k = k + v;
    l = l + v;
    m = m + v;
    n = n + v;
    o = o + v;
    p = p + v;
    q = q + v;
    r = r + v;
    s = s + v;
    t = t + v;
    u = u + v;
    v = v + v;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
  d[16] = u;
}

__kernel void R(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v;
  int w;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = d[16];
  v = d[17];
  w = e;
  while (b-- > 1) {
    e = e + w;
    f = f + w;
    g = g + w;
    h = h + w;
    i = i + w;
    j = j + w;
    k = k + w;
    l = l + w;
    m = m + w;
    n = n + w;
    o = o + w;
    p = p + w;
    q = q + w;
    r = r + w;
    s = s + w;
    t = t + w;
    u = u + w;
    v = v + w;
    w = w + w;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
  d[16] = u;
  d[17] = v;
}

__kernel void S(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w;
  int x;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = d[16];
  v = d[17];
  w = d[18];
  x = e;
  while (b-- > 1) {
    e = e + x;
    f = f + x;
    g = g + x;
    h = h + x;
    i = i + x;
    j = j + x;
    k = k + x;
    l = l + x;
    m = m + x;
    n = n + x;
    o = o + x;
    p = p + x;
    q = q + x;
    r = r + x;
    s = s + x;
    t = t + x;
    u = u + x;
    v = v + x;
    w = w + x;
    x = x + x;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
  d[16] = u;
  d[17] = v;
  d[18] = w;
}

__kernel void T(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x;
  int y;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = d[16];
  v = d[17];
  w = d[18];
  x = d[19];
  y = e;
  while (b-- > 1) {
    e = e + y;
    f = f + y;
    g = g + y;
    h = h + y;
    i = i + y;
    j = j + y;
    k = k + y;
    l = l + y;
    m = m + y;
    n = n + y;
    o = o + y;
    p = p + y;
    q = q + y;
    r = r + y;
    s = s + y;
    t = t + y;
    u = u + y;
    v = v + y;
    w = w + y;
    x = x + y;
    y = y + y;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
  d[16] = u;
  d[17] = v;
  d[18] = w;
  d[19] = x;
}
__kernel void U(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e;
  int f;
  e = d[0];
  f = e;
  while (b-- > 1) {
    e = e + f;
    f = f + f;
  }
  d[0] = e;
}

__kernel void V(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f;
  int g;
  e = d[0];
  f = d[1];
  g = e;
  while (b-- > 1) {
    f = e + g;
    e = f + g;
    g = g + g;
  }
  d[0] = e;
  d[1] = f;
}

__kernel void W(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g;
  int h;
  e = d[0];
  f = d[1];
  g = d[2];
  h = e;
  while (b-- > 1) {
    f = e + h;
    g = f + h;
    e = g + h;
    h = h + h;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
}

__kernel void X(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h;
  int i;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = e;
  while (b-- > 1) {
    f = e + i;
    g = f + i;
    h = g + i;
    e = h + i;
    i = i + i;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
}

__kernel void Y(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i;
  int j;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = e;
  while (b-- > 1) {
    f = e + j;
    g = f + j;
    h = g + j;
    i = h + j;
    e = i + j;
    j = j + j;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
}

__kernel void Z(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j;
  int k;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = e;
  while (b-- > 1) {
    f = e + k;
    g = f + k;
    h = g + k;
    i = h + k;
    j = i + k;
    e = j + k;
    k = k + k;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
}

__kernel void AA(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k;
  int l;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = e;
  while (b-- > 1) {
    f = e + l;
    g = f + l;
    h = g + l;
    i = h + l;
    j = i + l;
    k = j + l;
    e = k + l;
    l = l + l;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
}

__kernel void AB(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l;
  int m;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = e;
  while (b-- > 1) {
    f = e + m;
    g = f + m;
    h = g + m;
    i = h + m;
    j = i + m;
    k = j + m;
    l = k + m;
    e = l + m;
    m = m + m;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
}

__kernel void AC(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m;
  int n;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = e;
  while (b-- > 1) {
    f = e + n;
    g = f + n;
    h = g + n;
    i = h + n;
    j = i + n;
    k = j + n;
    l = k + n;
    m = l + n;
    e = m + n;
    n = n + n;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
}

__kernel void AD(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n;
  int o;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = e;
  while (b-- > 1) {
    f = e + o;
    g = f + o;
    h = g + o;
    i = h + o;
    j = i + o;
    k = j + o;
    l = k + o;
    m = l + o;
    n = m + o;
    e = n + o;
    o = o + o;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
}

__kernel void AE(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o;
  int p;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = e;
  while (b-- > 1) {
    f = e + p;
    g = f + p;
    h = g + p;
    i = h + p;
    j = i + p;
    k = j + p;
    l = k + p;
    m = l + p;
    n = m + p;
    o = n + p;
    e = o + p;
    p = p + p;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
}

__kernel void AF(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p;
  int q;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = e;
  while (b-- > 1) {
    f = e + q;
    g = f + q;
    h = g + q;
    i = h + q;
    j = i + q;
    k = j + q;
    l = k + q;
    m = l + q;
    n = m + q;
    o = n + q;
    p = o + q;
    e = p + q;
    q = q + q;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
}

__kernel void AG(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q;
  int r;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = e;
  while (b-- > 1) {
    f = e + r;
    g = f + r;
    h = g + r;
    i = h + r;
    j = i + r;
    k = j + r;
    l = k + r;
    m = l + r;
    n = m + r;
    o = n + r;
    p = o + r;
    q = p + r;
    e = q + r;
    r = r + r;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
}

__kernel void AH(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r;
  int s;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = e;
  while (b-- > 1) {
    f = e + s;
    g = f + s;
    h = g + s;
    i = h + s;
    j = i + s;
    k = j + s;
    l = k + s;
    m = l + s;
    n = m + s;
    o = n + s;
    p = o + s;
    q = p + s;
    r = q + s;
    e = r + s;
    s = s + s;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
}

__kernel void AI(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s;
  int t;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = e;
  while (b-- > 1) {
    f = e + t;
    g = f + t;
    h = g + t;
    i = h + t;
    j = i + t;
    k = j + t;
    l = k + t;
    m = l + t;
    n = m + t;
    o = n + t;
    p = o + t;
    q = p + t;
    r = q + t;
    s = r + t;
    e = s + t;
    t = t + t;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
}

__kernel void AJ(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t;
  int u;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = e;
  while (b-- > 1) {
    f = e + u;
    g = f + u;
    h = g + u;
    i = h + u;
    j = i + u;
    k = j + u;
    l = k + u;
    m = l + u;
    n = m + u;
    o = n + u;
    p = o + u;
    q = p + u;
    r = q + u;
    s = r + u;
    t = s + u;
    e = t + u;
    u = u + u;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
}

__kernel void AK(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;
  int v;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = d[16];
  v = e;
  while (b-- > 1) {
    f = e + v;
    g = f + v;
    h = g + v;
    i = h + v;
    j = i + v;
    k = j + v;
    l = k + v;
    m = l + v;
    n = m + v;
    o = n + v;
    p = o + v;
    q = p + v;
    r = q + v;
    s = r + v;
    t = s + v;
    u = t + v;
    e = u + v;
    v = v + v;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
  d[16] = u;
}

__kernel void AL(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v;
  int w;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = d[16];
  v = d[17];
  w = e;
  while (b-- > 1) {
    f = e + w;
    g = f + w;
    h = g + w;
    i = h + w;
    j = i + w;
    k = j + w;
    l = k + w;
    m = l + w;
    n = m + w;
    o = n + w;
    p = o + w;
    q = p + w;
    r = q + w;
    s = r + w;
    t = s + w;
    u = t + w;
    v = u + w;
    e = v + w;
    w = w + w;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
  d[16] = u;
  d[17] = v;
}

__kernel void AM(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w;
  int x;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = d[16];
  v = d[17];
  w = d[18];
  x = e;
  while (b-- > 1) {
    f = e + x;
    g = f + x;
    h = g + x;
    i = h + x;
    j = i + x;
    k = j + x;
    l = k + x;
    m = l + x;
    n = m + x;
    o = n + x;
    p = o + x;
    q = p + x;
    r = q + x;
    s = r + x;
    t = s + x;
    u = t + x;
    v = u + x;
    w = v + x;
    e = w + x;
    x = x + x;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
  d[16] = u;
  d[17] = v;
  d[18] = w;
}

__kernel void AN(__global int* a, long b, int c) {
  __global int* d = a + get_global_id(0) * c;
  int e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x;
  int y;
  e = d[0];
  f = d[1];
  g = d[2];
  h = d[3];
  i = d[4];
  j = d[5];
  k = d[6];
  l = d[7];
  m = d[8];
  n = d[9];
  o = d[10];
  p = d[11];
  q = d[12];
  r = d[13];
  s = d[14];
  t = d[15];
  u = d[16];
  v = d[17];
  w = d[18];
  x = d[19];
  y = e;
  while (b-- > 1) {
    f = e + y;
    g = f + y;
    h = g + y;
    i = h + y;
    j = i + y;
    k = j + y;
    l = k + y;
    m = l + y;
    n = m + y;
    o = n + y;
    p = o + y;
    q = p + y;
    r = q + y;
    s = r + y;
    t = s + y;
    u = t + y;
    v = u + y;
    w = v + y;
    x = w + y;
    e = x + y;
    y = y + y;
  }
  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;
  d[8] = m;
  d[9] = n;
  d[10] = o;
  d[11] = p;
  d[12] = q;
  d[13] = r;
  d[14] = s;
  d[15] = t;
  d[16] = u;
  d[17] = v;
  d[18] = w;
  d[19] = x;
}