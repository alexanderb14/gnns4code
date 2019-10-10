__kernel void A(__local int* a) {
  int b = 0;
  for (int c = 0; c < 10; c++, b += get_local_size(0)) {
    a[b + get_local_id(0)] = get_local_id(0);
  }
}