struct GridParams {
  float4 grid_size;
  float4 grid_min;
  float4 grid_max;
  float4 bnd_min;
  float4 bnd_max;

  float4 grid_res;
  float4 grid_delta;

  int nb_cells;
};
int4 A(float4 a, float4 b, float4 c) {
  float4 d;
  d.x = (a.x - b.x) * c.x;
  d.y = (a.y - b.y) * c.y;
  d.z = (a.z - b.z) * c.z;
  d.w = (a.w - b.w) * c.w;

  int4 e;
  e.x = (int)d.x;
  e.y = (int)d.y;
  e.z = (int)d.z;
  e.w = (int)d.w;
  return e;
}

int B(int4 a, float4 b, bool c

      ) {
  int d;
  int e;
  int f;

  if (c) {
    int g = (int)__clc_floor(b.x);
    int h = (int)__clc_floor(b.y);
    int i = (int)__clc_floor(b.z);

    d = a.x % g;
    e = a.y % h;
    f = a.z % i;
    if (d < 0)
      d += g;
    if (e < 0)
      e += h;
    if (f < 0)
      f += i;
  } else {
    d = a.x;
    e = a.y;
    f = a.z;
  }
  return (f * b.y + e) * b.x + d;
}
__kernel void C(

    int a, __global float4* b, __global uint* c, __global uint* d,

    __constant struct GridParams* e, __global float4* f, __global int4* g

    ) {
  uint h = get_global_id(0);

  if (h >= a)
    return;
  float4 i = b[h];

  int4 j = A(i, e[0].grid_min, e[0].grid_delta);
  bool k = false;

  int l = B(j, e[0].grid_res, k);

  g[h].xyz = j.xyz;
  g[h].w = l;

  l = l > e[0].nb_cells ? e[0].nb_cells : l;
  l = l < 0 ? e[0].nb_cells : l;
  c[h] = (uint)l;

  d[h] = h;
}