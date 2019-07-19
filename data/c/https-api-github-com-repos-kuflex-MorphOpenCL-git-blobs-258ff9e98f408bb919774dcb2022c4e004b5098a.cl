__kernel void A(__global float* a, __global float* b) {
  int c = get_global_id(0);
  b[c] = 1.0f / a[c];
}

__kernel void B(__global float* a, __global float* b) {
  int c = get_global_id(0);
  b[c] = a[c] * a[c];
}

__kernel void C(__global float* a, float b, __global float* c) {
  int d = get_global_id(0);
  c[d] = a[d] * b;
}