__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  unsigned int h = 0;
  unsigned int i = a * a;

  int j = 0;
  int k = 0;

  j = 0;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 0;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 0;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 0;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 0;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -1;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -2;
  h = (f + j) % a + (e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  c[f] = (g == 4);
}