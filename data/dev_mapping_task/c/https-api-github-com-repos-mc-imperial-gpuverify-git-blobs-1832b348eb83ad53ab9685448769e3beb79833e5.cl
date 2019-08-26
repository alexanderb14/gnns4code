__kernel void A(__local int* a) {
  int b = 0;
  for (int c = 0; c < 100; c++) {
    b += a[c];
    b += a[c + 1];
  }

  a[get_local_id(0)] = b;
}