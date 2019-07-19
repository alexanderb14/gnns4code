__kernel void A(__global float* a, __global float* b, int c) {
  size_t d = get_global_id(0);

  for (unsigned int e = 0; e < c; ++e) {
    b[d * c + e] = a[d * c + e];
  }
}

__kernel void B(__global float* a, __global float* b, int c) {
  size_t d = get_global_id(0);

  for (unsigned int e = 0; e < c; ++e) {
    b[e * c + d] = a[e * c + d];
  }
}