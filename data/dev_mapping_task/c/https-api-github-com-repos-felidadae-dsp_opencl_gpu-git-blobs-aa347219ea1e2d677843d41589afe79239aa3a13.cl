__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, __global unsigned int* g) {
  unsigned int h = g[0];
  unsigned int i = g[1];
  unsigned int j = g[2];
  unsigned int k = g[3];
  unsigned int l = g[4];

  unsigned int m = get_global_id(0);

  unsigned int n = m / h;
  unsigned int o = m % h;

  unsigned int p = o % (k * h);

  unsigned int q = n * h + o;
  unsigned int r = l;
  unsigned int s = (r * h * i) + q;

  float t = 0, u = 0;

  for (unsigned int v = 0; v < j; ++v) {
    float w = a[p];
    float x = b[p];

    float y = c[s];
    float z = d[s];

    t += y * w - z * x;
    u += z * w + y * x;

    p += h * i;
    r = (r - 1 + j) % j;
    s = (r * h * i) + q;
  }

  e[m] = t;
  f[m] = u;
}