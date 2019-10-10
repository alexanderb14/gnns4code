__kernel void A(int a, __global int* b, __global float* c, __global float* d) {
  int e = get_global_id(0);
  if (e >= a) {
    return;
  }

  int f = b[e];

  int g;
  for (g = 0; g < 3; g++) {
    d[g * a + e] = c[f * 3 + g];
  }
}