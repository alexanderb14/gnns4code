int A(__local float* a) {
  if (get_local_id(0) != 0) {
    return 0;
  }

  a[4] = 26.8f;

  return 1;
}

__kernel void B(__local float* a) {
  int b = A(a);
}