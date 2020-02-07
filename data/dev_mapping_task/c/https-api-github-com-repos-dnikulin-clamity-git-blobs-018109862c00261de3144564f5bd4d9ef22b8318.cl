__kernel void A(__global uint* a, __global const uint* b, __global const uint* c) {
  size_t d = get_global_id(0);
  a[d] = b[d] + c[d];
}

__kernel void B(__global uint* a, __global const uint* b, __global const uint* c) {
  size_t d = get_global_id(0);
  a[d] = b[d] & c[d];
}