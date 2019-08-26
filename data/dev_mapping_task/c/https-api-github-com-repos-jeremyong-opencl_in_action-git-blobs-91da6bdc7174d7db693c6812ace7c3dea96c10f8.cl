__kernel void A(float a, __global float* b, __local float4* c) {
  int d = get_global_id(0);
  c[d] = vload4(d, b);

  c[d] *= a;
  vstore4(c[d], d, b);
}