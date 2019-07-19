__constant float Ga = 0.000000000066742; __kernel void A(__global float4* a, __global float4* b, __global float* c, __global float4* d, float e) {
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_size(0);

  float4 h = a[f];
  float4 i = d[f];
  float j = c[f];

  float4 k = (float4)(0, 0, 0, 0);

  if (j == 0)
    return;

  for (int l = 0; l < g; l++) {
    if (c[l] == 0 || l == f)
      continue;

    float4 m = a[l] - h;
    float n = dot(m, m);

    if (n <= 0)
      continue;

    if (n > 0.01) {
      float o = Ga * c[l] / n;
      k += normalize(m) * o;
    }

    if (

        n < 0.0001 && c[f] < c[l]) {
      c[l] += c[f];

      d[l] += d[f] * c[f] / c[l];

      c[f] = 0;
      return;
    }
  }

  i += k * e;
  i.w = 1;

  h += i * e;
  h.w = 1;

  a[f] = h;
  d[f] = i;
}