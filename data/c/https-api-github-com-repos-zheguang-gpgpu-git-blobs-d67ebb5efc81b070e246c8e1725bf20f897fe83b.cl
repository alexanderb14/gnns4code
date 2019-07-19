inline void A(volatile __local uint* a, uint b, uint c) {
  uint d;
  do {
    d = a[b] & ((1U << (32U - 5)) - 1U);
    d = c | (d + 1);
    a[b] = d;
  } while (a[b] != d);
}

inline void B(volatile __local uint* a, uint b, uint c) {
  A(a, (b >> 0) & 0xFFU, c);
  A(a, (b >> 8) & 0xFFU, c);
  A(a, (b >> 16) & 0xFFU, c);
  A(a, (b >> 24) & 0xFFU, c);
}

__kernel __attribute__((reqd_work_group_size((8 * (1U << 5)), 1, 1))) void C(__global uint* a, __global uint* b, uint c) {
  __local uint d[8 * 256];
  __local uint* e = d + (get_local_id(0) >> 5) * 256;

  for (uint f = 0; f < (256 / (1U << 5)); f++)
    d[get_local_id(0) + f * (8 * (1U << 5))] = 0;

  const uint g = get_local_id(0) << (32 - 5);

  barrier(1);
  for (uint h = get_global_id(0); h < c; h += get_global_size(0)) {
    uint i = b[h];
    B(e, i, g);
  }

  barrier(1);
  for (uint h = get_local_id(0); h < 256; h += (8 * (1U << 5))) {
    uint j = 0;

    for (uint f = 0; f < 8; f++)
      j += d[h + f * 256] & ((1U << (32U - 5)) - 1U);

    a[get_group_id(0) * 256 + h] = j;
  }
}
__kernel __attribute__((reqd_work_group_size(32, 1, 1))) void D(__global uint* a, __global uint* b, uint c) {
  __local uint d[32];

  uint e = 0;
  for (uint f = get_local_id(0); f < c; f += 32)
    e += b[get_group_id(0) + f * 256];
  d[get_local_id(0)] = e;

  for (uint g = 32 / 2; g > 0; g >>= 1) {
    barrier(1);
    if (get_local_id(0) < g)
      d[get_local_id(0)] += d[get_local_id(0) + g];
  }

  if (get_local_id(0) == 0)
    a[get_group_id(0)] = d[0];
}