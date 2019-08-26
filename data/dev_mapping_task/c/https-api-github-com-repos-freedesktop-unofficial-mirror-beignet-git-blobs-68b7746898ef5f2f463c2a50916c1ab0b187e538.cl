__constant float Ga[] = {1, 2, 3};
constant float Gb[] = {4, 5, 6};
__kernel void A(__global float* a, global float* b) {
  __local float c[4];
  local float d[4];
  __private float e[4];
 private
  float f[4];
}