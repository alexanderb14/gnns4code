kernel void A(global float4* a, global float4* b, global float4* c, global float4* d, global float4* e, global float4* f, float g) {
  int h = get_global_id(0);

  bool i = 0 < a[h].x;
  if (i) {
    return;
  }

  float j = a[h].y;
  float4 k = b[h] / j;
  float l = 0.5 * g * g;
  e[h] = c[h] + d[h] / g + k * l;
  f[h] = d[h] + k / g;
}