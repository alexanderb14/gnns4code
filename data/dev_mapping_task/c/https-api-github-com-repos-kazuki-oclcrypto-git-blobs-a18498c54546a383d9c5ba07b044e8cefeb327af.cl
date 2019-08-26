int A(__private uint a[8], __private uint b[8]); int B(__private uint a[8]); void C(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8]); void D(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8]); void E(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8]); void F(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8], __private uint e[8], __private uint f[8], __private uint g[8], __private uint h[8], __private uint i[8], __private uint j[8]); void G(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8], __private uint e[8], __private uint f[8], __private uint g[8]); void H(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8], __private uint e[8], __private uint f[8], __private uint g[8], __private uint h[8]); __kernel void I(__global uint* a, __global uint* b) {
  __private uint c[8];
  __private uint d[8];
  __private uint e[8];
  __private uint f[8];
  __private uint g[8];
  __private uint h[8];
  __private uint i[8];
  __private uint j[8] = {0xffffffff, 0xffffffff, 0xffffffff, 0, 0, 0, 1, 0xffffffff};

  int k = get_global_id(0);
  a += k * 32;
  b += k * 24;

  for (uint l = 0; l < 8; l++) {
    c[l] = a[l];
    d[l] = a[l + 8];
    e[l] = a[l + 16];
    i[l] = a[l + 24];
  }

  H(c, d, e, i, j, f, g, h);

  for (uint l = 0; l < 8; l++) {
    b[l] = f[l];
    b[l + 8] = g[l];
    b[l + 16] = h[l];
  }
}

void H(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8], __private uint e[8], __private uint f[8], __private uint g[8], __private uint h[8]) {
  __private uint i[8];
  __private uint j[8];
  __private uint k[8];
  __private uint *l, *m, *n, *o, *p, *q, *r;

  int s = 255;
  while (s >= 0 && ((d[s >> 5] >> (s & 31)) & 1) == 0)
    s--;
  for (int t = 0; t < 8; t++) {
    f[t] = a[t];
    g[t] = b[t];
    h[t] = c[t];
  }
  s--;

  l = f;
  m = g;
  n = h;
  o = i;
  p = j;
  q = k;

  for (; s >= 0; s--) {
    G(l, m, n, e, o, p, q);
    if (((d[s >> 5] >> (s & 31)) & 1) == 1) {
      F(o, p, q, a, b, c, e, l, m, n);
    } else {
      r = l;
      l = o;
      o = r;
      r = m;
      m = p;
      p = r;
      r = n;
      n = q;
      q = r;
    }
  }
  for (int t = 0; t < 8; t++) {
    f[t] = l[t];
    g[t] = m[t];
    h[t] = n[t];
  }
}

void F(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8], __private uint e[8], __private uint f[8], __private uint g[8], __private uint h[8], __private uint i[8], __private uint j[8]) {
  __private uint* k = i;

  __private uint* l = h;

  __private uint m[8];
  __private uint n[8];
  __private uint o[8];
  __private uint p[8];
  __private uint q[8];
  E(c, c, g, l);
  E(c, l, g, p);
  E(d, l, g, l);
  E(e, p, g, p);
  E(f, f, g, k);
  E(f, k, g, o);
  E(a, k, g, k);
  E(b, o, g, o);
  D(l, k, g, n);
  E(c, f, g, j);
  E(j, n, g, j);
  E(n, n, g, m);
  E(n, m, g, n);
  D(p, o, g, q);
  E(q, q, g, p);
  D(p, n, g, p);
  C(k, k, g, l);
  E(l, m, g, l);
  D(p, l, g, h);
  E(k, m, g, k);
  D(k, h, g, k);
  E(k, q, g, k);
  E(o, n, g, o);
  D(k, o, g, i);
}

void G(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8], __private uint e[8], __private uint f[8], __private uint g[8]) {
  __private uint h[8];
  __private uint i[8];
  __private uint* j = g;
  E(c, c, d, h);
  D(a, h, d, i);
  C(a, h, d, h);
  E(i, h, d, i);
  C(i, i, d, h);
  C(i, h, d, i);

  E(b, b, d, h);
  E(a, h, d, j);
  C(j, j, d, j);
  C(j, j, d, j);

  E(i, i, d, e);
  C(j, j, d, f);
  D(e, f, d, e);

  E(h, h, d, h);
  C(h, h, d, h);
  C(h, h, d, h);
  C(h, h, d, h);

  D(j, e, d, j);
  E(i, j, d, i);
  D(i, h, d, f);

  E(b, c, d, g);
  C(g, g, d, g);
}

void C(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8]) {
  uint e, f = 0;
  ulong g = 0;
  for (uint h = 0; h < 8; h++) {
    g += ((ulong)a[h]) + ((ulong)b[h]);
    d[h] = (uint)(g & 0xffffffff);
    g >>= 32;
  }
  if (g == 0 && A(d, c) < 0)
    return;

  for (uint h = 0; h < 7; h++) {
    e = c[h] + f;
    d[h] -= e;
    f = (e < f || d[h] > ~e ? 1 : 0);
  }
  d[7] -= c[7] + f;
}

void D(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8]) {
  int e = A(a, b);
  if (e >= 0) {
    uint f = b[0], g;
    g = ((d[0] = a[0] - b[0]) > ~f ? 1U : 0U);
    f = b[1] + g;
    g = (f<g | (d[1] = a[1] - f)> ~f ? 1U : 0U);
    f = b[2] + g;
    g = (f<g | (d[2] = a[2] - f)> ~f ? 1U : 0U);
    f = b[3] + g;
    g = (f<g | (d[3] = a[3] - f)> ~f ? 1U : 0U);
    f = b[4] + g;
    g = (f<g | (d[4] = a[4] - f)> ~f ? 1U : 0U);
    f = b[5] + g;
    g = (f<g | (d[5] = a[5] - f)> ~f ? 1U : 0U);
    f = b[6] + g;
    g = (f<g | (d[6] = a[6] - f)> ~f ? 1U : 0U);
    d[7] = a[7] - b[7] - g;
  } else {
    long f;
    int g = 0;
    d[0] = (uint)(f = ((long)a[0]) + ((long)c[0]) - b[0] - g);
    g = (f < 0 ? 1 : f > 0xFFFFFFFF ? -1 : 0);
    d[1] = (uint)(f = ((long)a[1]) + ((long)c[1]) - b[1] - g);
    g = (f < 0 ? 1 : f > 0xFFFFFFFF ? -1 : 0);
    d[2] = (uint)(f = ((long)a[2]) + ((long)c[2]) - b[2] - g);
    g = (f < 0 ? 1 : f > 0xFFFFFFFF ? -1 : 0);
    d[3] = (uint)(f = ((long)a[3]) + ((long)c[3]) - b[3] - g);
    g = (f < 0 ? 1 : f > 0xFFFFFFFF ? -1 : 0);
    d[4] = (uint)(f = ((long)a[4]) + ((long)c[4]) - b[4] - g);
    g = (f < 0 ? 1 : f > 0xFFFFFFFF ? -1 : 0);
    d[5] = (uint)(f = ((long)a[5]) + ((long)c[5]) - b[5] - g);
    g = (f < 0 ? 1 : f > 0xFFFFFFFF ? -1 : 0);
    d[6] = (uint)(f = ((long)a[6]) + ((long)c[6]) - b[6] - g);
    g = (f < 0 ? 1 : f > 0xFFFFFFFF ? -1 : 0);
    d[7] = (uint)(f = ((long)a[7]) + ((long)c[7]) - b[7] - g);
  }
}

void E(__private uint a[8], __private uint b[8], __private uint c[8], __private uint d[8]) {
  ulong e, f, g, h, i, j, k, l;
  uint m;
  ulong n, o, p, q, r, s, t, u;
  ulong v, w, x, y, z;
  ulong aa, ab;
  const ulong ac = 0xffffffff;
  const ulong ad = 0x100000000;
  const ulong ae = 0xffffff800000007f;

  n = ((ulong)a[0]) * ((ulong)b[0]);
  e = n & ac;
  f = n >> 32;
  n = ((ulong)a[1]) * ((ulong)b[0]);
  f += n & ac;
  g = n >> 32;
  n = ((ulong)a[2]) * ((ulong)b[0]);
  g += n & ac;
  h = n >> 32;
  n = ((ulong)a[3]) * ((ulong)b[0]);
  h += n & ac;
  i = n >> 32;
  n = ((ulong)a[4]) * ((ulong)b[0]);
  i += n & ac;
  j = n >> 32;
  n = ((ulong)a[5]) * ((ulong)b[0]);
  j += n & ac;
  k = n >> 32;
  n = ((ulong)a[6]) * ((ulong)b[0]);
  k += n & ac;
  l = n >> 32;
  n = ((ulong)a[7]) * ((ulong)b[0]);
  l += n & ac;
  m = (uint)(n >> 32);
  l += m;
  k -= m;
  h -= m;
  e += m;

  n = ((ulong)a[0]) * ((ulong)b[1]);
  f += n & ac;
  g += n >> 32;
  n = ((ulong)a[1]) * ((ulong)b[1]);
  g += n & ac;
  h += n >> 32;
  n = ((ulong)a[2]) * ((ulong)b[1]);
  h += n & ac;
  i += n >> 32;
  n = ((ulong)a[3]) * ((ulong)b[1]);
  i += n & ac;
  j += n >> 32;
  n = ((ulong)a[4]) * ((ulong)b[1]);
  j += n & ac;
  k += n >> 32;
  n = ((ulong)a[5]) * ((ulong)b[1]);
  k += n & ac;
  l += n >> 32;
  n = ((ulong)a[6]) * ((ulong)b[1]);
  l += n & ac;
  o = (uint)(n >> 32);
  n = ((ulong)a[7]) * ((ulong)b[1]);
  o += (uint)n;
  m = (uint)(n >> 32);
  l += o;
  k -= o + m;
  i -= m;
  h -= o + m;
  f += m;
  e += o + m;

  n = ((ulong)a[0]) * ((ulong)b[2]);
  g += n & ac;
  h += n >> 32;
  n = ((ulong)a[1]) * ((ulong)b[2]);
  h += n & ac;
  i += n >> 32;
  n = ((ulong)a[2]) * ((ulong)b[2]);
  i += n & ac;
  j += n >> 32;
  n = ((ulong)a[3]) * ((ulong)b[2]);
  j += n & ac;
  k += n >> 32;
  n = ((ulong)a[4]) * ((ulong)b[2]);
  k += n & ac;
  l += n >> 32;
  n = ((ulong)a[5]) * ((ulong)b[2]);
  l += n & ac;
  o = (uint)(n >> 32);
  n = ((ulong)a[6]) * ((ulong)b[2]);
  o += (uint)n;
  p = (uint)(n >> 32);
  n = ((ulong)a[7]) * ((ulong)b[2]);
  p += (uint)n;
  m = (uint)(n >> 32);
  l += o - m;
  k -= o + p;
  j -= m;
  i -= p + m;
  h -= o + p;
  g += m;
  f += p + m;
  e += o + p;

  n = ((ulong)a[0]) * ((ulong)b[3]);
  h += n & ac;
  i += n >> 32;
  n = ((ulong)a[1]) * ((ulong)b[3]);
  i += n & ac;
  j += n >> 32;
  n = ((ulong)a[2]) * ((ulong)b[3]);
  j += n & ac;
  k += n >> 32;
  n = ((ulong)a[3]) * ((ulong)b[3]);
  k += n & ac;
  l += n >> 32;
  n = ((ulong)a[4]) * ((ulong)b[3]);
  l += n & ac;
  o = (uint)(n >> 32);
  n = ((ulong)a[5]) * ((ulong)b[3]);
  o += (uint)n;
  p = (uint)(n >> 32);
  n = ((ulong)a[6]) * ((ulong)b[3]);
  p += (uint)n;
  q = (uint)(n >> 32);
  n = ((ulong)a[7]) * ((ulong)b[3]);
  q += (uint)n;
  m = (uint)(n >> 32);
  v = ((ulong)m) << 1;
  l += o - q - m;
  k -= o + p;
  j -= q + m;
  i -= p + q;
  h -= o + p - v;
  g += q + m;
  f += p + q;
  e += o + p - m;

  n = ((ulong)a[0]) * ((ulong)b[4]);
  i += n & ac;
  j += n >> 32;
  n = ((ulong)a[1]) * ((ulong)b[4]);
  j += n & ac;
  k += n >> 32;
  n = ((ulong)a[2]) * ((ulong)b[4]);
  k += n & ac;
  l += n >> 32;
  n = ((ulong)a[3]) * ((ulong)b[4]);
  l += n & ac;
  o = (uint)(n >> 32);
  n = ((ulong)a[4]) * ((ulong)b[4]);
  o += (uint)n;
  p = (uint)(n >> 32);
  n = ((ulong)a[5]) * ((ulong)b[4]);
  p += (uint)n;
  q = (uint)(n >> 32);
  n = ((ulong)a[6]) * ((ulong)b[4]);
  q += (uint)n;
  r = (uint)(n >> 32);
  n = ((ulong)a[7]) * ((ulong)b[4]);
  r += (uint)n;
  m = (uint)(n >> 32);
  v = r << 1;
  w = ((ulong)m) << 1;
  l += o - q - r - m;
  k -= o + p;
  j -= q + r;
  i -= p + q - w;
  h -= o + p - v - w;
  g += q + r;
  f += p + q - m;
  e += o + p - r - m;

  n = ((ulong)a[0]) * ((ulong)b[5]);
  j += n & ac;
  k += n >> 32;
  n = ((ulong)a[1]) * ((ulong)b[5]);
  k += n & ac;
  l += n >> 32;
  n = ((ulong)a[2]) * ((ulong)b[5]);
  l += n & ac;
  o = (uint)(n >> 32);
  n = ((ulong)a[3]) * ((ulong)b[5]);
  o += (uint)n;
  p = (uint)(n >> 32);
  n = ((ulong)a[4]) * ((ulong)b[5]);
  p += (uint)n;
  q = (uint)(n >> 32);
  n = ((ulong)a[5]) * ((ulong)b[5]);
  q += (uint)n;
  r = (uint)(n >> 32);
  n = ((ulong)a[6]) * ((ulong)b[5]);
  r += (uint)n;
  s = (uint)(n >> 32);
  n = ((ulong)a[7]) * ((ulong)b[5]);
  s += (uint)n;
  m = (uint)(n >> 32);
  v = r << 1;
  w = s << 1;
  x = ((ulong)m) << 1;
  l += o - q - r - s - m;
  k -= o + p - m;
  j -= q + r - x;
  i -= p + q - w - x;
  h -= o + p - v - w - m;
  g += q + r - m;
  f += p + q - s - m;
  e += o + p - r - s - m;

  n = ((ulong)a[0]) * ((ulong)b[6]);
  k += n & ac;
  l += n >> 32;
  n = ((ulong)a[1]) * ((ulong)b[6]);
  l += n & ac;
  o = (uint)(n >> 32);
  n = ((ulong)a[2]) * ((ulong)b[6]);
  o += (uint)n;
  p = (uint)(n >> 32);
  n = ((ulong)a[3]) * ((ulong)b[6]);
  p += (uint)n;
  q = (uint)(n >> 32);
  n = ((ulong)a[4]) * ((ulong)b[6]);
  q += (uint)n;
  r = (uint)(n >> 32);
  n = ((ulong)a[5]) * ((ulong)b[6]);
  r += (uint)n;
  s = (uint)(n >> 32);
  n = ((ulong)a[6]) * ((ulong)b[6]);
  s += (uint)n;
  t = (uint)(n >> 32);
  n = ((ulong)a[7]) * ((ulong)b[6]);
  t += (uint)n;
  m = (uint)(n >> 32);
  v = r << 1;
  w = s << 1;
  x = t << 1;
  y = ((ulong)m) << 1;
  aa = y + m;
  l += o - q - r - s - t;
  k -= o + p - t - aa;
  j -= q + r - x - y;
  i -= p + q - w - x - m;
  h -= o + p - v - w - t;
  g += q + r - t - m;
  f += p + q - s - t - m;
  e += o + p - r - s - t - m;

  n = ((ulong)a[0]) * ((ulong)b[7]);
  l += n & ac;
  o = (uint)(n >> 32);
  n = ((ulong)a[1]) * ((ulong)b[7]);
  o += (uint)n;
  p = (uint)(n >> 32);
  n = ((ulong)a[2]) * ((ulong)b[7]);
  p += (uint)n;
  q = (uint)(n >> 32);
  n = ((ulong)a[3]) * ((ulong)b[7]);
  q += (uint)n;
  r = (uint)(n >> 32);
  n = ((ulong)a[4]) * ((ulong)b[7]);
  r += (uint)n;
  s = (uint)(n >> 32);
  n = ((ulong)a[5]) * ((ulong)b[7]);
  s += (uint)n;
  t = (uint)(n >> 32);
  n = ((ulong)a[6]) * ((ulong)b[7]);
  t += (uint)n;
  u = (uint)(n >> 32);
  n = ((ulong)a[7]) * ((ulong)b[7]);
  u += (uint)n;
  m = (uint)(n >> 32);
  v = r << 1;
  w = s << 1;
  x = t << 1;
  y = u << 1;
  z = ((ulong)m) << 1;
  aa = y + u;
  ab = z + m;
  l += o - q - r - s - t + ab;
  k -= o + p - t - aa - z;
  j -= q + r - x - y - m;
  i -= p + q - w - x - u;
  h -= o + p - v - w - t + m;
  g += q + r - t - u - m;
  f += p + q - s - t - u - m;
  e += o + p - r - s - t - u;

  while (e >= ae) {
    f--;
    e += ad;
  }
  while (f >= ae) {
    g--;
    f += ad;
  }
  while (g >= ae) {
    h--;
    g += ad;
  }
  while (h >= ae) {
    i--;
    h += ad;
  }
  while (i >= ae) {
    j--;
    i += ad;
  }
  while (j >= ae) {
    k--;
    j += ad;
  }
  while (k >= ae) {
    l--;
    k += ad;
  }
  while (l >= ae) {
    e += c[0];
    f += c[1];
    g += c[2];
    h += c[3];
    i += c[4];
    j += c[5];
    k += c[6];
    l += c[7];
  }

  while (e > ac || f > ac || g > ac || h > ac || i > ac || j > ac || k > ac || l > ac) {
    if (l > ac) {
      m = (uint)(l >> 32);
      e += m;
      h -= m;
      k -= m;
      l = m + (ulong)((uint)l);

      while (h >= ae) {
        i--;
        h += ad;
      }
      while (i >= ae) {
        j--;
        i += ad;
      }
      while (j >= ae) {
        k--;
        j += ad;
      }
      while (k >= ae) {
        l--;
        k += ad;
      }
    }
    m = (uint)(e >> 32);
    e = (uint)e;
    f += m;
    m = (uint)(f >> 32);
    f = (uint)f;
    g += m;
    m = (uint)(g >> 32);
    g = (uint)g;
    h += m;
    m = (uint)(h >> 32);
    h = (uint)h;
    i += m;
    m = (uint)(i >> 32);
    i = (uint)i;
    j += m;
    m = (uint)(j >> 32);
    j = (uint)j;
    k += m;
    m = (uint)(k >> 32);
    k = (uint)k;
    l += m;
  }

  d[0] = e;
  d[1] = f;
  d[2] = g;
  d[3] = h;
  d[4] = i;
  d[5] = j;
  d[6] = k;
  d[7] = l;

  if (A(a, c) >= 0) {
    d[0] -= c[0];
    uint af = d[0] > ~m ? 1U : 0U;
    m = af + c[0];
    d[1] -= m;
    af = (m < af || d[1] > ~m ? 1U : 0U);
    m = af + c[0];
    d[2] -= m;
    af = (m < af || d[2] > ~m ? 1U : 0U);
    m = af + c[0];
    d[3] -= m;
    af = (m < af || d[3] > ~m ? 1U : 0U);
    m = af + c[0];
    d[4] -= m;
    af = (m < af || d[4] > ~m ? 1U : 0U);
    m = af + c[0];
    d[5] -= m;
    af = (m < af || d[5] > ~m ? 1U : 0U);
    m = af + c[0];
    d[6] -= m;
    af = (m < af || d[6] > ~m ? 1U : 0U);
    m = af + c[0];
    d[7] -= m;
  }
}

int A(__private uint a[8], __private uint b[8]) {
  int c = 7;
  while (c != 0 && a[c] == b[c])
    c--;
  if (a[c] > b[c])
    return 1;
  if (a[c] < b[c])
    return -1;
  return 0;
}

int B(__private uint a[8]) {
  for (int b = 0; b < 8; b++)
    if (a[b] != 0)
      return 0;
  return 1;
}