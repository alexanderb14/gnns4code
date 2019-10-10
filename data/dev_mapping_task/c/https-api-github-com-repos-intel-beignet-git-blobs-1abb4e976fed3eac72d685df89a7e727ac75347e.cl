kernel void A(global float* a, unsigned int b, global float* c, unsigned int d, unsigned int e) {
  int f = get_global_id(0) * 4;
  if (f < e * 4) {
    c[f + d] = a[f + b];
    c[f + d + 1] = a[f + b + 1];
    c[f + d + 2] = a[f + b + 2];
    c[f + d + 3] = a[f + b + 3];
  }
}