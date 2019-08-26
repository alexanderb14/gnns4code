kernel void A(global float4* a, global float4* b, global float4* c, global float4* d, float e) {
  int f = get_global_id(0);

  float4 g = a[f];
  float4 h = b[f] - pown(g, 2);
  float4 i = h / (h + e);

  c[f] = i;
  d[f] = (1.f - i) * g;
}
kernel void B(global float4* a, global float4* b, global float4* c, global float4* d, int e, float f) {
  int g = get_global_id(0);

  float4 h = a[g];
  float4 i = b[g] * h + c[g];

  int4 j = isequal(h, 0.f) * e;
  float4 k = ((j) ? (0.f) : (i));

  d[g] = f * k;
}
kernel void C(global float4* a, global float4* b, global float4* c, global float4* d, global float4* e, global float4* f) {
  int g = get_global_id(0);

  float4 h = c[g];

  e[g] = a[g] - h * h;
  f[g] = b[g] - h * d[g];
}
kernel void D(global float4* a, global float4* b, global float4* c, global float4* d, global float4* e, global float4* f, float g) {
  int h = get_global_id(0);

  float4 i = b[h] / (a[h] + g);

  e[h] = i;
  f[h] = d[h] - i * c[h];
}