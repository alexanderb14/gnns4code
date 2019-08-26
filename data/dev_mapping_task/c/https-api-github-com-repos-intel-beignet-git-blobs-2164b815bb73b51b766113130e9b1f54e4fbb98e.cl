kernel void A(global float* a, global float* b, global float* c, global float* d) {
  int e = get_global_id(0);
  d[e] = mix(a[e], b[e], c[e]);
}