__kernel void A(__global int* a, __global int* b, int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  atomic_add(a, 1);

  for (int f = 0; f < 100000; f++) {
    ;
  }

  b[e * c + d] = a[0];
}