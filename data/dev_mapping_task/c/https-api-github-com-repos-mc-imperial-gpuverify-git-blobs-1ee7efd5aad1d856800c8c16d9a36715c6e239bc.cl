__kernel void A(__local int* a) {
  volatile int b, c;

  b = get_local_id(0) == 0 ? 1 : 0;

  if (get_local_id(0) == 0) {
    c = a[0];
  }

  barrier(b);

  if (get_local_id(0) == 1) {
    a[0] = 0;
  }
}