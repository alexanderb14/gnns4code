kernel void A(__global long* a, __global long* b, __global long* c) {
  int d = get_global_id(0);
  c[d] = a[d] / b[d];
}

kernel void B(__global long* a, __global long* b, __global long* c) {
  int d = get_global_id(0);
  c[d] = a[d] % b[d];
}