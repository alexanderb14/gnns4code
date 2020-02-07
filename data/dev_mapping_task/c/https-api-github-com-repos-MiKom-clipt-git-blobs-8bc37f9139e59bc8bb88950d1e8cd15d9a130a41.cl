void A(volatile __local uint* a, uint b, uint c) {
  uint d;

  do {
    d = a[b] & ((1U << (32 - 5)) - 1U);
    d = c | (d + 1);
    a[b] = d;
  } while (a[b] != d);
}

__kernel __attribute__((reqd_work_group_size((6 * 32), 1, 1))) void B(__global const float* a, __global uint* b, int c, uint d) {
  __local uint e[32 * 256];
  __local uint* f = e + (get_local_id(0) >> 5) * 256;
  for (uint g = 0; g < (256 / 32); g++) {
    e[g * (6 * 32) + get_local_id(0)] = 0;
  }

  const uint h = get_local_id(0) << (32 - 5);

  barrier(1);
  for (uint i = get_global_id(0); i < d; i += get_global_size(0)) {
    uint j;
    if (c == -1) {
      j = (uint)__clc_round((a[i * 3] + a[i * 3 + 1] + a[i * 3 + 2]) * 0.333333333f * 255.0f);
    } else {
      j = (uint)__clc_round(a[i * 3 + c] * 255.0f);
    }
    A(f, j, h);
  }

  barrier(1);
  for (uint g = get_local_id(0); g < 256; g += (6 * 32)) {
    uint k = 0;
    for (uint l = 0; l < 6; l++) {
      k += e[g + 256 * l] & ((1U << (32 - 5)) - 1U);
    }
    b[get_group_id(0) * 256 + g] = k;
  }
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void C(__global uint* a, __global uint* b, uint c) {
  __local uint d[256];
  uint e = 0;
  for (uint f = get_local_id(0); f < c; f += 256) {
    e += b[get_group_id(0) + f * 256];
  }
  d[get_local_id(0)] = e;

  for (uint f = 1; f <= 8; f++) {
    barrier(1);
    if (get_local_id(0) < (256 >> f)) {
      d[get_local_id(0)] += d[get_local_id(0) + (256 >> f)];
    }
  }

  if (get_local_id(0) == 0) {
    a[get_group_id(0)] = d[0];
  }
}