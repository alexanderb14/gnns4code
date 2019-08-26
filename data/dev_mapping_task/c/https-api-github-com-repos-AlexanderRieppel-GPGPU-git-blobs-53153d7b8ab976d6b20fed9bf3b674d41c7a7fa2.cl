__kernel void A(__global const long* a, int b) {
  int c = get_global_id(0);
  if (c >= b)
    return;

  long d = a[c];
  int e = 1;
  for (int f = 2; f <= d;) {
    if (d % f == 0) {
      if (e == 1) {
      } else {
        e = 0;
      }
      d = d / f;
    }
    if (d % f != 0)
      f++;
  }
}
__kernel void B(__global long* a, int b) {
  int c = get_global_id(0);
  if (c >= b)
    return;

  for (int d = c + 1; d < b; d++) {
    if (a[c] > a[d]) {
      int e = a[c];
      a[c] = a[d];
      a[d] = e;
    }
  }
}