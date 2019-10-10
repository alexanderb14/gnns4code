__kernel void A(__global const float* a, const int b, const int c, __global float* d) {
  const int e = get_global_id(0) * 8;
  const int f = get_global_id(1);
  const int g = get_global_id(2);

  const int h = (((g * c) + f) * b) + e;

  int i = 9;
  int j = 1;
  float8 k[9][9];
  float8 l[1];

  for (int m = 0; m < i; m++) {
    k[m][0] = vload8(0, a + h + b * m);
    k[m][8] = vload8(0, a + h + b * m + 8);
   k[m][1] = (float8)(m][0].s1234, m][0].s567, m][8].s0);
   k[m][2] = (float8)(m][0].s2345, m][0].s67, m][8].s01);
   k[m][3] = (float8)(m][0].s3456, m][0].s7, m][8].s012);
   k[m][4] = (float8)(m][0].s4567, m][8].s0123);
   k[m][5] = (float8)(m][0].s567, m][8].s0123, m][8].s4);
   k[m][6] = (float8)(m][0].s67, m][8].s0123, m][8].s45);
   k[m][7] = (float8)(m][0].s7, m][8].s0123, m][8].s456);
  }

  for (int m = 0; m < 9; m++) {
    for (int n = 0; n < 9; n++) {
      for (int o = 0; o < j; o++) {
        l[o] += k[m + o][n];
      }
    }
  }

  for (int o = 0; o < j; o++) {
    l[o] /= 81;
    vstore8(l[o], 0, d + h + b * o + 4);
  }
}