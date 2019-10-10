__kernel void A(__global float4* a, __global float4* b, __global float* c, float d) {
  unsigned int e = get_global_id(0);
  if (c[e] < .05) {
    b[e].w = 0;
  }
  if (c[e] > .999) {
    b[e].w = 1;
  }
}