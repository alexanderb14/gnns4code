__kernel void A(__global int* a, __global int* b, __global int* c, __global int* d) {
  const int e = get_global_id(0);
  if (a[e]) {
    d[c[e]] = b[e];
  }
}

__kernel void B(__global int* a, __global long* b, __global int* c, __global long* d) {
  const int e = get_global_id(0);
  if (a[e]) {
    d[c[e]] = b[e];
  }
}