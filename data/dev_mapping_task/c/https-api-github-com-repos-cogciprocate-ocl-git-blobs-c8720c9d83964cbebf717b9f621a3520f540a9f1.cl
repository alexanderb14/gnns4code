__kernel void A(__private float a, __global float* b, __global float* c) {
  uint const d = get_global_id(0);
  c[d] = b[d] * a;
}

__kernel void B(__global float* a) {
  int b = get_global_id(0);
  a[b] = (b % 6) / 3 + (b % 2) * (b / 6);
  a[b] /= 3;
}