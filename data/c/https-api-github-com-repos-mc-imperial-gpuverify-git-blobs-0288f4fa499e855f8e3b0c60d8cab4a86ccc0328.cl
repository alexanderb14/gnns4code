void A(__local float* a) {
  int b = get_local_id(0);
  while (b < 1024) {
    a[b] = 0;
    b += get_local_size(0);
  }
}

__kernel void B() {
}