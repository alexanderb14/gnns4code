__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  int g = 0;

  unsigned int h = 0;
  unsigned int i = a * a;

  int j = 0;
  int k = 0;

  j = 0;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 1;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 1;
  k = 0;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 1;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 0;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -1;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -1;
  k = 0;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -1;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 0;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 1;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 2;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 2;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 2;
  k = 0;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 2;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 2;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 1;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = 0;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -1;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -2;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -2;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -2;
  k = 0;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -2;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -2;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  j = -1;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] != 0) {
    g += b[h];
  }

  int l = b[f];
  if (g >= 5 || g <= -5) {
    if (b[f] == -1 && ((g >= -10 && g <= -8))) {
      l = b[f] * -1;
    }
    if (b[f] == 1 && ((g >= 8 && g <= 10))) {
      l = b[f] * -1;
    }
    if (b[f] == 0 && g < 0) {
      l = -1;
    }
    if (b[f] == 0 && g > 0) {
      l = 1;
    }
  } else {
    l = 0;
  }
  c[f] = l;
}