kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global const uint2* a, __global uint2* b, __global const uint4* c, int d) {
  local uint2 e[8192] __attribute__((xcl_array_partition(cyclic, 8, 1)));
  local uint4 f[8192] __attribute__((xcl_array_partition(cyclic, 8, 1)));
  local uint2 g[8192] __attribute__((xcl_array_partition(cyclic, 8, 1)));

  const uint h = 0x9e3779b9;
  async_work_group_copy(e, a, 8192, 0);
  async_work_group_copy(f, c, 8192, 0);
  __attribute__((xcl_pipeline_loop)) for (int i = 0; i < 1024; i++) {
    for (int j = 0; j < 8; j++) {
      uint k = e[8 * i + j].x, l = e[8 * i + j].y, m = 0;
      uint n = f[8 * i + j].x, o = f[8 * i + j].y, p = f[8 * i + j].z, q = f[8 * i + j].w;
      for (int r = 0; r < 32; r++) {
        m += h;
        k += ((l << 4) + n) ^ (l + m) ^ ((l >> 5) + o);
        l += ((k << 4) + p) ^ (k + m) ^ ((k >> 5) + q);
      }
      g[8 * i + j].x = k;
      g[8 * i + j].y = l;
    }
  }
  async_work_group_copy(b, g, 8192, 0);
}