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

__kernel void A(int a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, __global float4* f, __global float4* g, __global float4* h, __global float4* i, __global uint* j) {
  uint k = get_global_id(0);

  if (k >= a)
    return;

  uint l = j[k];
  c[k] = b[l];
  e[k] = d[l];
  g[k] = f[l];
  i[k] = h[l];
}