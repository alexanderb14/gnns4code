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

__kernel void A(int a, __global uint* b, __global uint* c, __global uint* d, __global uint* e,

                __constant struct GridParams* f, __local uint* g) {
  uint h = get_global_id(0);

  uint i = f->nb_cells;

  uint j = b[h];

  if (j > i) {
    return;
  }

  uint k = get_local_id(0);

  g[k + 1] = j;

  if (h > 0 && k == 0) {
    uint l = b[h - 1] < i ? b[h - 1] : i;
    g[0] = l;
  }

  barrier(1);
  if (h >= a)
    return;

  if (h == 0) {
    d[j] = h;
  }

  if (h > 0) {
    if (g[k] != j) {
      d[j] = h;
      e[g[k]] = h;
    }
  }

  if (h == a - 1) {
    e[j] = h + 1;
  }
}