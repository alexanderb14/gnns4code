kernel void A(global short* a, global ushort* b, global int* c) {
  int d = get_global_id(0);
  c[d] = upsample(a[d], b[d]);
}