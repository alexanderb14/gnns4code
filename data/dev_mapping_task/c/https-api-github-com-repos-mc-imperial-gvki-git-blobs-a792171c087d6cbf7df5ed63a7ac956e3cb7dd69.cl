__kernel void A(__global int* restrict a, __global int* restrict b, __private int c) {
  size_t d = get_global_id(0);

  for (int e = 0; e < c; ++e) {
    if (d >= (1 << e)) {
      b[d] = a[d - (1 << e)] + a[d];
    } else {
      b[d] = a[d];
    }
    barrier(2);

    __global int* f = a;
    a = b;
    b = f;
  }
}