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

__kernel void B(const uint a, __global int* b, __global int* c, __global int* d) {
  const uint e = get_group_id(0) * 8 * 8;
  const uint f = get_local_id(0);
  __local int g[8];
  int h = 0;
  for (uint i = 0; i < 8; i++) {
    if (e + f + i * 8 < a) {
      h = h + ((c[e + f + i * 8]) * (d[e + f + i * 8]));
    }
  }
  g[f] = h;
  for (int i = 1; i < 8; i <<= 1) {
    barrier(1);
    uint j = (i << 1) - 1;
    if ((f & j) == 0) {
      g[f] += g[f + i];
    }
  }
  if (f == 0) {
    b[get_group_id(0)] = g[0];
  }
}