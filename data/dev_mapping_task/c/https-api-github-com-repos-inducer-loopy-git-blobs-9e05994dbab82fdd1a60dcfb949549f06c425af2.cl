__kernel void __attribute__((reqd_work_group_size(1, 1, 1))) A(__global float4 const* __restrict__ a, int const b, __global float4* __restrict__ c) {
  for (int d = 0; d <= -2 + (((3 + b) - (((3 + b) < 0) ? ((4) - 1) : 0)) / (4)); ++d)
    c[d] = 2.0f * a[d];

  {
    int const d = -1 + b + -1 * (((3 * b) - (((3 * b) < 0) ? ((4) - 1) : 0)) / (4));

    if (-1 + b >= 0) {
      if (-1 + -4 * d + b >= 0)
        c[d].s0 = 2.0f * a[d].s0;
      if (-1 + -4 * d + -1 + b >= 0)
        c[d].s1 = 2.0f * a[d].s1;
      if (-1 + -4 * d + -1 * 2 + b >= 0)
        c[d].s2 = 2.0f * a[d].s2;
      if (-1 + -4 * d + -1 * 3 + b >= 0)
        c[d].s3 = 2.0f * a[d].s3;
    }
  }
}