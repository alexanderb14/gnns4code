__constant float Ga[3][3] = {{0.0625, 0.125, 0.0625}, {0.1250, 0.250, 0.1250}, {0.0625, 0.125, 0.0625}};

__kernel void A(__global uchar* a, __global uchar* b, uint c, uint d) {
  int e = 0;
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);
  size_t h = f * d + g;

  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++) {
      e += Ga[i][j] * a[(i + f + -1) * d + (j + g + -1)];
    }

  b[h] = min(255, max(0, e));
}