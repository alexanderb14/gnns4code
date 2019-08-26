__kernel void A() {
  int a = get_local_id(0);
  if (a == 0) {
    barrier(1);
  } else {
    barrier(1);
  }
}