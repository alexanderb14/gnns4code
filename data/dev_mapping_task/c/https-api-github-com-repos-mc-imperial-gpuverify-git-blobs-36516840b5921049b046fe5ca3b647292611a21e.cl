int A(__local int* a) {
  return a[get_local_id(0)];
}

__kernel void B(__local int* a) {
  for (int b = 0; b < 100; b++) {
    A(a);
  }

  a[get_local_id(0) + 1] = get_local_id(0);
}