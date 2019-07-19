__kernel void A(int a) {
  while (a + 100 < 102) {
    if (get_local_id(0) < 5) {
      a = 2;
      break;
    }
  }
}