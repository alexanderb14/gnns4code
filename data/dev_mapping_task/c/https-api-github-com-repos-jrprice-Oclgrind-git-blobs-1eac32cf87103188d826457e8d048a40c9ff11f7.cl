typedef struct { float x; } DataStruct;

__kernel void A(__global DataStruct* a, __global float* b) {
  size_t c = get_global_id(0);
  DataStruct d = a[c];
  b[c] = d.x;
}