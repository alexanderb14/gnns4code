kernel void A(global const uint* restrict a, global const uint* restrict b, global uint* restrict c, private uint d) {
  const uint e = get_global_id(0);
  const uint f = 2 * e;
  const uint g = 2 * e + 1;
  if (f < d) {
    uint h = a[f];
    uint i = b[f];
    c[f] = (f != 0 && h == a[f - 1]) ? i - b[f - 1] - 1 : i;
    if (g < d) {
      c[g] = (a[g] == h) ? b[g] - i - 1 : b[g];
    }
  }
}