struct MAC {
  float mult;
  float add;
};

__kernel void A(__global float* a, __global float* b, const struct MAC c) {
  int d = get_global_id(0);
  b[d] = a[d] * c.mult + c.add;
}