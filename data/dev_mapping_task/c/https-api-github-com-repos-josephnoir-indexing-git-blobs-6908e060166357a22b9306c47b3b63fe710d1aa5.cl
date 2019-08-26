kernel void A(global uint* restrict a, global uint* restrict b, global uint* restrict c) {
  uint d = get_global_id(0);
  c[d] = (d == 0) || (a[d] != a[d - 1]) || (b[d] != b[d - 1]);
}

kernel void B(global uint* restrict a, global uint* restrict b) {
  uint c = get_global_id(0);
  uint d = get_global_size(0);
  if (a[c] != 0) {
    uint e = b[c];
    uint f = c + 1;
    while (a[f] == 0 && f < d) {
      e |= b[f];
      f += 1;
    }
    b[c] = e;
  }
}

kernel void C(global const uint* restrict a, global uint* restrict b, const uint c) {
  const uint d = get_global_id(0);
  const uint e = 2 * d;
  const uint f = 2 * d + 1;
  if (e < c)
    b[e] = (e == c - 1) ? 1 : a[e + 1];
  if (f < c)
    b[f] = (f == c - 1) ? 1 : a[f + 1];
}