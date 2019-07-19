kernel void A(global int* a) {
  int b = get_global_id(0);
  if (b == 0) {
    *a = 0;
  } else {
    atomic_cmpxchg(a, 0, 0x01000001);
  }
}