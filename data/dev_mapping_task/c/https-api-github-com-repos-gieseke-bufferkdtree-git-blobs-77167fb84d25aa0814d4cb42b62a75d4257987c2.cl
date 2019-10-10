__kernel void A(int a, __global float* b, __global int* c) {
  int d = get_global_id(0);
  if (d >= a) {
    return;
  }

  b[d] = 3.402823466e+38;
  c[d] = 0;
}

__kernel void B(int a, __global int* b) {
  int c = get_global_id(0);
  if (c >= a) {
    return;
  }

  b[c] = 0;
}

__kernel void C(int a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  if (d >= a) {
    return;
  }

  b[d] = 0;
  c[d] = 0;
}

__kernel void D(int a, __global int* b, int c) {
  int d = get_global_id(0);
  if (d >= a) {
    return;
  }

  b[d] = c;
}