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

__kernel void A(int a, __global float4* b, int c, __global float4* d, __global uint* e, uint f, uint g

                ) {
  uint h = get_global_id(0);
  if (h >= c)
    return;
  uint i = e[h];
  d[(h * g) + f] = (float)(i < a) * b[i];
}