__kernel void A(const int a, __global float* b) {
  const int c = get_global_id(0);
  const int d = get_global_id(1);

  if ((c < a) && (d < a)) {
    b[c * a + d] += 1.0f;
  }
}

__kernel void B(const int a, __global double* b) {
  const int c = get_global_id(0);
  const int d = get_global_id(1);

  if ((c < a) && (d < a)) {
    b[c * a + d] += 1.0;
  }
}