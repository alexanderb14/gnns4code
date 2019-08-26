kernel void A(global const uint* restrict a, global const uint* restrict b, global uint* restrict c, global uint* restrict d, uint e) {
  const uint f = get_global_size(0);
  const uint g = get_global_id(0);
  const uint h = get_global_id(0) + f;
  if (g < e) {
    c[g] = 1 + (a[g] != 0);
    d[g] = (g == 0) || (b[g] != b[g - 1]);
  }
  if (h < e) {
    c[h] = 1 + (a[h] != 0);
    d[h] = (b[h] != b[h - 1]);
  }
}

kernel void B(global const uint* restrict a, global uint* restrict b, const uint c) {
  const uint d = get_global_id(0);
  const uint e = 2 * d;
  const uint f = 2 * d + 1;
  if (e < c)
    b[e] = (e == c - 1) ? 1 : a[e + 1];
  if (f < c)
    b[f] = (f == c - 1) ? 1 : a[f + 1];
}