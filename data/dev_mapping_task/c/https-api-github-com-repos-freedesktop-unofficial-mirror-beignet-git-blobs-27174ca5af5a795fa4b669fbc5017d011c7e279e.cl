kernel void A(global float* a, unsigned int b, global float* c, unsigned int d, unsigned int e) {
  int f = get_global_id(0);
  if (f < e)
    c[f + d] = a[f + b];
}