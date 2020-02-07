__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);

  unsigned int f = d + a * e;

  c[f] = b[f] + f;
}

__kernel void B(const int a, __global int* b) {
  unsigned int c = get_global_id(0);
  unsigned int d = get_global_id(1);

  unsigned int e = c + a * d;

  b[e] = e;
}

__kernel void C(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);

  unsigned int f = d + a * e;

  if (b[f] == 0) {
    c[f] = 1;
  } else {
    c[f] = 0;
  }
}

__kernel void D(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  if (b[f - 1] == 1) {
    g = g + 1;
  }
  if (b[f + 1] == 1) {
    g = g + 1;
  }
  if (b[f - 1 - a] == 1) {
    g = g + 1;
  }
  if (b[f - 1 + a] == 1) {
    g = g + 1;
  }
  if (b[f + 1 - a] == 1) {
    g = g + 1;
  }
  if (b[f + 1 + a] == 1) {
    g = g + 1;
  }
  if (b[f - a] == 1) {
    g = g + 1;
  }
  if (b[f + a] == 1) {
    g = g + 1;
  }

  if (g != 2) {
    if (g == 3) {
      c[f] = 1;
    } else {
      c[f] = 0;
    }
  }
}