__kernel void A(__global uint* a, __global uint* b, __local uint* c) {
  unsigned int d = get_local_id(0);
  unsigned int e = get_group_id(0);
  unsigned int f = get_global_id(0);

  unsigned int g = get_local_size(0);
  unsigned int h = f * 2;
  c[d] = a[h] + a[h + 1];

  barrier(0);
  for (unsigned int i = g >> 1; i > 0; i >>= 1) {
    if (d < i) {
      c[d] += c[d + i];
    }
    barrier(0);
  }

  if (d == 0)
    b[e] = c[0];
}