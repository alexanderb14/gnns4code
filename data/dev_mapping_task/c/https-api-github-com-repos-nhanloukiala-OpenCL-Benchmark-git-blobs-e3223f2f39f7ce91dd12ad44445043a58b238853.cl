__kernel void A(__global uint* a, __global uint* b, __local uint* c) {
  unsigned int d = get_local_id(0);
  unsigned int e = get_group_id(0);
  unsigned int f = get_global_id(0);
  unsigned int g = get_local_size(0);

  unsigned int h = e * (256 * 2) + d;
  c[d] = a[h] + a[h + 256];

  barrier(1);
  for (unsigned int i = 256 / 2; i > 64; i >>= 1) {
    if (d < i) {
      c[d] += c[d + i];
    }
    barrier(1);
  }

  if (d < 64) {
    if (g >= 128)
      c[d] += c[d + 64];
    if (g >= 64)
      c[d] += c[d + 32];
    if (g >= 32)
      c[d] += c[d + 16];
    if (g >= 16)
      c[d] += c[d + 8];
    if (g >= 8)
      c[d] += c[d + 4];
    if (g >= 4)
      c[d] += c[d + 2];
    if (g >= 2)
      c[d] += c[d + 1];
  }

  if (d == 0)
    b[e] = c[0];
}