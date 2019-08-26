__kernel void A(__global const ushort* a, __global const int* b, __global const int* c, __global const float* d, __global float3* e, __global const float* f, __global const float* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const float j = *f;
  const float k = *g;

  const int l = 8;
  int m = *b;
  int n = *c;
  float o = *d;

  int p = max(h - l, 0);
  int q = max(i - l, 0);
  int r = min(h + l, m);
  int s = min(i + l, n);

  int t = m * i + h;

  float u = 0;
  float v = 0;

  float w = a[t];

  float x = j * j;
  float y = k * k;

  if (w != 0) {
    for (int z = p; z < r; z++) {
      for (int aa = q; aa < s; aa++) {
        float ab = (float)((h - z) * (h - z) + (i - aa) * (i - aa));

        int ac = m * aa + z;
        float ad = a[ac];
        float ae = (w - ad) * (w - ad);
        float af = exp(-(ab / x + ae / y));
        u += af * ad;
        v += af;
      }
    }
    float ag = u / v;

    e[t].x = ag * (h - m / 2) / o;
    e[t].y = ag * (i - n / 2) / o;
    e[t].z = ag;

  } else {
    e[t].x = __builtin_nanf("");
    e[t].y = __builtin_nanf("");
    e[t].z = __builtin_nanf("");
  }
}

__kernel void B(__global const int* a, __global const int* b, __global const float3* c, __global float3* d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);
  int g = *a;
  int h = *b;

  int i = g * f + e;

  float3 j = (e < (g - 1)) ? c[g * f + e + 1] : c[g * f + e - 1];
  float3 k = (f < (h - 1)) ? c[g * (f + 1) + e] : c[g * (f - 1) + e];

  float3 l = c[i];
  d[i] = normalize((isnan(j) || isnan(k) || isnan(l)) ? __builtin_nanf("") : cross(j - l, k - l));
}