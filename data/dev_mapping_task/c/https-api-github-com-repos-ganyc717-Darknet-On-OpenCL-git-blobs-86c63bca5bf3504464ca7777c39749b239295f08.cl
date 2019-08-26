__kernel void A(int a, int b, int c, int d, int e, int f, int g, __global float* h, __global float* i, __global int* j) {
  int k = (b + 2 * g) / e;
  int l = (c + 2 * g) / e;
  int m = d;

  int n = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (n >= a)
    return;

  int o = n % l;
  n /= l;
  int p = n % k;
  n /= k;
  int q = n % m;
  n /= m;
  int r = n;

  int s = -g;
  int t = -g;

  int u = o + l * (p + k * (q + m * r));
  float v = -__builtin_inff();
  int w = -1;
  int x, y;
  for (x = 0; x < f; ++x) {
    for (y = 0; y < f; ++y) {
      int z = t + p * e + x;
      int aa = s + o * e + y;
      int ab = aa + c * (z + b * (q + r * d));
      int ac = (z >= 0 && z < b && aa >= 0 && aa < c);
      float ad = (ac != 0) ? h[ab] : -__builtin_inff();
      w = (ad > v) ? ab : w;
      v = (ad > v) ? ad : v;
    }
  }
  i[u] = v;
  j[u] = w;
}

__kernel void B(int a, int b, int c, int d, int e, int f, int g, __global float* h, __global float* i, __global int* j) {
  int k = (b + 2 * g) / e;
  int l = (c + 2 * g) / e;
  int m = d;
  int n = (f - 1) / e;

  int o = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (o >= a)
    return;

  int p = o;
  int q = o % c;
  o /= c;
  int r = o % b;
  o /= b;
  int s = o % d;
  o /= d;
  int t = o;

  int u = -g;
  int v = -g;

  float w = 0;
  int x, y;
  for (x = -n; x < n + 1; ++x) {
    for (y = -n; y < n + 1; ++y) {
      int z = (q - u) / e + y;
      int aa = (r - v) / e + x;
      int ab = z + l * (aa + k * (s + m * t));
      int ac = (z >= 0 && z < l && aa >= 0 && aa < k);
      w += (ac && j[ab] == p) ? h[ab] : 0;
    }
  }
  i[p] += w;
}