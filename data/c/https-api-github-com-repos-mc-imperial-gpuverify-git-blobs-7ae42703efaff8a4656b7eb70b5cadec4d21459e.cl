__kernel void A(__local int* a) {
  int b = get_local_id(0);

  a[b] = 0;

  for (int c = 0; c < 100; c++) {
    a[b]++;
  }
}