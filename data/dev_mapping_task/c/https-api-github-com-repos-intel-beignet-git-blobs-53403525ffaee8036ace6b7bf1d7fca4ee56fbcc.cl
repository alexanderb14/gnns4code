__kernel void A(__constant int* a, __constant char* b, __global int* c, int d) {
  int e = (int)get_global_id(0);
  c[e] = d + a[e % 69] + b[0];
}