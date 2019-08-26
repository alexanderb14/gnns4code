uint A(local uint* a); uint B(local const uint* a, local const uint* b, local uint* c, local uint* d); uint C(local const uint* a, local uint* b); uint A(local uint* a) {
  const uint b = get_local_id(0);
  if (b < 64)
    a[b] += a[b + 64];
  barrier(1);
  if (b < 32)
    a[b] += a[b + 32];
  barrier(1);
  if (b < 16)
    a[b] += a[b + 16];
  barrier(1);
  if (b < 8)
    a[b] += a[b + 8];
  barrier(1);
  if (b < 4)
    a[b] += a[b + 4];
  barrier(1);
  if (b < 2)
    a[b] += a[b + 2];
  barrier(1);
  if (b < 1)
    a[b] += a[b + 1];
  barrier(1);
  return a[0];
}

kernel void D(global uint* restrict a, global uint* restrict b, local uint* restrict c, private const uint d) {
  const uint e = get_local_id(0);
  const uint f = get_group_id(0);
  const uint g = get_num_groups(0);
  const uint h = get_local_size(0);
  const uint i = d / g + ((d % g) ? 1 : 0);
  const uint j = (d < (f + 1) * i) ? d : ((f + 1) * i);
  c[e] = 0;
  for (uint k = f * i; k < (f + 1) * i; k += h) {
    if ((k + e) < j && b[k + e])
      c[e]++;
  }
  barrier(1);
  uint l = A(c);
  if (e == 0)
    a[f] = l;
  return;
}

uint C(local const uint* a, local uint* b) {
  const uint c = get_local_id(0);
  int d = 1;
  int e = 0;

  b[d * 128 + c] = (c > 0) ? a[c - 1] : 0;
  barrier(1);
  for (uint f = 1; f < 128; f *= 2) {
    d = 1 - d;
    e = 1 - d;
    barrier(1);
    b[d * 128 + c] = b[e * 128 + c];
    if (c >= f)
      b[d * 128 + c] += b[e * 128 + c - f];
  }
  barrier(1);
  return b[128 - 1] + a[128 - 1];
}

uint B(local const uint* a, local const uint* b, local uint* c, local uint* d) {
  uint e = get_local_id(0);
  uint f = C(b, d);
  if (b[e])
    c[d[e]] = a[e];
  return f;
}

kernel void E(global uint* restrict a, global const uint* b, global uint* restrict c, global const uint* d, global const uint* restrict e, local uint* restrict f, local uint* restrict g, local uint* restrict h, private const uint i) {
  uint j = get_local_id(0);
  uint k = get_group_id(0);
  uint l = get_num_groups(0);
  uint m = get_local_size(0);
  local uint n[256];
  uint o = 0;
  o = e[k];
  const uint p = i / l + ((i % l) ? 1 : 0);
  const uint q = (i < (k + 1) * p) ? i : ((k + 1) * p);
  for (uint r = k * p; r < (k + 1) * p; r += m) {
    if ((r + j) < q) {
      g[j] = (d[r + j] != 0);
      f[j] = b[r + j];
    } else {
      g[j] = 0;
    }
    barrier(1);
    uint s = B(f, g, h, n);
    barrier(1);
    if (j < s)
      c[o + j] = h[j];
    o += s;
  }
  barrier(1);
  if (k == (l - 1) && j == 0)
    a[0] = o;
}