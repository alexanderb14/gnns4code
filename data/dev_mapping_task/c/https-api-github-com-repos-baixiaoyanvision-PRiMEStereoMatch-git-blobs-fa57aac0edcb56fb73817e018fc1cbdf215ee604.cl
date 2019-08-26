__kernel void A(__global const float* a, const int b, const int c, __global float* d) {
  int e = 9;
  int f = 1;

  const int g = get_global_id(0) * 16;
  const int h = get_global_id(1) * f;
  const int i = get_global_id(2);

  const int j = (((i * c) + h) * b) + g;

  float16 k[9][9];
  float16 l[1];

  for (int m = 0; m < e; m++) {
    k[m][0] = vload16(0, a + j + b * m);
    k[m][8] = vload16(0, a + j + b * m + 8);
   k[m][1] = (float16)(m][0].s12345678, m][8].s12345678);
   k[m][2] = (float16)(m][0].s23456789, m][8].s23456789);
   k[m][3] = (float16)(m][0].s3456789a, m][8].s3456789a);
   k[m][4] = (float16)(m][0].s456789ab, m][8].s456789ab);
   k[m][5] = (float16)(m][0].s56789abc, m][8].s56789abc);
   k[m][6] = (float16)(m][0].s6789abcd, m][8].s6789abcd);
   k[m][7] = (float16)(m][0].s789abcde, m][8].s789abcde);
  }

  for (int m = 0; m < 9; m++) {
    for (int n = 0; n < 9; n++) {
      for (int o = 0; o < f; o++) {
        l[o] += k[m + o][n];
      }
    }
  }

  for (int o = 0; o < f; o++) {
    l[o] /= 81;
    vstore16(l[o], 0, d + j + b * o + 4);
  }
}