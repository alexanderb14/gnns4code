__kernel void A(__global float4* a, __global float4* b, __global float4* c) {
  float4 d = 0;
  int e = 0, f = 0;
  int g = (int)get_global_id(0);
  int h = (int)get_global_size(0);
  for (f = 0; f < 16; f++) {
    d = d + a[e + g] + b[e + g];
    e += h;
  }
  c[g] = d;
}