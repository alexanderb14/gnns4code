__kernel void A(__local int* a, __local int* b, __local int* c) {
  for (int d = get_local_id(0); d < 1024; d += get_local_size(0)) {
    a[d] = get_local_id(0);

    b[d + 10] = get_local_id(0);

    int e = d + 20;

    c[e] = get_local_id(0);
  }
}