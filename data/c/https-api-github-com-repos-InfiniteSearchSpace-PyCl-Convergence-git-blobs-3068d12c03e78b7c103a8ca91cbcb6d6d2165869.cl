__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  unsigned int h = 0;
  unsigned int i = a * a;

  int j = 0;
  int k = 0;

  j = -20;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }
  int l = 0;

  if (g >= 188 && g <= 289) {
    l = 1;
  }
  if (g >= 124 && g <= 146) {
    l = 1;
  }
  if (g >= 50 && g <= 55) {
    l = 1;
  }
  if (g == 19) {
    l = 1;
  }

  c[f] = l;
}