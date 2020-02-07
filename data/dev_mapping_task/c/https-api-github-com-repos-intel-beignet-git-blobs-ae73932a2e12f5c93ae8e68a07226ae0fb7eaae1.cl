__kernel void A(__global int* a, __global int* b) {
  int c[16];
  int d[16];
  for (int e = 0; e < 16; ++e)
    d[e] = e;
  for (int e = 0; e < 16; ++e)
    c[e] = e + 1;
  if (get_global_id(0) == 15)
    b[get_global_id(0)] = c[get_global_id(0)];
  else
    b[get_global_id(0)] = d[15 - get_global_id(0)];
}