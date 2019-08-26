__kernel void A(__global unsigned char* a, __global unsigned int* b) {
  int c = get_global_id(0);
  __global unsigned int* d = (__global unsigned int*)a;

  b[c] = d[c];
}