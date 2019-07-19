__kernel void A(__global unsigned int* a, __global unsigned int* b) {
  int c = (int)get_global_id(0);
  b[c] = lgamma((float)a[c]);
  b[c] = a[c];
}