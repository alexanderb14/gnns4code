__kernel void A(__global int* a, __local int* b, int c) {
  int d;
  for (d = 0; d < c; d++)
    b[get_local_id(0) * c + d] = c;
  barrier(1);

  for (d = 0; d < c; d++)
    a[get_global_id(0) * c + d] = b[get_local_id(0) * c + d];
  barrier(1);
}