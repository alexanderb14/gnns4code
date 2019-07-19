__kernel void A(__global float* a, __global float* b) {
  int c = (int)get_global_id(0);
  double d = 0.12345678912345678 + a[1];
  double e = 0.12355678922345678 + a[0];
  float f = e - d;
  b[c] = f;
}