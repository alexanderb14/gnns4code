__kernel void A(const int a, __global float* b, __global float* c) {
  const int d = get_global_id(0);
  const int e = get_global_id(1);

  if ((d < a) && (e < a)) {
    c[d * a + e] += b[e * a + d];
    b[e * a + d] += 1.0f;
  }
}

__kernel void B(const int a, __global double* b, __global double* c) {
  const int d = get_global_id(0);
  const int e = get_global_id(1);

  if ((d < a) && (e < a)) {
    c[d * a + e] += b[e * a + d];
    b[e * a + d] += 1.0;
  }
}