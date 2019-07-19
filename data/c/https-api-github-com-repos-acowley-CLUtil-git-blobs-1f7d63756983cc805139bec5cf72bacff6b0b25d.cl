__kernel void A(__global float* a, __global float* b, __global float* c) {
  size_t d = get_global_id(0);
  float4 e = vload4(d, a) + vload4(d, b);
  vstore4(e * e, d, c);
}

__kernel void B(__global double* a, __global double* b, __global double* c, __global int* d) {
  size_t e = get_global_id(0);
  double4 f = vload4(e, a) + vload4(e, b);
  double4 g = f * f;
  vstore4(g, e, c);
  d[e] = (int)(g.x + g.y + g.z + g.w);
}

__kernel void C(__global float* a, __global float* b, __global float* c) {
  size_t d = get_global_id(0);
  size_t e = get_global_id(1);
  size_t f = e * get_global_size(0) + d;
  c[f] = a[f] + b[f];
}