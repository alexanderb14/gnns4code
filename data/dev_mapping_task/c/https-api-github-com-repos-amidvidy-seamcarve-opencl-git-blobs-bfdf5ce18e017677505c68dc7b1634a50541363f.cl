__kernel void A(__global float* a, __global float* b, __global int* c, __local float* d, __local float* e, int f, int g, int h, int i) {
  const int j = get_local_id(0);
  const int k = get_local_size(0);

  const int l = g - 1;
  int m = 0;
  float n = 0x1.fffffep127f;

  for (int o = j; o < (f - i); o += k) {
    float p = (a)[((l)*h + (o))];

    if (p < n) {
      n = p;
      m = o;
    }
  }

  d[j] = m;
  e[j] = n;

  for (uint q = k / 2; q > 0; q >>= 1) {
    barrier(1);
    if (j < q) {
      float r = e[j];
      float s = e[j + q];
      if (s < r) {
        e[j] = s;
        d[j] = d[j + q];
      }
    }
  }

  if (j == 0) {
    *b = e[0];
    *c = d[0];
  }
}