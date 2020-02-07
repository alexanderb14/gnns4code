kernel void A(const int a, const global float* b, int c, const int d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m, global float* n, int o) {
  global const float* p = b + c;
  global float* q = n + o;

  for (int r = get_group_id(0) * get_local_size(0) + get_local_id(0); r < (a); r += get_local_size(0) * get_num_groups(0)) {
    int s = r % m;
    r /= m;
    int t = r % l;
    int u = r / l;
    int v = u * f * g;
    int w = t * j - h;
    int x = s * k - i;
    q += (v * l + t) * m + s;
    p += (u * d + w) * e + x;
    for (int y = 0; y < f; ++y) {
      for (int z = 0; z < g; ++z) {
        int aa = w + y;
        int ab = x + z;
        *q = (aa >= 0 && ab >= 0 && aa < d && ab < e) ? p[y * e + z] : 0;
        q += l * m;
      }
    }
  }
}

kernel void B(const int a, global const float* b, int c, const int d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m, const int n, global float* o, int p) {
  global float* q = o + p;
  global const float* r = b + c;

  for (int s = get_group_id(0) * get_local_size(0) + get_local_id(0); s < (a); s += get_local_size(0) * get_num_groups(0)) {
    float t = 0;
    int u = s % e + j;
    int v = (s / e) % d + i;
    int w = s / (e * d);

    int x = (u < h) ? 0 : (u - h) / l + 1;
    int y = min(u / l + 1, n);
    int z = (v < g) ? 0 : (v - g) / k + 1;
    int aa = min(v / k + 1, m);
    int ab = (w * g * h + v * h + u) * m * n;
    int ac = (1 - k * h * m) * n;
    int ad = (1 - l * m * n);
    for (int ae = z; ae < aa; ++ae) {
      for (int af = x; af < y; ++af) {
        t += r[ab + ae * ac + af * ad];
      }
    }
    q[s] = t;
  }
}