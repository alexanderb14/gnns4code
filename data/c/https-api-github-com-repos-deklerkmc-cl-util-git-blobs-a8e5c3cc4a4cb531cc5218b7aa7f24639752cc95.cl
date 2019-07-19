__kernel void A(__global uchar* a, __global uint* b, int c, uchar d) {
  int e = get_global_id(0);

  if (e > c - 1)
    return;

  a[b[e]] = d;
}