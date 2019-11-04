int A(int a) {
  return (a >> 10) & ((1 << 10) - 1);
}
int B(int a) {
  return a & ((1 << 10) - 1);
}
int C(int a, int b) {
  return (a << 10) | b;
}
int D(int a, int b) {
  return C((a / b), (a % b));
}
int E(int a, int b) {
  return A(a) * b + B(a);
}

void F(local float* a, global float const* b, const int c, const int d, const int e) {
  const int f = A(e) * B(e);
  const int g = (f + get_local_size(0) - 1) / get_local_size(0);
  for (int h = 0; h < g; h++) {
    const int i = get_local_id(0) + h * get_local_size(0);
    if (i < f) {
      const int j = D(i, B(e));
      a[i] = b[E(d + j, B(c))];
    }
  }
}
void G(local float* a, global float const* b, int c) {
  int d = (c + get_local_size(0) - 1) / get_local_size(0);
  for (int e = 0; e < d; e++) {
    int f = e * get_local_size(0) + get_local_id(0);
    if (f < c) {
      a[f] = b[f];
    }
  }
}

void H(global float* a, local float const* b, int c) {
  int d = (c + get_local_size(0) - 1) / get_local_size(0);
  for (int e = 0; e < d; e++) {
    int f = e * get_local_size(0) + get_local_id(0);
    if (f < c) {
      a[f] = b[f];
    }
  }
}

kernel void I(global const float* a, global float* b) {
  if (get_global_id(0) == 0) {
    b[0] = A(a[0]);
    b[1] = B(a[0]);
    int c = C(a[1], a[2]);
    b[2] = c;
    b[3] = A(c);
    b[4] = B(c);
  }
}

kernel void J(global const float* a, global float* b, int c, int d, int e, local float* f) {
  F(f, a, c, d, e);

  barrier(1);
  H(b, f, A(e) * B(e));
}