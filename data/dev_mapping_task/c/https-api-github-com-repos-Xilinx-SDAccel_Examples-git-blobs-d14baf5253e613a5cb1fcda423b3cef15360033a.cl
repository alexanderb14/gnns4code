kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(global int* restrict a, global const int3* restrict b, const int c) {
  int3 d[32];
  int e[32];

  int f = c / 32;
  for (int g = 0; g < f; g++) {
    __attribute__((xcl_pipeline_loop)) load_pts : for (int h = 0; h < 32; h++) d[h] = b[g * 32 + h];

    __attribute__((xcl_pipeline_loop)) compute : for (int h = 0; h < 32; h++) e[h] = d[h].x * d[h].x + d[h].y * d[h].y + d[h].z * d[h].z;

    __attribute__((xcl_pipeline_loop)) store_r : for (int h = 0; h < 32; h++) a[g * 32 + h] = e[h];
  }
}
kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(global int16* restrict a, global const int16* restrict b, global const int16* restrict c, global const int16* restrict d, const int e) {
  int16 f[32];
  int16 g[32];
  int16 h[32];
  int16 i[32];

  int j = e / (16 * 32);
  for (int k = 0; k < j; k++) {
    __attribute__((xcl_pipeline_loop)) load_x : for (int l = 0; l < 32; l++) f[l] = b[k * 32 + l];
    __attribute__((xcl_pipeline_loop)) load_y : for (int l = 0; l < 32; l++) g[l] = c[k * 32 + l];
    __attribute__((xcl_pipeline_loop)) load_z : for (int l = 0; l < 32; l++) h[l] = d[k * 32 + l];

    __attribute__((xcl_pipeline_loop)) compute : for (int l = 0; l < 32; l++) i[l] = f[l] * f[l] + g[l] * g[l] + h[l] * h[l];

    __attribute__((xcl_pipeline_loop)) store_r : for (int l = 0; l < 32; l++) a[k * 32 + l] = i[l];
  }
}