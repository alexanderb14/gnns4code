__kernel void A(__local int* a) {
  for (int b = 0; b < get_local_size(0) * 10; b += get_local_size(0)) {
    for (int c = b; c < get_local_size(0) * 10; c += get_local_size(0)) {
      a[c + get_local_id(0)] = get_local_id(0);
    }
  }
}