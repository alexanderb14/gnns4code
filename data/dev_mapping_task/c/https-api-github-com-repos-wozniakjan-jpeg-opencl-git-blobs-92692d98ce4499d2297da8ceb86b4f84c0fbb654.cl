float A(int a); float B(int a, int b, int c, int d); float C(float a); float A(int a) {
  if (a == 0)
    return 0.707106781186547524f;
  else
    return 1;
}

float B(int a, int b, int c, int d) {
  return (A(a) * A(b) * 2 / 8 * cos(a * 3.14159265358979323846264338327950288 / 8 * ((float)c + 0.5f)) * cos(b * 3.14159265358979323846264338327950288 / 8 * ((float)d + 0.5f)));
}

float C(float a) {
  float b = convert_float(convert_int(a));
  float c = a - b;
  if (c < 0.5f && c > -0.5f)
    return b;
  if (c >= 0.5f)
    return b + 1.0f;
  else
    return b - 1.0f;
}

__kernel void D(__global float* a, __global float* b, __global int* c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  if (d < 8 && e < 8) {
    int f = d * 8 + e;
    b[f] = a[0] * B(d, e, 0, 0);
    b[f] += a[1] * B(d, e, 0, 1);
    b[f] += a[2] * B(d, e, 0, 2);
    b[f] += a[3] * B(d, e, 0, 3);
    b[f] += a[4] * B(d, e, 0, 4);
    b[f] += a[5] * B(d, e, 0, 5);
    b[f] += a[6] * B(d, e, 0, 6);
    b[f] += a[7] * B(d, e, 0, 7);
    b[f] += a[8] * B(d, e, 1, 0);
    b[f] += a[9] * B(d, e, 1, 1);
    b[f] += a[10] * B(d, e, 1, 2);
    b[f] += a[11] * B(d, e, 1, 3);
    b[f] += a[12] * B(d, e, 1, 4);
    b[f] += a[13] * B(d, e, 1, 5);
    b[f] += a[14] * B(d, e, 1, 6);
    b[f] += a[15] * B(d, e, 1, 7);
    b[f] += a[16] * B(d, e, 2, 0);
    b[f] += a[17] * B(d, e, 2, 1);
    b[f] += a[18] * B(d, e, 2, 2);
    b[f] += a[19] * B(d, e, 2, 3);
    b[f] += a[20] * B(d, e, 2, 4);
    b[f] += a[21] * B(d, e, 2, 5);
    b[f] += a[22] * B(d, e, 2, 6);
    b[f] += a[23] * B(d, e, 2, 7);
    b[f] += a[24] * B(d, e, 3, 0);
    b[f] += a[25] * B(d, e, 3, 1);
    b[f] += a[26] * B(d, e, 3, 2);
    b[f] += a[27] * B(d, e, 3, 3);
    b[f] += a[28] * B(d, e, 3, 4);
    b[f] += a[29] * B(d, e, 3, 5);
    b[f] += a[30] * B(d, e, 3, 6);
    b[f] += a[31] * B(d, e, 3, 7);
    b[f] += a[32] * B(d, e, 4, 0);
    b[f] += a[33] * B(d, e, 4, 1);
    b[f] += a[34] * B(d, e, 4, 2);
    b[f] += a[35] * B(d, e, 4, 3);
    b[f] += a[36] * B(d, e, 4, 4);
    b[f] += a[37] * B(d, e, 4, 5);
    b[f] += a[38] * B(d, e, 4, 6);
    b[f] += a[39] * B(d, e, 4, 7);
    b[f] += a[40] * B(d, e, 5, 0);
    b[f] += a[41] * B(d, e, 5, 1);
    b[f] += a[42] * B(d, e, 5, 2);
    b[f] += a[43] * B(d, e, 5, 3);
    b[f] += a[44] * B(d, e, 5, 4);
    b[f] += a[45] * B(d, e, 5, 5);
    b[f] += a[46] * B(d, e, 5, 6);
    b[f] += a[47] * B(d, e, 5, 7);
    b[f] += a[48] * B(d, e, 6, 0);
    b[f] += a[49] * B(d, e, 6, 1);
    b[f] += a[50] * B(d, e, 6, 2);
    b[f] += a[51] * B(d, e, 6, 3);
    b[f] += a[52] * B(d, e, 6, 4);
    b[f] += a[53] * B(d, e, 6, 5);
    b[f] += a[54] * B(d, e, 6, 6);
    b[f] += a[55] * B(d, e, 6, 7);
    b[f] += a[56] * B(d, e, 7, 0);
    b[f] += a[57] * B(d, e, 7, 1);
    b[f] += a[58] * B(d, e, 7, 2);
    b[f] += a[59] * B(d, e, 7, 3);
    b[f] += a[60] * B(d, e, 7, 4);
    b[f] += a[61] * B(d, e, 7, 5);
    b[f] += a[62] * B(d, e, 7, 6);
    b[f] += a[63] * B(d, e, 7, 7);
    b[f] = C(b[f] / c[f]) * c[f];
  }
}

__kernel void E(__global float* a, __global float* b) {
  int c = get_global_id(0);
  int d = get_global_id(1);

  if (c < 8 && d < 8) {
    int e = d * 8 + c;
    b[e] = a[0] * B(0, 0, d, c);
    b[e] += a[1] * B(0, 1, d, c);
    b[e] += a[2] * B(0, 2, d, c);
    b[e] += a[3] * B(0, 3, d, c);
    b[e] += a[4] * B(0, 4, d, c);
    b[e] += a[5] * B(0, 5, d, c);
    b[e] += a[6] * B(0, 6, d, c);
    b[e] += a[7] * B(0, 7, d, c);
    b[e] += a[8] * B(1, 0, d, c);
    b[e] += a[9] * B(1, 1, d, c);
    b[e] += a[10] * B(1, 2, d, c);
    b[e] += a[11] * B(1, 3, d, c);
    b[e] += a[12] * B(1, 4, d, c);
    b[e] += a[13] * B(1, 5, d, c);
    b[e] += a[14] * B(1, 6, d, c);
    b[e] += a[15] * B(1, 7, d, c);
    b[e] += a[16] * B(2, 0, d, c);
    b[e] += a[17] * B(2, 1, d, c);
    b[e] += a[18] * B(2, 2, d, c);
    b[e] += a[19] * B(2, 3, d, c);
    b[e] += a[20] * B(2, 4, d, c);
    b[e] += a[21] * B(2, 5, d, c);
    b[e] += a[22] * B(2, 6, d, c);
    b[e] += a[23] * B(2, 7, d, c);
    b[e] += a[24] * B(3, 0, d, c);
    b[e] += a[25] * B(3, 1, d, c);
    b[e] += a[26] * B(3, 2, d, c);
    b[e] += a[27] * B(3, 3, d, c);
    b[e] += a[28] * B(3, 4, d, c);
    b[e] += a[29] * B(3, 5, d, c);
    b[e] += a[30] * B(3, 6, d, c);
    b[e] += a[31] * B(3, 7, d, c);
    b[e] += a[32] * B(4, 0, d, c);
    b[e] += a[33] * B(4, 1, d, c);
    b[e] += a[34] * B(4, 2, d, c);
    b[e] += a[35] * B(4, 3, d, c);
    b[e] += a[36] * B(4, 4, d, c);
    b[e] += a[37] * B(4, 5, d, c);
    b[e] += a[38] * B(4, 6, d, c);
    b[e] += a[39] * B(4, 7, d, c);
    b[e] += a[40] * B(5, 0, d, c);
    b[e] += a[41] * B(5, 1, d, c);
    b[e] += a[42] * B(5, 2, d, c);
    b[e] += a[43] * B(5, 3, d, c);
    b[e] += a[44] * B(5, 4, d, c);
    b[e] += a[45] * B(5, 5, d, c);
    b[e] += a[46] * B(5, 6, d, c);
    b[e] += a[47] * B(5, 7, d, c);
    b[e] += a[48] * B(6, 0, d, c);
    b[e] += a[49] * B(6, 1, d, c);
    b[e] += a[50] * B(6, 2, d, c);
    b[e] += a[51] * B(6, 3, d, c);
    b[e] += a[52] * B(6, 4, d, c);
    b[e] += a[53] * B(6, 5, d, c);
    b[e] += a[54] * B(6, 6, d, c);
    b[e] += a[55] * B(6, 7, d, c);
    b[e] += a[56] * B(7, 0, d, c);
    b[e] += a[57] * B(7, 1, d, c);
    b[e] += a[58] * B(7, 2, d, c);
    b[e] += a[59] * B(7, 3, d, c);
    b[e] += a[60] * B(7, 4, d, c);
    b[e] += a[61] * B(7, 5, d, c);
    b[e] += a[62] * B(7, 6, d, c);
    b[e] += a[63] * B(7, 7, d, c);
  }
}