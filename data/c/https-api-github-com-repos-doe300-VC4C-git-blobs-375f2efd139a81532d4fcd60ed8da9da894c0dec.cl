__kernel void A(__global int* a, __global int* b, const uint c) {
  uint d = get_local_id(0) + (32 * get_group_id(0));
  for (uint e = 0; e < 4; e++) {
    if (d < c) {
      a[d] = b[d];
      d += 8;
    }
  }
}