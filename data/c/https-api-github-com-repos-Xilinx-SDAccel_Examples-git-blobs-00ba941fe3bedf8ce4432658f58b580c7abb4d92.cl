kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global uint16* __restrict a, __global uint16* __restrict b, ulong c) {
  __attribute__((xcl_pipeline_loop)) for (ulong d = 0; d < c; d++) {
    uint16 e = a[d];
    b[d] = e;
  }
}