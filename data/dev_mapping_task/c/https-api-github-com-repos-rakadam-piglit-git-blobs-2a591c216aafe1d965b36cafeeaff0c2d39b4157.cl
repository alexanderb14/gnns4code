kernel void A(global float* a) {
  a[3] = a[0] < 0.0f;
  a[4] = a[1] < 0.0f;
  a[5] = a[2] < 0.0f;
  a[6] = a[0] > 0.0f;
  a[7] = a[1] > 0.0f;
  a[8] = a[2] > 0.0f;
  a[9] = a[0] <= 0.0f;
  a[10] = a[1] <= 0.0f;
  a[11] = a[2] <= 0.0f;
  a[12] = a[0] >= 0.0f;
  a[13] = a[1] >= 0.0f;
  a[14] = a[2] >= 0.0f;

  a[15] = ((int)a[0]) < 0;
  a[16] = ((int)a[1]) < 0;
  a[17] = ((int)a[2]) < 0;
  a[18] = ((int)a[0]) > 0;
  a[19] = ((int)a[1]) > 0;
  a[20] = ((int)a[2]) > 0;
  a[21] = ((int)a[0]) <= 0;
  a[22] = ((int)a[1]) <= 0;
  a[23] = ((int)a[2]) <= 0;
  a[24] = ((int)a[0]) >= 0;
  a[25] = ((int)a[1]) >= 0;
  a[26] = ((int)a[2]) >= 0;
}