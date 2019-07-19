__kernel void A(__global float* a, __global float* b, const int c, const int d) {
  const int e = get_global_id(0);

  if (e < d * c) {
    a[e] += b[e];
  }
}

__kernel void B(__global float* a, __global float* b, const int c, const int d) {
  const int e = get_global_id(0);

  if (e < d * c) {
    a[e] += b[e];
  }
}