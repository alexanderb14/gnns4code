__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  unsigned int h = 0;
  unsigned int i = a * a;

  int j = 0;
  int k = 0;

  int l = b[f];

  j = -39;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -39;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -38;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -37;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -36;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -35;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -34;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -33;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -32;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = -24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -31;
  k = 24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -30;
  k = -26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -30;
  k = -25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -30;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -30;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -30;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -30;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -30;
  k = 25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -30;
  k = 26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = -27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = -26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = 26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -29;
  k = 27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = -27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = -24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = 24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = 27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -28;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -27;
  k = -29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -27;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -27;
  k = -24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -27;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -27;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -27;
  k = 24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -27;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -27;
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -26;
  k = -30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -26;
  k = -29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -26;
  k = -25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -26;
  k = -24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -26;
  k = 24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -26;
  k = 25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -26;
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -26;
  k = 30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -25;
  k = -30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -25;
  k = -26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -25;
  k = -25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -25;
  k = 25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -25;
  k = 26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -25;
  k = 30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -24;
  k = -31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -24;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -24;
  k = -27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -24;
  k = -26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -24;
  k = 26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -24;
  k = 27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -24;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -24;
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -23;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -23;
  k = -31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -23;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -23;
  k = -27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -23;
  k = 27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -23;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -23;
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -23;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -22;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -22;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -22;
  k = -29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -22;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -22;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -22;
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -22;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -22;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -21;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -21;
  k = -29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -21;
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -21;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = -30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = -29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = 30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -20;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = -31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = -30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -19;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -18;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = -31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -17;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -16;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -15;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 15;
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
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -36;
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
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -36;
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
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -35;
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
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -35;
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
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -35;
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
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -35;
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
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 39;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -35;
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
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -34;
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
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -34;
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
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -33;
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
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 38;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -33;
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
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -33;
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
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -32;
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
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 37;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -32;
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
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -32;
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
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -32;
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
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 36;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -31;
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
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -31;
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
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 35;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -30;
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
  k = 30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -29;
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
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 34;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = -29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 21;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 22;
  k = 33;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = -32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = -31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = -27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = 27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 23;
  k = 32;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 24;
  k = -31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 24;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 24;
  k = -27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 24;
  k = -26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 24;
  k = 26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 24;
  k = 27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 24;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 24;
  k = 31;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 25;
  k = -30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 25;
  k = -26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 25;
  k = -25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 25;
  k = 25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 25;
  k = 26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 25;
  k = 30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 26;
  k = -30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 26;
  k = -29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 26;
  k = -25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 26;
  k = -24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 26;
  k = 24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 26;
  k = 25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 26;
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 26;
  k = 30;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 27;
  k = -29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 27;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 27;
  k = -24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 27;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 27;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 27;
  k = 24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 27;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 27;
  k = 29;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = -28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = -27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = -24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = 24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = 27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 28;
  k = 28;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = -27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = -26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = 26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 29;
  k = 27;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 30;
  k = -26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 30;
  k = -25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 30;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 30;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 30;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 30;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 30;
  k = 25;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 30;
  k = 26;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = -24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 31;
  k = 24;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = -23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 32;
  k = 23;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = -22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = -21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = 21;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 33;
  k = 22;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 34;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 35;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 36;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 37;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 38;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 39;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  if (g >= 250 && g <= 600) {
    l = b[f] + 1;
  }

  g = 0;
  j = -14;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  if (g >= 31 && g <= 131) {
    l = 0;
  }

  if (g >= 121 && g <= 139) {
    l = b[f] + 1;
  }
  if (g >= 68 && g <= 75) {
    l = b[f] + 1;
  }

  g = 0;

  j = -3;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  if (g >= 14 && g <= 19) {
    l = b[f] + 1;
  }
  if (g >= 9 && g <= 9) {
    l = b[f] + 1;
  }

  g = 0;
  j = -14;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -14;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -13;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -12;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -11;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -10;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -9;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -8;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -7;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -6;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -5;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -4;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -3;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -2;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = -1;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 0;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 1;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 2;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 3;
  k = 14;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 4;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 5;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 6;
  k = 13;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 7;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = -12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 8;
  k = 12;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = -11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 9;
  k = 11;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = -10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 10;
  k = 10;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 11;
  k = 9;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 7;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 12;
  k = 8;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = -6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = -5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = -4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 4;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 5;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 13;
  k = 6;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = -3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = -2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = -1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = 0;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = 1;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = 2;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  j = 14;
  k = 3;
  h = ((f + j) & (a - 1)) + ((e * a + a * k) & (i - 1));
  if (b[h] != 0) {
    g += 1;
  }

  if (g >= 265 && g <= 320) {
    l = 0;
  }

  c[f] = l;
}