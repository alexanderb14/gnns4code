__kernel void A(__global float* a, __global float* b) {
  uint c = get_global_id(0);
  b[c] = tanh(a[c]);
}
__kernel void B(__global float* a, __global float* b, __global float* c) {
  uint d = get_global_id(0);
  const float e = b[d];
  const float f = c[d];
  a[d] = f * (1.0 - (e * e));
}

__kernel void C(__global float* a, __global float* b) {
  uint c = get_global_id(0);
  b[c] = 1.0f / (1.0f + exp(-a[c]));
}

__kernel void D(__global float* a, __global float* b, __global float* c) {
  uint d = get_global_id(0);
  const float e = b[d];
  const float f = c[d];
  a[d] = f * e * (1.0 - e);
}