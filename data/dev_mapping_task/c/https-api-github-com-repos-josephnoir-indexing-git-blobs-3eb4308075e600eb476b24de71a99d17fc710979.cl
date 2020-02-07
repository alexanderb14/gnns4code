kernel void A(global uint* restrict a, global uint* restrict b, global uint2* restrict c, private uint d) {
  uint e = get_global_id(0);
  uint2 f;
  if (e < d) {
    f.x = a[e];
    f.y = b[e];
    c[e] = f;
  }
}