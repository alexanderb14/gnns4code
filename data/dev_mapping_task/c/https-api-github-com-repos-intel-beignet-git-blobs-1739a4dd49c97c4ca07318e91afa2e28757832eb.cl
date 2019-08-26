kernel void A(global short* a, global short* b, global short* c, global short* d) {
  short e = get_global_id(0);
  d[e] = mad_sat(a[e], b[e], c[e]);
}