__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  unsigned int h = 0;
  unsigned int i = a * a;

  int j = 0;
  int k = 0;

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

  j = -8;
  k = -8;
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

  j = -7;
  k = -9;
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
  k = 9;
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

  j = -5;
  k = -10;
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
  k = 10;
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

  j = -2;
  k = -11;
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
  k = 11;
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

  j = 2;
  k = -11;
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
  k = 11;
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

  j = 5;
  k = -10;
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
  k = 10;
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

  j = 7;
  k = -9;
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
  k = 9;
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
  k = 8;
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

  int l = 0;

  if (g >= 77 && g <= 133) {
    l = 1;
  }
  if (g >= 39 && g <= 47) {
    l = 1;
  }
  if (g >= 11 && g <= 11) {
    l = 1;
  }

  c[f] = l;
}