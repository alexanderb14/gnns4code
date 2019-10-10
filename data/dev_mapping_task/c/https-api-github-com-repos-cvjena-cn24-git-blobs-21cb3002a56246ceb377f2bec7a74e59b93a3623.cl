__kernel void A(__global float* a, __global float* b, __global float* c, uint d, uint e, uint f, float g) {
  uint h = get_global_id(0);
  uint i = get_global_id(1);

  float j = 0;

  for (uint k = 0; k < f; k++) {
    const float l = a[i + k * d];
    const float m = c[h + k * e];
    j += l * m;
  }

  j *= g;

  b[i * e + h] = j;
}