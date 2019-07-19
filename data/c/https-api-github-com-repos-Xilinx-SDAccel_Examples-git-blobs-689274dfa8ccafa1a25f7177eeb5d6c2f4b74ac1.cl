kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(const __global uint16* a, const __global uint16* b, __global uint16* c, int d) {
  local uint16 e[128];
  local uint16 f[128];

  int g = (d - 1) / 16 + 1;

  for (int h = 0; h < g; h += 128) {
    int i = 128;

    if ((h + 128) > g)
      i = g - h;

  v1_rd:
    __attribute__((xcl_pipeline_loop)) for (int j = 0; j < i; j++) {
      e[j] = a[h + j];
    }

  v2_rd_add:
    __attribute__((xcl_pipeline_loop)) for (int j = 0; j < i; j++) {
      uint16 k = e[j];
      uint16 l = b[h + j];
      f[j] = k + l;
    }

  out_wr:
    __attribute__((xcl_pipeline_loop)) for (int j = 0; j < i; j++) c[h + j] = f[j];
  }
}