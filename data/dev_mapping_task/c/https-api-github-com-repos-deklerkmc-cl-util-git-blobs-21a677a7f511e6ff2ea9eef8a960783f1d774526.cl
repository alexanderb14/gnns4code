uint A(float a, float b, float c); float4 B(float4 a); __kernel void C(int a, __global int* b, sampler_t c, __read_only image2d_t d, __global uint* e) {
  int f = get_global_id(0);

  if (f > a - 1)
    return;

  int g = b[f];
  int h = g % get_image_width(d);
  int i = g / get_image_width(d);
 uint4 j = read_imageui(d, c, (int2) (h i);
 e[f] = 0xFF000000 | j.x | (j.y << 8) | (j.z << 16);
}

__kernel void D(__global uint* a, __constant float4* b, __local float4* c, int d, int e, int f, __global float* g

                ) {
  int h = d * e;
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = j * d + i;

  int l = get_group_id(0);
  int m = get_group_id(1);
  int n = get_num_groups(0);
  int o = get_num_groups(1);
  int p = n * o;

  int q = get_local_size(0);
  int r = get_local_size(1);
  int s = q * r;
  int t = get_local_id(0);
  int u = get_local_id(1);
  int v = u * q + t;

  if (v < f * 2) {
    c[v] = b[v];
  }
  barrier(1);

  if (k > h - 1)
    return;

  uint w = a[k];

  float4 x = (float4)(1, w & 0x000000FF, (w & 0x0000FF00) >> 8, (w & 0x00FF0000) >> 16);

  float4 y = x * x;
  y[0] = 0;

  float z[8];

  for (int aa = 0; aa < f; aa++) {
    int ab = aa * 2;
    float4 ac = c[ab];

    z[aa] = dot(ac, x);
    ac = c[ab + 1];

    z[aa] += dot(ac, y);
  }

  float ad = z[0];

  for (int aa = 1; aa < f; aa++) {
    if (z[aa] > ad)
      ad = z[aa];
  }

  float ae = 0;
  for (int aa = 0; aa < f; aa++) {
    ae += exp(z[aa] - ad);
  }

  g[k] = -(ad + log(ae));
}

__kernel void E(__global uint* a, __global uint* b, uint c, int d, int e, int f, int g) {
  int h = get_global_id(0);
  int i = get_global_size(1);

  int j = (e - d) * (g - f);

  if (h > j - 1)
    return;
}