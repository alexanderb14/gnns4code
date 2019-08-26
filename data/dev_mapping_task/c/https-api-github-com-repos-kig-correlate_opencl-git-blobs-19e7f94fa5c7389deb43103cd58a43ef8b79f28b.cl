__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void A(__global float8* a, const int b, __constant float4* c, __constant float4* d, const int e, const int f) {
  float4 g[(1 * 8)];
  for (int h = 0; h < (1 * 8); h++)
    g[h] = 0;
  int i = get_global_id(0);
  int j = i * (1 * 8) / b;
  int k = i * (1 * 8) - (j * b);
  for (int l = 0; l < e - j; l++) {
    int m = l * f;
    int n = (j + l) * f + k;
    float4 o = c[n], p = d[m];
    for (int q = 0; q < e - k; q += 16) {
      for (int h = 0; h < 16; h++)
        for (int r = 0; r < (1 * 8); r++)
          g[r] += o * p;
    }
  }
  for (int h = 0; h < 1; h++)
  a[i*1 +h] = (float8)(
    (hg8+0]).x+hg8+0]).y+hg8+0]).z+hg8+0]).w),
    (hg8+1]).x+hg8+1]).y+hg8+1]).z+hg8+1]).w),
    (hg8+2]).x+hg8+2]).y+hg8+2]).z+hg8+2]).w),
    (hg8+3]).x+hg8+3]).y+hg8+3]).z+hg8+3]).w),
    (hg8+4]).x+hg8+4]).y+hg8+4]).z+hg8+4]).w),
    (hg8+5]).x+hg8+5]).y+hg8+5]).z+hg8+5]).w),
    (hg8+6]).x+hg8+6]).y+hg8+6]).z+hg8+6]).w),
    (hg8+7]).x+hg8+7]).y+hg8+7]).z+hg8+7]).w)
  );
}