__kernel void A(__global char* a, __global char* b, unsigned char c, unsigned char d) {
  int e = ((get_global_id(2) - get_global_offset(2)) * get_global_size(1) * get_global_size(0)) + ((get_global_id(1) - get_global_offset(1)) * get_global_size(0)) + (get_global_id(0) - get_global_offset(0));

  b[e] = a[e];

  if (a[e] > c)
    b[e] = d;
  else
    b[e] = 0;
}