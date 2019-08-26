kernel void A(global uint* a, global uint* b, global ushort* c, global ushort* d, int e, global int* f, short g, global short* h) {
  if (get_global_id(0) % 2 == 0) {
    b[get_global_id(0)] = __builtin_bswap32(a[get_global_id(0)]);
  } else {
    b[get_global_id(0)] = a[get_global_id(0)];
  }

  d[get_global_id(0)] = __builtin_bswap16(c[get_global_id(0)]);
  if (get_global_id(0) % 2 == 1) {
    d[get_global_id(0)] = __builtin_bswap16(d[get_global_id(0)] + 1);
  }

  f[get_global_id(0)] = __builtin_bswap32(e);
  h[get_global_id(0)] = __builtin_bswap16(g);
}