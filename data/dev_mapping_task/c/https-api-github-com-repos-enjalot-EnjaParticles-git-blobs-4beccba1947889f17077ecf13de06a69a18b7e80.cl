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

__kernel void A(int a, __global float4* b, __global float4* c, float4 d, float4 e) {
  unsigned int f = get_global_id(0);
  if (f >= a)
    return;

  float4 g = 0.05;

  float4 h = g * (b[f] - d);
  c[f] = (float4)(h.y * h.z * eh.z * h.x * e h.x * h.y * e1.);
}