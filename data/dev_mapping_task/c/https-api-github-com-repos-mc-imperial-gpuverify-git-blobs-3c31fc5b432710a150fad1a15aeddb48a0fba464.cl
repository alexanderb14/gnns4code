__kernel void A(__global int* a) {
  for (int b = 0; b < get_global_id(0); b++) {
    a[b + get_global_id(0)] = get_global_id(0);
    barrier(2);
  }
}