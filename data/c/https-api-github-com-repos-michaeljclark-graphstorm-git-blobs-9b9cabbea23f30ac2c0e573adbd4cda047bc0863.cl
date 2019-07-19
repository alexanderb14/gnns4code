struct tree_global {
  volatile int nextNode;
  volatile int activeNodes;
  int depth;
  int pad;
};

__kernel void A(__global float4* a, __global float4* b, __global float* c, const float d, __global uint* e, __global int* f, __global float4* g, __global float* h, __global float4* i) {
  const int j = get_global_id(0);

  float4 k = a[j];
  float l = c[j];
  float4 m = 0;

  b[j] += m;
}