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

__kernel void A(int a, float b, __global float4* c, __global float4* d, __global float4* e, __global uint* f, __global float4* g, __global int4* h) {
  unsigned int i = get_global_id(0);
  if (i >= a)
    return;

  float j = e[i].w;

  j += b;

  if (j <= 0.f) {
    j = 0.f;
  }
  if (j >= 3.14) {
    j = 3.14f;
    c[i] = (float4)(100.0f, 100.0f, 100.0f, 1.0f);
  }
  float k = sin(j);

  e[i].x = k;
  e[i].y = k;
  e[i].z = k;
  e[i].w = j;

  d[i] = e[i];
}