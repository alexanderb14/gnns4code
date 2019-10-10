__kernel void A(__global const float* a, __global const float* b, __global float* c, int d, int e, int f, int g, int h, int i, int j) {
  int k = get_local_id(0);
  int l = get_group_id(0);
  int m = get_group_id(1);
  __local float n[64 + 32];
  n[k] = 0;
  n[64 + k / 2] = 0;
  barrier(1);
  int o = mul24(g, m);
  int p = mul24(h, m);
  int q, r;
  int s, t;

  float u = 0;
  for (q = k, r = l - k + mul24(f, e); q < d; q += 64, r -= 64) {
    r = (r < 0) ? g + r : r;
    s = p + q;
    t = o + r;
    u += b[s] * a[t];
  }

  n[k] = u;
  barrier(1);
  for (int v = 32; v > 0; v >>= 1) {
    u += n[k + v];
    n[k] = u;
    barrier(1);
  }

  int w = mad24(j, m, i);
  if (k == 0) {
    c[w + l] = u;
  }
}