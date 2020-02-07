kernel void A(global float* a, global float* b, global float* c) {
  int d = get_global_id(0);
  c[d] = nextafter(a[d], b[d]);
}