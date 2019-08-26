__kernel void A(__global double4* a, __global double4* b, int c, __local double* d) {
  int e = get_global_id(1);
  int f = get_global_id(0);
  int g = get_local_id(0);
  int h = get_local_id(1);

  int i = get_global_size(0) + c / 4;
  int j = c % 4;

  if (get_local_id(0) == 0) {
    (j == 0) ? (d[h] = b[e * i + c / 4].s0 / b[c * i + c / 4].s0) : 1;
    (j == 1) ? (d[h] = b[e * i + c / 4].s1 / b[c * i + c / 4].s1) : 1;
    (j == 2) ? (d[h] = b[e * i + c / 4].s2 / b[c * i + c / 4].s2) : 1;
    (j == 3) ? (d[h] = b[e * i + c / 4].s3 / b[c * i + c / 4].s3) : 1;
  }

  barrier(1);

  if (e >= c + 1 && ((f + 1) * 4) > c) {
    double4 k;

    {
      k.s0 = b[e * i + f].s0 - d[h] * b[c * i + f].s0;
      k.s1 = b[e * i + f].s1 - d[h] * b[c * i + f].s1;
      k.s2 = b[e * i + f].s2 - d[h] * b[c * i + f].s2;
      k.s3 = b[e * i + f].s3 - d[h] * b[c * i + f].s3;
    }

    if (f == c / 4) {
      (j == 0) ? (a[e * i + f].s0 = d[h]) : (b[e * i + f].s0 = k.s0);
      (j == 1) ? (a[e * i + f].s1 = d[h]) : (b[e * i + f].s1 = k.s1);
      (j == 2) ? (a[e * i + f].s2 = d[h]) : (b[e * i + f].s2 = k.s2);
      (j == 3) ? (a[e * i + f].s3 = d[h]) : (b[e * i + f].s3 = k.s3);
    } else {
      b[e * i + f].s0 = k.s0;
      b[e * i + f].s1 = k.s1;
      b[e * i + f].s2 = k.s2;
      b[e * i + f].s3 = k.s3;
    }
  }
}
__kernel void B(__global double* a, __global double* b) {
  int c = get_global_id(1);
  int d = get_global_id(0);
  int e = get_group_id(0);
  int f = get_group_id(1);
  int g = get_global_size(0);
  if (c > d) {
    int g = get_global_size(0);
    b[c * g + d] = a[c * g + d];
  }
}