__kernel void A(__global char* a, __global char* b, __global int* c) {
  int d = get_global_id(0);

  if (a[d] < b[d])
    c[d] = d + 1;
  else if (a[d] > b[d])
    c[d] = -(d + 1);
  else
    c[d] = 0;
}