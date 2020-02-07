__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;

  c[f] = b[f];
}

__kernel void B(const int a, int b, int c, int d, __global int* e) {
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_id(1);
  unsigned int h = f + a * g;
  unsigned int i = b + a * c;

  int j = e[h];

  if ((f >= b && f <= b + d) && (g >= c && g <= c + d)) {
    j = 1;
  }

  e[h] = j;
}

__kernel void C(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;

  if (c[f] > 0) {
    c[f] += 5;
  }
  if (c[f] > 1278) {
    c[f] = 0;
  }
  if (b[f] != 0) {
    c[f] = b[f];
  }
}

__kernel void D(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;

  if (c[f] > 23) {
    c[f] = 0;
  }
  if (c[f] > 0) {
    c[f] += 1;
  }
  if (b[f] != 0) {
    c[f] = b[f];
  }
}

__kernel void E(const int a, __global int* b, __global int* c, __global int* d) {
  unsigned int e = get_global_id(0);
  unsigned int f = get_global_id(1);
  unsigned int g = e + a * f;

  int h = b[g];

  if (c[g] != 0) {
    h = c[g];
  }

  d[g] = h;
}

__kernel void F(const int a, __global int* b, __global int* c, __global int* d) {
  unsigned int e = get_global_id(0);
  unsigned int f = get_global_id(1);
  unsigned int g = e + a * f;

  int h = b[g];

  if (c[g] != 0 && b[g] != 0) {
    h = 1;
  }

  d[g] = h;
}