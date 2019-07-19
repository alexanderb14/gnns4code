typedef uint4 data_t; inline void A(__local uchar* a, uint b) {
  a[((b) * (64))]++;
}

inline void B(__local uchar* a, uint b) {
  A(a, (b >> 2) & 0x3FU);
  A(a, (b >> 10) & 0x3FU);
  A(a, (b >> 18) & 0x3FU);
  A(a, (b >> 26) & 0x3FU);
}

__kernel

    void
    C(__global uint* a, __global data_t* b, uint c) {
  const uint d = ((get_local_id(0) & ~(16 * 4 - 1)) << 0) | ((get_local_id(0) & (16 - 1)) << 2) | ((get_local_id(0) & (16 * 3)) >> 4);

  __local uchar e[64 * 64];
  __local uchar* f = e + d;

  for (uint g = 0; g < (64 / 4); g++)
    ((__local uint*)e)[d + g * 64] = 0;

  barrier(1);
  for (uint h = get_global_id(0); h < c; h += get_global_size(0)) {
    data_t i = b[h];
    B(f, i.x);
    B(f, i.y);
    B(f, i.z);
    B(f, i.w);
  }

  barrier(1);
  if (get_local_id(0) < 64) {
    __local uchar* j = e + ((get_local_id(0)) * (64));

    uint k = 0;
    uint h = 4 * (get_local_id(0) & (16 - 1));
    for (uint g = 0; g < (64 / 4); g++) {
      k += j[h + 0] + j[h + 1] + j[h + 2] + j[h + 3];
      h = (h + 4) & (64 - 1);
    }

    a[get_group_id(0) * 64 + get_local_id(0)] = k;
  }
}
__kernel

    void
    D(__global uint* a, __global uint* b, uint c) {
  __local uint d[32];

  uint e = 0;
  for (uint f = get_local_id(0); f < c; f += 32)
    e += b[get_group_id(0) + f * 64];
  d[get_local_id(0)] = e;

  for (uint g = 32 / 2; g > 0; g >>= 1) {
    barrier(1);
    if (get_local_id(0) < g)
      d[get_local_id(0)] += d[get_local_id(0) + g];
  }

  if (get_local_id(0) == 0)
    a[get_group_id(0)] = d[0];
}