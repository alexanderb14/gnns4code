inline float2 A(float2 a, float b, float c) {
 return (float2)(
  dot(aloat2)(b, -c)),
  dot(aloat2)(c, b))
 );
}

__kernel void B(__global const float2* a, __global float2* b, int c, __global const int* d, float e) {
  int f = get_global_id(0);
  if (f >= c)
    return;

  int g = d[f];
  b[f] = a[g] * e;
}

__kernel void C(int a, __global float2* b) {
  int c = get_global_id(0);
  float d = -3.14159265359f * 2 * c / (float)a;
  float e, f = sincos(d, &e);
  b[c] = (float2)(e, f);
}
__kernel void D(__global float2* a, int b, __global float2* c, int d) {
  int e = get_global_id(0);
  int f = b / 2;
  int g = get_global_id(1) * b;

  float2 h = c[e];
  float i = h.x, j = h.y;
  if (d)
    j = -j;

  int k = g + e;
  int l = k + f;
  float2 m = a[k];
  float2 n = a[l];

  float2 o = A(n, i, j);
  a[k] = m + o;
  a[l] = m - o;
}