kernel void A(global float* a) {
  if (a[0] < 0) {
    a[2] = 1;
  } else {
    a[3] = 2;
  }

  if (a[1] < 0) {
    a[4] = 1;
  } else {
    a[5] = 2;
  }
}