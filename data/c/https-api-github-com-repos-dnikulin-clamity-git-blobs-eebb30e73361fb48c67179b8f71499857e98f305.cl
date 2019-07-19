__kernel void A(__global uint* a, uint b) {
  a[get_global_id(0)] <<= b;
}

__kernel void B(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);
  a[d] = b[d] + c[d];
}

__kernel void C(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);
  a[d] = b[d] * c[d];
}

__kernel void D(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);
  a[d] = a[d] + (b[d] * c[d]);
}

__kernel void E(__global float* a, __global float* b, __global float* c) {
  unsigned int d = 0;
  unsigned int e = 65535;
  for (d = 0; d < e; d++)
    D(a, b, c);
}