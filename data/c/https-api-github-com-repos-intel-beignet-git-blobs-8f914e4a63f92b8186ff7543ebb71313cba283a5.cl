kernel void A(global int* a, global uint* b, global long* c) {
  int d = get_global_id(0);
  c[d] = upsample(a[d], b[d]);
}