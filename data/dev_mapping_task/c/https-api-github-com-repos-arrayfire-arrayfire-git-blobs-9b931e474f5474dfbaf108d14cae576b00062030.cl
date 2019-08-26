__kernel void A(__global uint* a, __global uint* b, ulong c) {
  int d = get_local_id(0);
  int e = get_local_size(0);
  int f = get_group_id(0);
  __local uint g[351];
  const __global uint* h = b + (16 * f);
  uint i = h[4] ^ (h[8] << 16);
  uint j = i;
  j += j >> 16;
  j += j >> 8;
  j &= 0xff;
  j |= j << 8;
  j |= j << 16;

  for (int k = d; k < 351; k += e) {
    g[k] = j;
  }
  barrier(1);

  if (d == 0) {
    g[0] = c;
    g[1] = i;
    for (int l = 1; l < 351; ++l) {
      g[l] ^= (uint)(1812433253) * (g[l - 1] ^ (g[l - 1] >> 30)) + l;
    }
  }
  barrier(1);

  for (int k = d; k < 351; k += e) {
    a[351 * f + k] = g[k];
  }
}