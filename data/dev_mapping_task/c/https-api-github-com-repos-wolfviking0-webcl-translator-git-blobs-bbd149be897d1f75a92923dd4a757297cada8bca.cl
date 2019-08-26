__kernel void A(__global float4* a, __global float4* b, __global float* c, float4 d, float4 e, float4 f, float4 g, float h, float i) {
  int j = get_global_id(0);

  float4 k = a[j];

  const float l = 30.;

  c[j] -= i;
  if (c[j] < 0) {
    c[j] = l;
    float m = 0.005 * (((float)j) / 10000. + 100.);
    int n = j % 10000;
    float o = 0.02 * 3.14159 * (j % 100);
    n = n / 100;
    float p = 0.01 * 3.14159 * ((float)n);
    float q = sin(p);
  float4 r = (float4)(momom*cos(p0);
  k = f+100.0f*g+0.2f*r;
  }

  float4 s = (float4)(e * (k - k), k * (e - k) - k, k * k - e * k, 0);

  a[j] = k + s * (i * e.w);

  b[j] = d + 0.1f * fast_normalize(s);

  const float t = 1.0;
  const float u = 1.0;

  if (c[j] < t) {
    b[j].w *= c[j] / t;
  } else if (c[j] > l - u) {
    float v = (l - c[j]) / u;
    b[j].w *= 2.0 * (1.0 - 4.0 * (v - 0.5) * (v - 0.5)) + v;
  }
}