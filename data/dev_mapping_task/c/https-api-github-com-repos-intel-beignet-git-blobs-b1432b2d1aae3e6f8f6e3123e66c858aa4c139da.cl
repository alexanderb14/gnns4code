kernel void A(global uint* a, global uint* b, global ushort* c, global ushort* d, int e, global int* f, short g, global short* h, global ulong* i, global ulong* j, long k, global long* l) {
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
  j[get_global_id(0)] = ((((i[get_global_id(0)]) & 0xff00000000000000) >> 56) | (((i[get_global_id(0)]) & 0x00ff000000000000) >> 40) | (((i[get_global_id(0)]) & 0x0000ff0000000000) >> 24) | (((i[get_global_id(0)]) & 0x000000ff00000000) >> 8) | (((i[get_global_id(0)]) & 0x00000000ff000000) << 8) | (((i[get_global_id(0)]) & 0x0000000000ff0000) << 24) | (((i[get_global_id(0)]) & 0x000000000000ff00) << 40) | (((i[get_global_id(0)]) & 0x00000000000000ff) << 56));
  l[get_global_id(0)] = ((((k)&0xff00000000000000) >> 56) | (((k)&0x00ff000000000000) >> 40) | (((k)&0x0000ff0000000000) >> 24) | (((k)&0x000000ff00000000) >> 8) | (((k)&0x00000000ff000000) << 8) | (((k)&0x0000000000ff0000) << 24) | (((k)&0x000000000000ff00) << 40) | (((k)&0x00000000000000ff) << 56));
}