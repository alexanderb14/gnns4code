__attribute__((intel_reqd_sub_group_size(8))) __kernel void A(__global unsigned int* a, __global unsigned int* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
}