__kernel void A(__global float4* a, __global float4* b, __global float4* c, __global float4* d, int e, int f, float g, float h) {
  unsigned int i = get_global_id(0);
  int j;
  float k;

  d[i].xyz = c[i].xyz;
  c[i] = a[i];

  for (int l = 0; l < e; l++) {
    j = i + (l + 1) * f;

    k = d[j].w - g / e;
    if (k <= 0) {
      a[j] = c[i];
      b[j] = b[i];
      k = e * g;
    }
    a[j].z += h;

    a[j].w = 1.;
    d[j].w = k;
  }
}