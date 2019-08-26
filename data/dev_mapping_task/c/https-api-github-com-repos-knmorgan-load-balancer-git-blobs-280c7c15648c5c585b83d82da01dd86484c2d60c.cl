__kernel void A(__global unsigned char* a, __global unsigned char* b, __global unsigned char* c, const unsigned long d) {
  unsigned int e = get_global_id(0);
  if (e < d) {
    c[e] = a[e] + b[e];
  }
}