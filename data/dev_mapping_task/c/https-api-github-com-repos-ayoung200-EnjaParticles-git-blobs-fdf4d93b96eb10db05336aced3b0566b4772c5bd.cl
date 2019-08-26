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

__kernel void A(int a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, __global float4* f, __global float4* g, __global float4* h, __global float4* i, __global float* j, __global float* k, __global uint* l, __global uint* m,

                __global uint* n) {
  uint o = get_global_id(0);

  if (o >= a)
    return;

  uint p = n[o];
  c[o] = b[p];
  e[o] = d[p];
  g[o] = f[p];
  i[o] = h[p];
  k[o] = j[p];
  m[o] = l[p];
}

__kernel void B(int a, __global float4* b, __global float4* c, __global uint* d) {
  uint e = get_global_id(0);
  if (e >= a)
    return;
  uint f = d[e];
  c[e] = b[f];
}