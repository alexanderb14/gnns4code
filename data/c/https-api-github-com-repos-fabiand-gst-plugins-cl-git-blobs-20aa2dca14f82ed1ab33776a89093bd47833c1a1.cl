__kernel void A(__global uchar* a, __global const uchar* b, const uint c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  a[d] = b[d];
}

__kernel void B(__global uchar* a, __global const uchar* b, const uint c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  a[d] = clamp(b[d] - 10, 0, 255);
}