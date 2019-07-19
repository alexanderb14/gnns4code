__kernel void A(__global float* a, __global float* b, __global float* c) {
  const int2 d = (int2)(get_global_id(0), get_global_id(1));
  const int2 e = (int2)(get_global_size(0), get_global_size(1));

  int f = d.y * e.x + d.x;
  float g = a[f];
  float h = b[d.x] + c[d.y];
  a[f] = (g < h) ? g : h;
}