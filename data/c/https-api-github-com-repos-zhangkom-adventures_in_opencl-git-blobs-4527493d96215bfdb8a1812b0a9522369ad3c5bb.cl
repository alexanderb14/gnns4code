typedef struct Params {
  float c1;
  float c2;
} Params;

float A(float a, float b) {
  return a + b;
}

__kernel void B(__global float* a, __global float* b, __global float* c, __constant struct Params* d) {
  unsigned int e = get_global_id(0);

  c[e] = A(a[e], b[e]);
}