kernel void A(global double* a, global int* b, global uint* c) {
  int d = get_global_id(0);

  if (d % 3) {
    int e = a[d];
    b[d] = e;

    uint f = a[d];
    c[d] = f;
  }
}

kernel void B(global double* a, global float* b) {
  int c = get_global_id(0);

  float d = a[c];
  b[c] = d;
}

kernel void C(global double* a, global short* b, global ushort* c) {
  int d = get_global_id(0);

  if (d % 3) {
    short e = a[d];
    b[d] = e;

    ushort f = a[d];
    c[d] = f;
  }
}

kernel void D(global double* a, global long* b, global ulong* c) {
  int d = get_global_id(0);

  if (d % 3) {
    long e = a[d];
    b[d] = e;

    ulong f = a[d];
    c[d] = f;
  }
}

kernel void E(global double* a, global char* b, global uchar* c) {
  int d = get_global_id(0);

  if (d % 3) {
    char e = a[d];
    b[d] = e;

    uchar f = a[d];
    c[d] = f;
  }
}

kernel void F(global long* a, global ulong* b, global double* c, global double* d) {
  int e = get_global_id(0);

  double f = a[e];
  c[e] = f;

  f = b[e];
  d[e] = f;
}

kernel void G(global int* a, global uint* b, global double* c, global double* d) {
  int e = get_global_id(0);

  double f = a[e];
  c[e] = f;

  f = b[e];
  d[e] = f;
}

kernel void H(global short* a, global ushort* b, global double* c, global double* d) {
  int e = get_global_id(0);

  double f = a[e];
  c[e] = f;

  f = b[e];
  d[e] = f;
}

kernel void I(global char* a, global uchar* b, global double* c, global double* d) {
  int e = get_global_id(0);

  double f = a[e];
  c[e] = f;

  f = b[e];
  d[e] = f;
}

kernel void J(global float* a, global double* b) {
  int c = get_global_id(0);

  double d = a[c];
  b[c] = d;
}