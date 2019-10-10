typedef float4 keypoint; typedef struct t_keypoint {
  keypoint kp;
  unsigned char desc[128];
} t_keypoint;
__kernel void A(__global t_keypoint* a, __global t_keypoint* b, __global int2* c, __global int* d, int e, float f, int g, int h) {
  int i = get_global_id(0);
  if (!(0 <= i && i < g))
    return;

  float j = 1000000000000.0f, k = 1000000000000.0f;
  int l = 0;
  int m;

  unsigned char n[128];
  for (int o = 0; o < 128; o++)
    n[o] = ((a[i]).desc)[o];

  for (int o = 0; o < h; o++) {
    int p = 0;
    for (int q = 0; q < 128; q++) {
      unsigned char r = n[q], s = ((b[o]).desc)[q];
      p += ((r > s) ? (r - s) : (-r + s));
    }

    if (p < j) {
      k = j;
      j = p;
      l = o;
    } else if (p < k) {
      k = p;
    }
  }

  if (k != 0 && j / k < f) {
    int2 t = 0;
    t.s0 = i;
    t.s1 = l;
    m = atomic_add(d, 1);
    if (m < e)
      c[m] = t;
  }
}
__kernel void B(__global t_keypoint* a, __global t_keypoint* b, __global char* c, int d, int e, __global int2* f, __global int* g, int h, float i, int j, int k) {
  int l = get_global_id(0);
  if (!(0 <= l && l < j))
    return;

  float m = 1000000000000.0f, n = 1000000000000.0f;
  int o = 0;
  int p;

  keypoint q = a[l].kp;
  int r = q.s0, s = q.s1;

  if (s < e && r < d && c[s * d + r] == 0)
    return;

  unsigned char t[128];
  for (int u = 0; u < 128; u++)
    t[u] = ((a[l]).desc)[u];

  for (int u = 0; u < k; u++) {
    int v = 0;
    for (int w = 0; w < 128; w++) {
      q = b[u].kp;
      r = q.s0, s = q.s1;
      if (s < e && r < d && c[s * d + r] != 0) {
        unsigned char x = t[w], y = ((b[u]).desc)[w];
        v += ((x > y) ? (x - y) : (-x + y));
      }
    }

    if (v < m) {
      n = m;
      m = v;
      o = u;
    } else if (v < n) {
      n = v;
    }
  }

  if (n != 0 && m / n < i) {
    int2 z = 0;
    z.s0 = l;
    z.s1 = o;
    p = atomic_add(g, 1);
    if (p < h)
      f[p] = z;
  }
}