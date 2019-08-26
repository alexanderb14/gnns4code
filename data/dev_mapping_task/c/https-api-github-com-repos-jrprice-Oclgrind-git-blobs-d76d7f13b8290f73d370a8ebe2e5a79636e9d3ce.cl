kernel void A(global int* a, global int* b, global int* c) {
  int d = get_global_id(0);
  if (d < 4) {
    c[d] = a[d] + b[d];
  } else {
    c[d] = a[0] * (a[d] + b[d]);
  }
}