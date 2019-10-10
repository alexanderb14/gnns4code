__kernel void A(__global float* a, __global float* b, uint c, uint d, uint e, uint f) {
  uint g = get_global_id(0);
  uint h = g / (c * d);

  uint i = h / e;
  uint j = h % e;

  uint k = g % (c * d);

  b[g] = a[(j * c * d * f) + (i * c * d) + k];
}