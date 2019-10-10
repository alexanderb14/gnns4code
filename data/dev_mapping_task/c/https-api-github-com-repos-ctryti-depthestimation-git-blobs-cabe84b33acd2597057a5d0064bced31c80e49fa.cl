__kernel void A(const __global uchar* a, const __global uchar* b, __global uchar* c, __global uchar* d, const __global uchar* e, const __global uchar* f, __local uchar* g, __local uchar* h, const int i, const int j, __global uchar* k, const int l, const int m, const int n, const int o, const int p, const int q) {
  int2 r;
  int2 s;
  r.x = get_global_id(0);
  r.y = get_global_id(1);
  s.x = get_local_id(0);
  s.y = get_local_id(1);
  int t = 0;
  int u = 0;
  uint v = -1;
  uint w = -1;
  uchar x = 0;
  uchar y = 0;

  int z = 0;
  int aa = 0;
  int ab = 0;

  for (z = 0; z < j; z += get_local_size(1)) {
    for (aa = 0; aa < i; aa += get_local_size(0)) {
      g[(s.y + z) * i + (s.x + aa)] = a[((r.y - p + z) * n) + r.x - p + aa];

      h[(s.y + z) * i + (s.x + aa)] = b[((r.y - p + z) * n) + r.x - p + aa - o];
    }
  }

  barrier(1);

  for (ab = 0; ab < o; ab++) {
    for (z = 0; z < q; z++) {
      for (aa = 0; aa < q; aa++) {
        u += abs(g[((s.y + z) * i) + s.x + aa] - h[((s.y + z) * i) + s.x + aa - ab + o]);
      }
    }

    if (u < v) {
      v = u;
      x = ab;
    }
    u = 0;
  }

  for (ab = 0; ab < o; ab++) {
    for (z = 0; z < q; z++) {
      for (aa = 0; aa < q; aa++) {
        t += abs(h[((s.y + z) * i) + s.x + aa + o] - g[((s.y + z) * i) + s.x + aa + ab]);
      }
    }

    if (t < w) {
      w = t;
      y = ab;
    }
    t = 0;
  }

  barrier(1);

  if (r.x < l && r.y < m) {
    c[r.y * l + r.x] = x;
    d[r.y * l + r.x] = y;
  }
}