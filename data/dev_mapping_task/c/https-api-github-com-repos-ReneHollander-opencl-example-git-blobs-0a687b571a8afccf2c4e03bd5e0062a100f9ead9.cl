__kernel void A(__global char* a, __global char* b) {
  int c = get_global_id(0);
  b[c] = a[c] + 1;
}