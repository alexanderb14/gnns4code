__kernel void A(__global float* const restrict a, __global const float* const restrict b, __global const float* const restrict c) {
  const size_t d = get_global_id(0);
  a[d] = b[d] + c[d];
}

__kernel void B(__global float* const restrict a, __global const float* const restrict b, __global const float* const restrict c, __global const float* const restrict d) {
  const size_t e = get_global_id(0);
  a[e] = b[e] * c[e] + d[e];
}

__kernel void C(__global float* const restrict a, __global const float* const restrict b) {
  __local float c[128];
  const size_t d = get_global_id(0);
  const size_t e = get_local_id(0);

  c[e] = b[d];
  a[d] = c[e] + c[(e + 1) % 128];
}