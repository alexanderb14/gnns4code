__kernel void A(__global float* a, __global float* b, int c, float d, float e, long int f) {
  int g = (get_group_id(0) * get_local_size(0)) + get_local_id(0);
  int h = get_local_id(0);
  int i = get_group_id(0);
  int j = get_num_groups(0) * get_local_size(0);
  int k = get_local_size(0);
  int l = get_num_groups(0);

  for (int m = g; m < f; m += j) {
    float n = a[m], o = 10.0f - n, p = 9.0f - n, q = 9.0f - o, r = 8.0f - n, s = 8.0f - o, t = 7.0f - n, u = 7.0f - o;
    for (int v = 0; v < c; ++v) {
      n = (d - e * n) * n;
      o = (d - e * o) * o;
      p = (d - e * p) * p;
      q = (d - e * q) * q;
      r = (d - e * r) * r;
      s = (d - e * s) * s;
      t = (d - e * t) * t;
      u = (d - e * u) * u;
    }
    a[m] = ((n + o) + (p + q)) + ((r + s) + (t + u));
  }
}

__kernel void B(__global float* a, int b, float c, float d, long int e) {
  int f = (get_group_id(0) * get_local_size(0)) + get_local_id(0);
  int g = get_local_id(0);
  int h = get_group_id(0);
  int i = get_num_groups(0) * get_local_size(0);
  int j = get_local_size(0);
  int k = get_num_groups(0);

  for (int l = f; l < e; l += i) {
    float m = a[l], n = 10.0f - m, o = 9.0f - m, p = 9.0f - n, q = 8.0f - m, r = 8.0f - n, s = 7.0f - m, t = 7.0f - n;
    for (int u = 0; u < b; ++u) {
      m = (c - d * m) * m;
      n = (c - d * n) * n;
      o = (c - d * o) * o;
      p = (c - d * p) * p;
      q = (c - d * q) * q;
      r = (c - d * r) * r;
      s = (c - d * s) * s;
      t = (c - d * t) * t;
    }
    a[l] = ((m + n) + (o + p)) + ((q + r) + (s + t));
  }
}