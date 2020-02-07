kernel void A(global int* a) {
  int b = get_global_id(0);
  if (b == 0) {
    a[0] = 42;
    barrier(2);
  } else {
    barrier(2);
    a[b] = b + a[0];
  }
}