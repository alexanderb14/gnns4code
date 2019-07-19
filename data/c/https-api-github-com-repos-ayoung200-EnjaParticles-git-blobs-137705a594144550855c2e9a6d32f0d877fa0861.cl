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

__kernel void A(int a, int b, __global float4* c, __global float* d, __global float* e, __global float4* f, __global float4* g, float h) {
  uint i = get_global_id(0);
  if (i >= a)
    return;
  for (int j = 0; j < b; j++) {
    float4 k = h * (c[j] - f[i]);
    k.w = 0.0f;
    float4 l = fast_normalize(k);
    float m = dot(k, k);
    float n = e[j] * d[j];
    float o = 0.5f * h;
    o *= o;
    if (m < o)
      n /= -o;
    else
      n /= m;
    g[i] += (n * l);
  }
}

__kernel void B(int a, int b, __global float4* c, __global float* d, __global float* e, __global float4* f, __global float* g, __global float4* h, float i) {
  uint j = get_global_id(0);
  if (j >= a)
    return;
  for (int k = 0; k < b; k++) {
    float4 l = i * (c[k] - f[j]);
    l.w = 0.0f;
    float4 m = fast_normalize(l);
    float n = dot(l, l);
    float o = e[k] * d[k];
    float p = 0.5f * i;
    p *= p;
    if (n < p)
      o /= -p;
    else
      o /= n;
    h[j] += (o * m.xyzw) * g[j];
  }
}