__kernel void A(__global const float* a, const int b, const int c, __global float* d) {
  int e = 17;
  int f = 8;

  const int g = get_global_id(0) * 8;
  const int h = get_global_id(1) * f;
  const int i = get_global_id(2);

  const int j = (((i * c) + h) * b) + g;

  float8 k[17][9];
  float8 l[8];

  for (int m = 0; m < e; m++) {
    k[m][0] = vload8(0, a + j + b * m);
    k[m][8] = vload8(0, a + j + b * m + 8);
   k[m][1] = (float8)(m][0].s1234, m][0].s567, m][8].s0);
   k[m][2] = (float8)(m][0].s2345, m][0].s67, m][8].s01);
   k[m][3] = (float8)(m][0].s3456, m][0].s7, m][8].s012);
   k[m][4] = (float8)(m][0].s4567, m][8].s0123);
   k[m][5] = (float8)(m][0].s567, m][8].s0123, m][8].s4);
   k[m][6] = (float8)(m][0].s67, m][8].s0123, m][8].s45);
   k[m][7] = (float8)(m][0].s7, m][8].s0123, m][8].s456);
  }

  for (int n = 0; n < f; n++) {
    for (int m = 0; m < 9; m++) {
      for (int o = 0; o < 9; o++) {
        l[n] += k[m + n][o];
      }
    }
    l[n] /= 81;
  }

  for (int n = 0; n < f; n++) {
    vstore8(l[n], 0, d + j + b * n + 4);
  }
}