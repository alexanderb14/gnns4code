kernel void A(const int a, global const float* b, global float* c) {
  const int d = get_global_id(0);
  if (d >= a) {
    return;
  }
  c[d] = b[d];
}

kernel void B(const int a, global const float* b, const int c, global float* d, const int e) {
  const int f = get_global_id(0);
  if (f >= a) {
    return;
  }
  d[f + e] = b[f + c];
}

kernel void C(const int a, const float b, global const float* c, global float* d) {
  const int e = get_global_id(0);
  if (e >= a) {
    return;
  }
  d[e] = b * c[e];
}

kernel void D(const int a, const float b, global float* c) {
  const int d = get_global_id(0);
  if (d >= a) {
    return;
  }
  c[d] *= b;
}