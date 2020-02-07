__kernel void A(__global uint const* const a, __private uint const b, __global uint* const c) {
  uint const d = get_global_id(0);

  c[d] = a[d] + b;
}

__kernel void B(__global float const* const a, __private float const b, __global float* const c) {
  uint const d = get_global_id(0);

  c[d] = a[d] * b;
}