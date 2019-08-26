__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  unsigned int h = 0;
  unsigned int i = a * a;

  int j = 0;
  int k = 0;

  j = -23;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -23;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -23;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -23;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -23;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -23;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -23;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -22;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -21;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

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

  j = -20;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -6;
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
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 2;
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

  j = -19;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -9;
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
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 5;
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

  j = -18;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -11;
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
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 8;
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

  j = -17;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -13;
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
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 10;
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

  j = -16;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -14;
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
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -3;
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
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 12;
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

  j = -15;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -15;
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
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -6;
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
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 2;
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
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 13;
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

  j = -14;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -16;
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
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -8;
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
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 5;
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
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 14;
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

  j = -13;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -17;
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
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -10;
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
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 7;
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
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 15;
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

  j = -12;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -17;
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
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -11;
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
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -4;
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
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 9;
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
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 15;
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

  j = -11;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -18;
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
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -12;
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
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -6;
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
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 1;
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
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 10;
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
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 16;
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

  j = -10;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -18;
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
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -13;
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
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -8;
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
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 4;
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
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 11;
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
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 16;
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

  j = -9;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -19;
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
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -13;
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
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -9;
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
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 6;
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
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 11;
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
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 17;
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

  j = -8;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -19;
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
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -14;
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
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -10;
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
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -2;
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
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 7;
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
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 12;
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
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 17;
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

  j = -7;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -19;
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
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -14;
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
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -10;
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
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -4;
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
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 8;
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
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 12;
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
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 17;
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

  j = -6;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -20;
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
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -15;
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
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -11;
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
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -6;
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
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 1;
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
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 8;
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
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 13;
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
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 18;
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

  j = -5;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -20;
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
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -15;
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
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -11;
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
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -6;
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
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 3;
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
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 9;
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
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 13;
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
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 18;
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

  j = -4;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -20;
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
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -15;
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
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -12;
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
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -7;
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
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 4;
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
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 9;
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
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 13;
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
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 18;
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

  j = -3;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -21;
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
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -16;
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
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -12;
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
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -7;
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
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -3;
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
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 4;
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
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 9;
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
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 14;
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
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 19;
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

  j = -2;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -21;
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
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -16;
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
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -12;
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
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -8;
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
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -3;
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
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 5;
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
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 10;
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
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 14;
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
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 19;
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

  j = -1;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -21;
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
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -16;
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
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -12;
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
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -8;
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
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -3;
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
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 5;
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
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 10;
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
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 14;
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
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 19;
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

  j = 0;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -21;
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
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -16;
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
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -12;
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
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -8;
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
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -3;
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
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 5;
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
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 10;
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
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 14;
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
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 19;
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

  j = 1;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -21;
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
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -16;
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
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -12;
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
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -7;
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
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -3;
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
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 4;
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
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 9;
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
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 14;
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
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 19;
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

  j = 2;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -20;
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
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -15;
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
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -12;
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
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -7;
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
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 4;
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
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 9;
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
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 13;
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
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 18;
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

  j = 3;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -20;
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
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -15;
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
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -11;
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
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -6;
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
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 3;
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
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 9;
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
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 13;
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
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 18;
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

  j = 4;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -20;
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
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -15;
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
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -11;
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
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -6;
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
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 1;
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
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 8;
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
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 13;
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
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 18;
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

  j = 5;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -19;
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
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -14;
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
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -10;
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
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -4;
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
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 8;
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
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 12;
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
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 17;
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

  j = 6;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -19;
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
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -14;
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
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -10;
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
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -2;
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
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 7;
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
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 12;
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
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 17;
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

  j = 7;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -19;
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
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -13;
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
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -9;
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
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 6;
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
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 11;
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
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 17;
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

  j = 8;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -18;
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
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -13;
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
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -8;
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
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 4;
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
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 11;
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
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 16;
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

  j = 9;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -18;
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
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -12;
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
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -6;
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
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 1;
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
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 10;
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
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 16;
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

  j = 10;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -17;
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
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -11;
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
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -4;
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
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 9;
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
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 15;
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

  j = 11;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -17;
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
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -10;
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
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 7;
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
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 15;
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

  j = 12;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -16;
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
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -8;
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
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 5;
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
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 14;
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

  j = 13;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -15;
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
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -6;
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
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 2;
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
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 13;
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

  j = 14;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -14;
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
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -3;
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
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 12;
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

  j = 15;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -13;
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
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 10;
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

  j = 16;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -11;
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
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 8;
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

  j = 17;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -9;
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
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 5;
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

  j = 18;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -6;
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
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 2;
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

  j = 19;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -3;
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

  j = 20;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  int l = 0;

  if (g >= 800 && g <= 1100) {
    l = 1;
  }

  if (g >= 570 && g <= 630) {
    l = 1;
  }
  if (g >= 440 && g <= 470) {
    l = 1;
  }
  if (g >= 280 && g <= 310) {
    l = 1;
  }
  if (g >= 185 && g <= 190) {
    l = 1;
  }
  if (g >= 45 && g <= 46) {
    l = 1;
  }

  c[f] = l;
}