__kernel void A(__global float4* a, __global float4* b) {
  int c = get_global_id(0);

  a[c] = (float4)(0x1.fffffep127f);
  b[c] = (float4)(-0x1.fffffep127f);
}

__kernel void B(__global const float4* a, __global float4* b, __global float4* c, __local float4* d, __local float4* e, int f) {
  int g = get_global_id(0);
  int h = get_global_size(0);
  int i = get_local_id(0);
  int j = get_local_size(0);
  float4 k = (float4)(0x1.fffffep127f);
  float4 l = (float4)(-0x1.fffffep127f);
  float4 m;
  float4 n, o;
  int p;

  for (p = g; p < f; p += h) {
    m = a[p];
    k = min(k, m);
    l = max(l, m);
  }

  d[i] = k;
  e[i] = l;

  barrier(1);

  for (p = j / 2; p > 0; p >>= 1) {
    if (i < p) {
      n = d[i + p];
      o = d[i];
      d[i] = min(n, o);

      n = e[i + p];
      o = e[i];
      e[i] = max(n, o);
    }
    barrier(1);
  }
  if (i == 0) {
    b[get_group_id(0)] = d[0];
    c[get_group_id(0)] = e[0];
  }

  if (g == 0) {
    int q = h / j;
    for (p = q; p < j; p++) {
      b[p] = (float4)(0x1.fffffep127f);
      c[p] = (float4)(-0x1.fffffep127f);
    }
  }
}

__kernel void C(__global float4* a, __global float4* b, __global float4* c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_local_size(0);
  float4 g, h;
  int i;

  for (i = f / 2; i > 0; i >>= 1) {
    if (e < i) {
      g = a[e + i];
      h = a[e];
      a[d] = min(g, h);

      g = b[e + i];
      h = b[e];
      b[d] = max(g, h);
    }
    barrier(2);
  }
  if (e == 0) {
    c[0] = a[d];
    c[1] = b[d];
  }
}

__kernel void D(__global const float4* a, __global float4* b, float4 c, float4 d) {
  int e = get_global_id(0);
  float4 f = a[e];

  f = (f - c) / d;

  b[e] = f;
}