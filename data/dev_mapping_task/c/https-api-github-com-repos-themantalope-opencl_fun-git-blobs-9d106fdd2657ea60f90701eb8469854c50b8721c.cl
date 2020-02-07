__kernel void A(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  c[d] = a[d] * a[d] + b[d] * b[d];
}

__kernel void B(__global float* a, __global float* b, const int c, const int d, const int e) {
  __global float* f = &a[c * e];
  for (int g = 0; g < e; g++) {
    b[g] = f[g];
  }
}