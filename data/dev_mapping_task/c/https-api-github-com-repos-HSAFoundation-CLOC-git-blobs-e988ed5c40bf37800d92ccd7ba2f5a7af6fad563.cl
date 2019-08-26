float A(float a); float B(float a); float C(float a); __kernel void D(__global float* a, __global const float* b) {
  int c = get_global_id(0);
  a[c] = A(b[c]);
}