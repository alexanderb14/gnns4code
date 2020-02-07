__kernel void A(__global int* a, const int b) {
  int c = get_global_id(0);

  uint d = 1;
  uint e = b / 2;

  while (e > 0) {
    if (c % (d * 2) == 0) {
      a[c] = a[c] + a[c + d];
    }

    d = d * 2;
    e = e / 2;

    barrier(1);
  }
}