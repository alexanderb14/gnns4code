kernel void A(const int a, global float* b, global const float* c) {
  const int d = get_global_id(0);
  if (d >= a) {
    return;
  }
  b[d] += c[d];
}

kernel void B(const int a, const int b, global float* c, global const float* d) {
  const int e = get_global_id(0);
  if (e >= a) {
    return;
  }
  c[e] += d[e % b];
}

kernel void C(const int a, const int b, const int c, global float* d, global const float* e) {
  const int f = get_global_id(0);
  if (f >= a) {
    return;
  }
  d[f] += e[(f / c) % b];
}