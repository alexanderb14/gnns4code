__kernel void A(__global char* a) {
  uint b = get_global_id(0) % 256;
  uint c = get_global_id(0) >> 8;
  ulong d = get_global_id(0) << 16;
  uint e;
  uint f = 128;

  while (f--) {
    __global ulong* g = (__global ulong*)(a + c * (1024 * 1024 * 1024 / 32));
    for (e = 0; e < ((1024 * 1024 * 1024 / sizeof(ulong)) / 32); e += 256) {
      *(g + e + b) = d;
    }
  }
}

__kernel void B(__global char* a) {
  uint b = get_global_id(0) % 256;
  uint c = get_global_id(0) >> 8;
  uint d;
  uint e = 128;
  ulong f = 0;

  while (e--) {
    __global ulong* g = (__global ulong*)(a + c * (1024 * 1024 * 1024 / 32));
    for (d = 0; d < ((1024 * 1024 * 1024 / sizeof(ulong)) / 32); d += 256) {
      f += *(g + d + b);
    }
  }

  *(__global ulong*)(a + c * (1024 * 1024 * 1024 / 32)) = f;
}

__kernel void C(__global char* a) {
  uint b = get_global_id(0) % 256;
  uint c = get_global_id(0) >> 8;
  uint d;
  uint e = 128;

  while (e--) {
    __global ulong* f = (__global ulong*)(a + c * (1024 * 1024 * 1024 / 32));
    for (d = 0; d * 2 < ((1024 * 1024 * 1024 / sizeof(ulong)) / 32); d += 256) {
      *(f + ((1024 * 1024 * 1024 / sizeof(ulong)) / 32) / 2 + d + b) = *(f + d + b);
    }
  }
}