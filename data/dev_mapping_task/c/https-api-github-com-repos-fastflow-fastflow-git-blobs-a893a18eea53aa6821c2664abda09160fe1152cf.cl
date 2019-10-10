float A(float a, const int b) {
  return b;
}

float B(float a, const int b) {
  (void)b;
  return (a + 1.0);
}

__kernel void C(__global float* a, __global float* b, const uint c, const uint d, const uint e, const uint f) {
  int g = get_global_id(0);
  uint h = get_local_size(0) * get_num_groups(0);
  while (g < d) {
    b[g] = A(a[g], g);
    g += h;
  }
}

__kernel void D(__global float* a, __global float* b, const uint c, const uint d, const uint e, const uint f) {
  int g = get_global_id(0);
  uint h = get_local_size(0) * get_num_groups(0);
  while (g < d) {
    b[g] = B(a[g], g);
    g += h;
  }
}