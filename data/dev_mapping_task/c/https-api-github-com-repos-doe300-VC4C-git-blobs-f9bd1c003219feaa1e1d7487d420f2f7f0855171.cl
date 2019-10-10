inline float A(float a) {
  return __clc_pow(a, 3.0f) + 4.0f;
}

__kernel void B(__global float* a, __global float* b, const uint c) {
  uint d = get_local_id(0) + (32 * get_group_id(0));
  for (uint e = 0; e < 4; e++) {
    if (d < c) {
      a[d] = A(b[d]);
      d += 8;
    }
  }
}