typedef unsigned char JSAMPLE; struct ConverterInfo {
  int Cr_r_tab[255 + 1];
  int Cb_b_tab[255 + 1];
  int Cr_g_tab[255 + 1];
  int Cb_g_tab[255 + 1];
  JSAMPLE sample_range_limit[(5 * (255 + 1) + 128)];
};

__kernel void A(__global struct ConverterInfo* a, __global JSAMPLE* b, __global JSAMPLE* c) {
  int d, e, f;
  __global JSAMPLE* g;
  __global JSAMPLE* h;
  __global JSAMPLE* i;
  __global JSAMPLE* j;
  __global JSAMPLE* k = a->sample_range_limit + (255 + 1);
  __global int* l = a->Cr_r_tab;
  __global int* m = a->Cb_b_tab;
  __global int* n = a->Cr_g_tab;
  __global int* o = a->Cb_g_tab;
  int p = get_global_id(0);
  int q = get_global_id(1);
  int r = get_global_size(1);
  int s = get_global_size(0);
  int t = r * s;
  float3 u = (float3)(1.0f, 0.0f, 1.40200f);
  float3 v = (float3)(1.0f, -0.34414, -0.71414);
  float3 w = (float3)(1.0f, 1.77200f, 0.0f);
  float3 x;

  g = b + p * r + q;
  h = g + t;
  i = h + t;

  x.x = convert_float((g[0]) & 0xff);
  x.y = convert_float(((h[0]) & 0xff) - 128);
  x.z = convert_float(((i[0]) & 0xff) - 128);
  j = c + (p * r + q) * 3;
  j[0] = k[convert_int(dot(x, u))];
  j[1] = k[convert_int(dot(x, v))];
  j[2] = k[convert_int(dot(x, w))];
}