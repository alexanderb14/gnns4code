__kernel void A(__global float* a, __global float* b, const unsigned int c) {
  int d = get_global_id(0);

  float e = a[d];
  float f = e * e - c;

  barrier(1);

  b[d] = f;
}