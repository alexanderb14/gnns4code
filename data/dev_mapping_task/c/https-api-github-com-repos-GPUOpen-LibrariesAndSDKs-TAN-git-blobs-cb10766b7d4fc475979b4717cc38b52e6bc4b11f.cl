__kernel void A(__global float* a, int b, int c, int d, int e, int f, __global float* g, __global float* h) {
  int i = get_group_id(0);
  int j = get_local_id(0);
  int k = get_num_groups(0);
  int l = get_local_size(0);

  int m = i * l;
  int n = m + l;

  if (n > d)
    n = d;
  for (int o = m; o < n; o++) {
    h[o] = 0.0;
    for (int p = e; p < f; p++) {
      h[o] += a[(c + o - p + b) % b] * g[p];
    }
  }
}