kernel void A(global float* a) {
  a[8] = (a[0] * a[0] + a[0]) / a[1] + 1;
  ;
  a[9] = (a[2] * a[2] + a[2]) / a[3] + 1;
  ;
  a[10] = (a[4] * a[4] + a[4]) / a[5] + 1;
  ;
  a[11] = (a[6] * a[6] + a[6]) / a[7] + 1;
  ;
}