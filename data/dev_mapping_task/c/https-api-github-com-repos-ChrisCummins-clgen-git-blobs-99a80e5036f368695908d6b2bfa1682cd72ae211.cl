__kernel void A(__global int* a) {
  int b = get_global_id(0);
  while (1)
    a[b] += 1;
}