kernel void A(global uint* restrict a, global uint* restrict b, global uint* restrict c, global uint* restrict d, global uint* restrict e, global uint* restrict f, local uint* g, local uint* h, uint i) {
  const uint j = get_global_id(0);
  const uint k = get_local_id(0);
  const uint l = get_group_id(0);
  const uint m = get_local_size(0);
  const uint n = m * 2;
  const uint o = n;
  const uint p = 2 * k;
  const uint q = 2 * k + 1;
  const uint r = 2 * j;
  const uint s = 2 * j + 1;
  g[p] = (r < i) ? a[r] : 0;
  g[q] = (s < i) ? a[s] : 0;
  h[p] = (r < i) ? b[r] : 0;
  h[q] = (s < i) ? b[s] : 0;
  uint t = 1;
  for (uint u = o >> 1; u > 0; u >>= 1) {
    barrier(1);
    if (k < u) {
      const uint v = t * (p + 1) - 1;
      const uint w = t * (q + 1) - 1;
      g[w] += (h[w] == 0) ? g[v] : 0;
      h[w] |= h[v];
    }
    t <<= 1;
  }
  barrier(1);
  if (k == 0)
    f[l] = c[r];

  if (k == m - 1) {
    d[l] = g[o - 1];
    e[l] = h[o - 1];
  }
  if (r < i) {
    a[r] = g[p];
    b[r] = h[p];
  }
  if (s < i) {
    a[s] = g[q];
    b[s] = h[q];
  }
}

kernel void B(global uint* restrict a, global uint* restrict b, global uint* restrict c, uint d) {
  local uint e[1024];
  local uint f[1024];
  local uint g[1024];
  const uint h = get_local_id(0);
  const uint i = get_local_size(0);
  const uint j = 2 * i;
  const uint k = j;
  const uint l = 2 * h;
  const uint m = 2 * h + 1;
  e[l] = (l < d) ? a[l] : 0;
  e[m] = (m < d) ? a[m] : 0;
  f[l] = (l < d) ? b[l] : 0;
  f[m] = (m < d) ? b[m] : 0;
  g[l] = (l < d) ? c[l] : 0;
  g[m] = (m < d) ? c[m] : 0;

  uint n = 1;
  for (uint o = k >> 1; o > 0; o >>= 1) {
    barrier(1);
    if (h < o) {
      const int p = n * (l + 1) - 1;
      const int q = n * (m + 1) - 1;
      e[q] += (f[q] == 0) ? e[p] : 0;
      f[q] |= f[p];
    }
    n <<= 1;
  }
  if (h == 0)
    e[k - 1] = 0;

  for (uint o = 1; o < k; o <<= 1) {
    n >>= 1;
    barrier(1);
    if (h < o) {
      const uint p = n * (l + 1) - 1;
      const uint q = n * (m + 1) - 1;
      const uint r = e[p];
      e[p] = e[q];
      if (g[p + 1] == 1)
        e[q] = 0;
      else if (f[p] == 1)
        e[q] = r;
      else
        e[q] += r;
      f[p] = 0;
    }
  }
  barrier(1);
  if (l < d) {
    a[l] = e[l];
    b[l] = f[l];
  }
  if (m < d) {
    a[m] = e[m];
    b[m] = f[m];
  }
}
kernel void C(global uint* restrict a, global uint* restrict b, global uint* restrict c, global uint* restrict d, global uint* restrict e, local uint* f, local uint* g, local uint* h, uint i) {
  const uint j = get_global_id(0);
  const uint k = get_local_id(0);
  const uint l = get_group_id(0);
  const uint m = get_local_size(0);
  const uint n = m * 2;
  const uint o = n;
  const uint p = 2 * k;
  const uint q = 2 * k + 1;
  const uint r = 2 * j;
  const uint s = 2 * j + 1;

  f[p] = (r < i) ? a[r] : 0;
  f[q] = (s < i) ? a[s] : 0;
  g[p] = (r < i) ? b[r] : 1;
  g[q] = (s < i) ? b[s] : 1;
  h[p] = (r < i) ? c[r] : 0;
  h[q] = (s < i) ? c[s] : 0;

  if (k == m - 1) {
    f[o - 1] = d[l];
    g[o - 1] = e[l];
  }

  uint t = 1;
  for (uint u = o >> 1; u > 0; u >>= 1)
    t <<= 1;
  for (uint u = 1; u < o; u *= 2) {
    t >>= 1;
    barrier(1);
    if (k < u) {
      const int v = t * (p + 1) - 1;
      const int w = t * (q + 1) - 1;
      const uint x = f[v];
      f[v] = f[w];
      if (h[v + 1] == 1)
        f[w] = 0;
      else if (g[v] == 1)
        f[w] = x;
      else
        f[w] += x;
      g[v] = 0;
    }
  }
  barrier(1);

  if (r < i)
    a[r] = f[p];
  if (s < i)
    a[s] = f[q];
}
kernel void D(global uint* restrict a, global uint* restrict b, global uint* restrict c, global uint* restrict d, global uint* restrict e, global uint* restrict f, local uint* g, local uint* h, local uint* i, uint j) {
  const uint k = get_global_id(0);
  const uint l = get_local_id(0);
  const uint m = get_group_id(0);
  const uint n = get_local_size(0);
  const uint o = n * 2;
  const uint p = o;
  const uint q = 2 * l;
  const uint r = 2 * l + 1;
  const uint s = 2 * k;
  const uint t = 2 * k + 1;

  g[q] = (s < j) ? a[s] : 0;
  g[r] = (t < j) ? a[t] : 0;
  h[q] = (s < j) ? b[s] : 1;
  h[r] = (t < j) ? b[t] : 1;
  i[q] = (s < j) ? c[s] : 0;
  i[r] = (t < j) ? c[t] : 0;

  if (l == n - 1) {
    g[p - 1] = d[m];
    h[p - 1] = e[m];
  }

  uint u = 1;
  for (uint v = p >> 1; v > 0; v >>= 1)
    u <<= 1;
  for (uint v = 1; v < p; v *= 2) {
    u >>= 1;
    barrier(1);
    if (l < v) {
      const int w = u * (q + 1) - 1;
      const int x = u * (r + 1) - 1;
      const uint y = g[w];
      g[w] = g[x];
      if (i[w + 1] == 1)
        g[x] = 0;
      else if (h[w] == 1)
        g[x] = y;
      else
        g[x] += y;
      h[w] = 0;
    }
  }
  barrier(1);

  if (s < j)
    a[s] = g[q] + f[s];
  if (t < j)
    a[t] = g[r] + f[t];
}