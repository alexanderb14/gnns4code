kernel void A(global int* a, int b) {
  int c;
  int d = 0;
  for (c = b - 1; c >= 0; c--) {
    a[d] = c;
    d = d + 1;
  }
}

kernel void B(global int* a, int b) {
  int c;
  int d = 0;
  for (c = b - 1; c > -1; c--) {
    a[d] = c;
    d = d + 1;
  }
}

kernel void C(global int* a, int b) {
  int c;
  int d = 0;
  for (c = 0; c <= (b - 1); c++) {
    a[d] = c;
    d = d + 1;
  }
}

kernel void D(global int* a, int b) {
  int c;
  int d = 0;
  for (c = 0; c < b; c++) {
    a[d] = c;
    d = d + 1;
  }
}