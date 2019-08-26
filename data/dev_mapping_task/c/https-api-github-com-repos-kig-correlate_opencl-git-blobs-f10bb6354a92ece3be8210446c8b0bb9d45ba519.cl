__kernel void A(__global float* a, const int b, __constant float4* c, __constant float4* d, const int e, const int f) {
  int g = get_global_id(0) * b;
  int h = get_global_id(0);
  for (int i = 0; i < e - h; i++) {
    int j = i * f;
    for (int k = 0; k < b; k += 4) {
      float4 l[4];
      for (int m = 0; m < 4; m++)
        l[m] = 0;
      int n = (h + i) * f + k;
      for (int o = 0; o < e - k; o++) {
        for (int m = 0; m < 4; m++)
          l[m] += c[n + o + m] * d[j + o];
      }
      for (int m = 0; m < 4; m++)
        a[g + k + m] += ((l[m]).x + (l[m]).y + (l[m]).z + (l[m]).w);
    }
  }
}