__constant unsigned char Ga[16][3] = {
    {25, 7, 26}, {9, 1, 47}, {4, 4, 73}, {0, 7, 100}, {12, 44, 138}, {24, 82, 177}, {57, 125, 209}, {134, 181, 229}, {211, 236, 248}, {241, 233, 191}, {248, 201, 95}, {255, 170, 0}, {204, 128, 0}, {153, 87, 0}, {106, 52, 3}, {66, 30, 15},
};

void A(__global unsigned char* a, double b, int c) {
  if (b >= c) {
    a[0] = 0;
    a[1] = 0;
    a[2] = 0;
    return;
  }

  b /= 6;

  int d = (int)b % 16;
  int e = (d + 1) % 16;
  double f = b - (double)(int)b;

  a[0] = f * (Ga[e][0] - Ga[d][0]) + Ga[d][0];
  a[1] = f * (Ga[e][1] - Ga[d][1]) + Ga[d][1];
  a[2] = f * (Ga[e][2] - Ga[d][2]) + Ga[d][2];
}

__kernel void B(__global unsigned char* a, int b, double c, double d, double e, int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);
  double i = ((double)g / (double)b * e) + (c - e / 2);
  double j = ((double)h / (double)b * e) + (d - e / 2);
  double k = i;
  double l = j;
  int m = 0;

  while (i * i + j * j < (2 * 2) && m < f) {
    double n = i * i - j * j + k;
    j = 2 * i * j + l;
    i = n;
    m++;
  }

  double o = m;
  if (m < f)
    o = m + 1 - log(log(sqrt(i * i + j * j))) / 0x1.62e42fefa39efp-1;

  A(&a[(h * b + g) * 3], o, f);
}