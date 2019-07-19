kernel void A(global char* a, global short* b, global int* c, global long* d, global long* e, global long* f) {
  int g = get_global_id(0);
  d[g] = a[g];
  e[g] = b[g];
  f[g] = c[g];
}

kernel void B(global char* a, global short* b, global int* c, global long* d) {
  int e = get_global_id(0);
  a[e] = d[e];
  b[e] = d[e];
  c[e] = d[e];
}

kernel void C(global float* a, global long* b) {
  int c = get_global_id(0);
  a[c] = b[c];
}