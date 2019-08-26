int A(long a, long b); inline int B(long a, long b) {
  return a > b;
}

kernel void C(global long* a, global long* b, global long* c) {
  int d = get_global_id(0);
  int e = A(a[d], b[d]);
  c[d] = e ? 3 : 4;
  int f = B(a[d], b[d]);
}