__kernel void A(__local int* a) {
  int b;
  int c = 1;
  while (c < get_local_size(0)) {
    if (c < get_local_id(0))
      b = a[get_local_id(0) - c];
    barrier(1);
    if (c < get_local_id(0))
      a[get_local_id(0)] = a[get_local_id(0)] + b;
    c = c * 2;
  }
}