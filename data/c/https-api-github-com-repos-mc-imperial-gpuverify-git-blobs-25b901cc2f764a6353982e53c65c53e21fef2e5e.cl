__kernel void A(int a) {
  if (get_local_id(0) < 25) {
    while (a + 100 < 102) {
      return;
    }
  }
  return;
}