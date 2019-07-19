kernel void A(global const int* a, global const int* b, global int* c, int d) {
  int e = get_global_id(0);
  if (e >= d) {
    return;
  }
  c[e] = a[e] + b[e];
}

kernel void B(global const int* a, global const int* b, global int* c, int d) {
  int e = get_global_id(0);
  if (e >= d) {
    return;
  }
  c[e] = e;
}

kernel void C(global int* a, int b, int c) {
  int d = get_global_id(0);
  if (d >= c) {
    return;
  }
  a[d] += b;
}

kernel void D(global int* a, int b, int c) {
  int d = get_global_id(0);
  if (d >= c) {
    return;
  }
  a[d] *= b;
}