__kernel void A(global int* a, int b) {
  if (get_global_id(0) == 0) {
    a[get_global_id(0)] = get_global_id(1);
  }
  if (get_global_id(0) == 7) {
    a[b] = 45;
  }
}