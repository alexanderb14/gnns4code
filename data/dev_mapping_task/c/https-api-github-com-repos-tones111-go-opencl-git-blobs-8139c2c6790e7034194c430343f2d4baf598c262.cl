__kernel void A(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}

__kernel void B(__global uchar* a, __global uchar* b) {
  size_t c = get_global_id(0);
  b[c] = a[c] * a[c];
}