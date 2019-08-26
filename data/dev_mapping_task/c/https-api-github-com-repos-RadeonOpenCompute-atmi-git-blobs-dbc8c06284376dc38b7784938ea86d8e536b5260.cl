__kernel void A(__global const char* a, __global char* b, size_t c) {
  int d = get_global_id(0);
  if (d < c)
    b[d] = a[d] + 1;
}