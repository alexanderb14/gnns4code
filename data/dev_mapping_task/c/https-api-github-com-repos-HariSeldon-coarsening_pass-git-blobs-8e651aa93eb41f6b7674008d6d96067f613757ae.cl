__kernel void A(__global uint4* a, __global uint4* b, __local uint4* c) {
  unsigned int d = get_local_id(0);
  unsigned int e = get_group_id(0);
  unsigned int f = get_global_id(0);

  unsigned int g = get_local_size(0);
  unsigned int h = f * 2;
  c[d] = a[h] + a[h + 1];

  barrier(1);

  for (unsigned int i = g >> 1; i > 0; i >>= 1) {
    if (d < i) {
      c[d] += c[d + i];
    }
    barrier(1);
  }

  if (d == 0)
    b[e] = c[0];
}