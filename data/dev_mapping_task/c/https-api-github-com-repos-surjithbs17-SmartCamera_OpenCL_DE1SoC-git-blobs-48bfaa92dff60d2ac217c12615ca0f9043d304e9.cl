__kernel void A(global unsigned int* restrict a, global unsigned int* restrict b) {
  int c = get_global_id(0);
  int d = get_global_id(1);
  int e = get_global_size(0);
  int f = get_global_size(1);
  int g = c + d * e;
  long int h = e * f;

  int i[3][3] = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};
  int j[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
  int k = 0, l = 0, m = 0;
  int n = 0, o = 0;
  if (g < h && (c > 1 && d > 1) && (c < (e - 1) && d < (f - 1))) {
    for (n = 0; n < 3; n++) {
      for (o = 0; o < 3; o++) {
        l += (j[n][o]) * a[(c + o - 1) + (e * (d + n - 1))];
        k += (i[n][o]) * a[(c + o - 1) + (e * (d + n - 1))];
      }
    }

    m = abs(k) + abs(l);

    if (m > 255)
      b[g] = 255;
    else
      b[g] = m;
  }
}