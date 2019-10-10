__kernel void A(__local int* a) {
  volatile int b, c;

  b = get_local_id(0) == 0 ? 0 : 1;

  if (get_local_id(0) == 0) {
    a[0] = get_local_id(0);
  }

  barrier(b);

  if (get_local_id(0) == 1) {
    c = a[0];
  }
}