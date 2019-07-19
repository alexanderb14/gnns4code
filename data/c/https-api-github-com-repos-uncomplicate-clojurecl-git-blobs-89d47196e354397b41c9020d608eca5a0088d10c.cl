__kernel void A(__global float* a, __local int* b, int c) {
  int d = get_global_id(0);
  a[d] = a[d] + (float)d + 2.0f * c;
}