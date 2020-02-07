__kernel void A(__global char* a, __global char* b, __global char* c) {
  int d = ((get_global_id(2) - get_global_offset(2)) * get_global_size(1) * get_global_size(0)) + ((get_global_id(1) - get_global_offset(1)) * get_global_size(0)) + (get_global_id(0) - get_global_offset(0));

  unsigned char e = a[d];
  unsigned char f = b[d];
  unsigned char g = e | f;
  c[d] = g;
}