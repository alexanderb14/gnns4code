__kernel void A(__global int* a, const uint b, const uint c, __global int* d, const uint e) {
  const uint f = get_group_id(0) * 8 * 8;
  __global const int* g = a + b + f;
  const uint h = get_local_id(0);
  __local int i[8];
  int j = 0;
  for (uint k = 0; k < 8; k++) {
    if (f + h + k * 8 < c) {
      j = j + g[h + k * 8];
    }
  }

  i[h] = j;

  for (int k = 1; k < 8; k <<= 1) {
    barrier(1);
    uint l = (k << 1) - 1;
    if ((h & l) == 0) {
      i[h] += i[h + k];
    }
  }

  if (h == 0) {
    d[e + get_group_id(0)] = i[0];
  }
}

__kernel void B(int a, uint b, __global int* c) {
  int d = a;
  for (uint e = 0; e < b; e++)
    d = ((d) + ((0 + e)));
  c[0] = d;
}