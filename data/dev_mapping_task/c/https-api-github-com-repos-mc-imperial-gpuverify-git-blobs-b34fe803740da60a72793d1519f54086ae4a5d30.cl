__kernel void A(global int* a, int b) {
  if (get_global_id(0) == 0 && get_global_id(1) == 1 && get_global_id(2) == 2) {
    a[get_global_id(0)] = get_global_id(1);
  }
  if (get_global_id(0) == 8 && get_global_id(1) == 13 && get_global_id(2) == 21) {
    a[b] = get_global_id(1);
  }
}