__kernel void A(__global float* a, const int b, __constant float4* c, __constant float4* d, const int e) {
  int f = get_global_id(0);
  int g = f / b;
  int h = f % b;
  float4 i = 0;
  for (int j = 0; j < e - g; j++) {
    int k = j * e;
    int l = (g + j) * e + h;
    for (int m = 0; m < e - h; m++) {
      i += c[l + m] * d[k + m];
    }
  }
  a[f] = i.x + i.y + i.z + i.w;
}