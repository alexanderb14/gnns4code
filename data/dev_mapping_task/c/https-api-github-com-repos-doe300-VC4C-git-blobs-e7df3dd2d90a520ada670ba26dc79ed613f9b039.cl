typedef unsigned char fixed8; kernel void A(global short* a, const global unsigned char* b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l) {
  int m = get_global_id(0);
  int n = get_global_id(1);

  int o = get_global_size(0);
  int p = get_global_size(1);
  int q = 0;
  int r = 0;
  int s = q >> 16;
  int t = (q & 0xFFFF) >> 9;
  a[n * i + m] = (b[n * k + s] << 7) + (b[n * k + s + 1] - b[n * k + s]) * t;
  int u = n + (p);
  a[u * i + m] = (b[u * k + s] << 7) + (b[u * k + s + 1] - b[u * k + s]) * t;

  int v = m * c >> 16;
  if (v >= g - 1) {
    a[n * i + m] = b[n * k + g - 1] * 128;
    a[u * i + m] = b[u * k + g - 1] * 128;
  }

  int w = m + (o);
  s = r >> 16;
  t = (r & 0xFFFF) >> 9;
  a[n * i + w] = (b[n * k + s] << 7) + (b[n * k + s + 1] - b[n * k + s]) * t;
  a[u * i + w] = (b[u * k + s] << 7) + (b[u * k + s + 1] - b[u * k + s]) * t;
  v = w * c >> 16;
  if (v >= g - 1) {
    a[n * i + w] = b[n * k + g - 1] * 128;
    a[u * i + w] = b[u * k + g - 1] * 128;
  }

  int x = 0;
  x = d * m;
  s = x >> 16;
  t = (x & 0xFFFF) >> 9;
  b += k * h;
  a += i * f;
  a[n * (j) + m] = (b[n * (l) + s] * (t ^ 127) + b[n * (l) + s + 1] * t);
  v = m * c >> 16;
  if (v >= (g >> 1) - 1) {
    a[n * (j) + m] = b[n * (l) + (g >> 1) - 1] * 128;
  }

  x = d * (m);
  s = x >> 16;
  b += l * h >> 1;
  a += (j * p);
  a[n * (j) + m] = (b[n * (l) + s] * (t ^ 127) + b[n * (l) + s + 1] * t);

  if (v >= (g >> 1) - 1) {
    a[n * (j) + m] = b[n * (l) + (g >> 1) - 1] * 128;
  }
}