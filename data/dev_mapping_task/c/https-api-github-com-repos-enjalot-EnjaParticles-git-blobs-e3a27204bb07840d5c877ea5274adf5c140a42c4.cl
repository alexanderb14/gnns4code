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
__kernel void A(int a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, __global float4* f, __global float4* g,

                __global int* h, __constant struct SPHParams* i, float j) {
  unsigned int k = get_global_id(0);

  if (k >= a)
    return;

  float4 l = c[k];
  float4 m = g[k];

  l += j * m;

  l.w = 1.0f;

  uint n = h[k];

  b[n] = (float4)(l.xyz, 1.);
  d[n] = e[k];
  f[n] = g[k];
  return;
}