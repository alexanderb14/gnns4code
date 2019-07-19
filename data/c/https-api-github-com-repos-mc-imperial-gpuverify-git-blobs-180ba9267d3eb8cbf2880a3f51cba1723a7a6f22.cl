int A(__local int* a) {
  return a[get_local_id(0)];
}

__kernel void B(__local int* a) {
  A(a);
  a[get_local_id(0) + 1] = get_local_id(0);
}