struct orientation {
  float x;
  float y;
  float z;
};

__kernel void A(__global float* a, __global float* b, const struct orientation c) {
  int d = get_global_id(0);
  b[d] = a[d] * a[d] * a[d] + c.x;
}