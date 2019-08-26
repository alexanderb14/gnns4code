__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  if (b[f - 1] == 1) {
    g += 1;
  }
  if (b[f + 1] == 1) {
    g += 1;
  }
  if (b[f - 1 - a] == 1) {
    g += 1;
  }
  if (b[f - 1 + a] == 1) {
    g += 1;
  }
  if (b[f + 1 - a] == 1) {
    g += 1;
  }
  if (b[f + 1 + a] == 1) {
    g += 1;
  }
  if (b[f - a] == 1) {
    g += 1;
  }
  if (b[f + a] == 1) {
    g += 1;
  }

  c[f] = (g == 3) || (g == 2) && (b[f] != 0);
}

__kernel void B(const int a, __global int* b, __global int* c) {
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

  j = 0;
  k = 1;
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
  k = 0;
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

  c[f] = (g == 3) || (g == 2) && (b[f] != 0);
}

__kernel void C(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  if (b[f - 1] == 1) {
    g += 1;
  }
  if (b[f + 1] == 1) {
    g += 1;
  }
  if (b[f - 1 - a] == 1) {
    g += 1;
  }
  if (b[f - 1 + a] == 1) {
    g += 1;
  }
  if (b[f + 1 - a] == 1) {
    g += 1;
  }
  if (b[f + 1 + a] == 1) {
    g += 1;
  }
  if (b[f - a] == 1) {
    g += 1;
  }
  if (b[f + a] == 1) {
    g += 1;
  }

  if (b[f - 2] == 1) {
    g += 1;
  }
  if (b[f + 2] == 1) {
    g += 1;
  }
  if (b[f - a * 2] == 1) {
    g += 1;
  }
  if (b[f + a * 2] == 1) {
    g += 1;
  }

  if (b[f - 1 - a * 2] == 1) {
    g += 1;
  }
  if (b[f - 1 + a * 2] == 1) {
    g += 1;
  }
  if (b[f + 1 - a * 2] == 1) {
    g += 1;
  }
  if (b[f + 1 + a * 2] == 1) {
    g += 1;
  }

  if (b[f - 2 - a * 2] == 1) {
    g += 1;
  }
  if (b[f - 2 + a * 2] == 1) {
    g += 1;
  }
  if (b[f + 2 - a * 2] == 1) {
    g += 1;
  }
  if (b[f + 2 + a * 2] == 1) {
    g += 1;
  }

  if (b[f - 2 - a] == 1) {
    g += 1;
  }
  if (b[f - 2 + a] == 1) {
    g += 1;
  }
  if (b[f + 2 - a] == 1) {
    g += 1;
  }
  if (b[f + 2 + a] == 1) {
    g += 1;
  }

  c[f] = (g == 4);
}