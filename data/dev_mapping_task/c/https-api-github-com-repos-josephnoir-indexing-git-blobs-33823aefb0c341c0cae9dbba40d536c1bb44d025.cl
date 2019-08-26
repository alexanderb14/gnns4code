kernel void A(global uint* restrict a, global uint* restrict b, global uint* restrict c) {
  uint d = get_global_id(0);
  c[d] = 1u << (a[d] % 31u);
  c[d] |= 1u << 31u;
  b[d] = a[d] / 31u;
}