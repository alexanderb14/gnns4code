__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void A(__global float8* a, const int b, __constant float4* c, __constant float4* d, const int e, const int f) {
  float4 g[((1 * 8) + 16)], h[((1 * 8) + 16)];
  float4 i[(1 * 8)];
  for (int j = 0; j < (1 * 8); j++)
    i[j] = 0;
  int k = get_global_id(0);
  int l = k * (1 * 8) / b;
  int m = k * (1 * 8) - (l * b);
  for (int n = 0; n < e - l; n++) {
    int o = n * f;
    int p = (l + n) * f;
    for (int q = 0; q < e - m; q += 16) {
      for (int j = 0; j < ((1 * 8) + 16); j++) {
        g[j] = c[p + q + j];
        h[j] = d[o + q + j];
      }
      for (int j = 0; j < 16; j++)
        for (int r = 0; r < (1 * 8); r++)
          i[r] += g[j + r] * h[j];
    }
  }
  for (int j = 0; j < 1; j++)
  a[k*1 +j] = (float8)(
    (ji8+0]).x+ji8+0]).y+ji8+0]).z+ji8+0]).w),
    (ji8+1]).x+ji8+1]).y+ji8+1]).z+ji8+1]).w),
    (ji8+2]).x+ji8+2]).y+ji8+2]).z+ji8+2]).w),
    (ji8+3]).x+ji8+3]).y+ji8+3]).z+ji8+3]).w),
    (ji8+4]).x+ji8+4]).y+ji8+4]).z+ji8+4]).w),
    (ji8+5]).x+ji8+5]).y+ji8+5]).z+ji8+5]).w),
    (ji8+6]).x+ji8+6]).y+ji8+6]).z+ji8+6]).w),
    (ji8+7]).x+ji8+7]).y+ji8+7]).z+ji8+7]).w)
  );
}