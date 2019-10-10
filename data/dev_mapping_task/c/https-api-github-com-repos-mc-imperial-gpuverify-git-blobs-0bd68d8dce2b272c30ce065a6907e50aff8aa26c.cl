__kernel void A(__local int* a) {
  for (int b = get_local_size(0) / 2; b > 0; b >>= 1) {
    barrier(1);
    if (get_local_id(0) < b) {
      a[get_local_id(0)] += a[get_local_id(0) + b];
    }
  }

  if (get_local_id(0) == 0) {
    a[0] = get_local_id(0);
  }
}