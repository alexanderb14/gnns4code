void A(int); __kernel void B(__local int* a) {
  a[get_local_id(0)] = 0;
  A(a[get_local_id(0) + 1]);
}