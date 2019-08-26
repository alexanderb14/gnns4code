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

__kernel void A(int a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, __global uint* f) {
  uint g = get_global_id(0);

  if (g >= a)
    return;
  uint h = f[g];

  c[g] = b[h];
  e[g] = d[h];
}