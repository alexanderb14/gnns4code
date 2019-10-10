__kernel void A(global float* a, global float* b, global float* c, global int* d, global float* e) {
  int f = get_global_id(0);

  float g = 0.0;

  for (int h = 0; h < d[0]; h++) {
    int i = d[0] * f + h;
    g += a[h] * b[i];
  }

  c[f] = (2.0 / (1.0 + exp(-e[0] * g))) - 1.0;
}