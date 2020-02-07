__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global float* a, __global float* b, __global float* c, float d, float e, float f, float g, float h, float i, float j, float k) {
  __local float l[512 * 8] __attribute__((xcl_array_partition(cyclic, 64, 1)));
  __local float m[512 * 8] __attribute__((xcl_array_partition(cyclic, 64, 1)));
  __local float n[512 * 8] __attribute__((xcl_array_partition(cyclic, 64, 1)));
  __local float o[512 * 8] __attribute__((xcl_array_partition(cyclic, 64, 1)));
  __local float p[512 * 8] __attribute__((xcl_array_partition(cyclic, 64, 1)));

  int q = get_global_id(0);

  for (int r = 0; r < 8; ++r) {
    async_work_group_copy(&l[r * 512], &a[q * 512 + r * 512 * 512], 512, 0);
    async_work_group_copy(&m[r * 512], &b[q * 512 + r * 512 * 512], 512, 0);
    async_work_group_copy(&n[r * 512], &b[(q + 1) * 512 + r * 512 * 512], 512, 0);
    async_work_group_copy(&o[r * 512], &b[(q + 2) * 512 + r * 512 * 512], 512, 0);
  }
  barrier(1);

  for (int r = 1; r < 8 - 1; ++r) {
    __attribute__((xcl_pipeline_loop)) for (int s = 1; s < 512 - 1; ++s) {
      float t = a[512 * r + s];
      float u = n[512 * r + s];
      float v = n[512 * r + s - 1];
      float w = n[512 * r + s + 1];
      float x = m[512 * r + s];
      float y = o[512 * r + s];
      float z = n[512 * (r - 1) + s];
      float aa = n[512 * (r + 1) + s];

      p[512 * r + s] = k * u + f * v + e * w + h * y + g * x + j * z + i * aa + d * t + i * 80.0;
    }
  }
  barrier(1);

  for (int r = 1; r < 8 - 1; ++r) {
    async_work_group_copy(&c[(q + 1) * 512 + r * 512 * 512 + 1], &p[r * 512 + 1], 512 - 2, 0);
  }
  return;
}