__kernel void A(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);

  c[d] = a[d] + b[d];
}

__kernel void B(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);
  d = 0;
}

__kernel void C(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);
  c[d] = dot(__builtin_astype(a[d], float), __builtin_astype(b[0], float));
  c[d] = b[2];
}