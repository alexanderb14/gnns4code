kernel void A(local int* a, int b) {
  if (b == 3) {
    a[get_local_id(0)] = 3;
  } else {
    a[0] = get_local_id(0);
  }
}