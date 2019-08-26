__kernel void A(__global float* a, const int b, const float c, const float d, __global int* e, __global int* f) {
  int g = get_global_id(0);

  float h = c * g;

  int i = 0;
  int j = b - 1;

  while (a[3 * i + 2] < h - d && i < b - 1)
    i++;

  while (a[3 * j + 2] > h + d && j > 0)
    j--;

  e[g] = i;
  f[g] = j;
}

__kernel void B(__global float* a, __constant float* b, const int c, const float d, const float e, const float f, const float g, const float h, const float i, const float j) {
  int k = get_global_id(0);
  int l = get_global_id(1);
  int m = get_global_id(2);

  int n = get_global_size(0);
  int o = get_global_size(1);
  int p = get_global_size(2);

  float4 q = (float4)(dk, el, fm, 0.f);

  int r = 0;
  int s = c - 1;

  float t = 0.f;

  while (b[3 * r + 2] < q.z - j && r < c - 1)
    r++;

  while (b[3 * s + 2] > q.z + j && s > 0)
    s--;

  float u = 1000000000.f * j;

  for (int v = r; v <= s; v++) {
    float4 w = (float4)vbvb1]vb2],0.f);

    float x = length(q - w);
    u = (x < u) ? x : u;
  }

  t = (u < j) ? (u < h) ? g : i : 0.f;

  a[k + n * l + n * o * m] = t;
}