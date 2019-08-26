__kernel void A(__global uint* a, __global uint* b, int c, int d) {
  int e = get_global_id(0);

  if (e > c - 1)
    return;

  uint f = a[e];

  uint g = b[d + d + d + f];
  float h = ((float)b[f]) / g;
  float i = ((float)b[d + f]) / g;
  float j = ((float)b[d + d + f]) / g;

  a[e] = 0xFF000000 | ((int)j << 16) | ((int)i << 8) | ((int)h);
}

__kernel void B(__global uint* a, __global uint* b, __global uint* c, int d, int e)

{
  int f = get_global_id(0);

  if (f > d - 1)
    return;

  uint g = a[f];
  uint h = g & 0XFF;
  uint i = (g >> 8) & 0XFF;
  uint j = (g >> 16) & 0XFF;

  uint k = b[f];

  atomic_add(&c[k], h);
  atomic_add(&c[e + k], i);
  atomic_add(&c[e + e + k], j);
  atomic_add(&c[e + e + e + k], 1);
}

__kernel void C(__global uint* a, __global int* b, __global float* c, __global uint* d, int e, int f, int g)

{
  int h = get_global_id(0);
  int i = get_global_id(1);
  int j = f * g;
  int k = i * f + h;

  if (k > j - 1)
    return;

  int l = b[k];

  int m = 0;
  while (l != b[l]) {
    l = b[l];
    m++;

    if (m == e)
      break;
  }

  d[k] = 0xFF000000 | l;
}

__kernel void D(__global uint* a, __global float* b, __global int* c, __global float* d, int e, int f, int g, int h)

{
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = g * h;
  int l = j * g + i;

  if (l > k - 1)
    return;

  float m = 0x1.fffffep127f;
  int n = l;

  int o = max(0, i - f);
  int p = max(0, j - f);
  int q = min(g, i + f);
  int r = min(h, j + f);

  float s = b[l];
  uint t = a[l];
  uint u = t & 0XFF;
  uint v = (t >> 8) & 0XFF;
  uint w = (t >> 16) & 0XFF;

  for (int x = p; x < r; x++) {
    for (int y = o; y < q; y++) {
      int z = x * g + y;

      if (b[z] <= s || l == z)
        continue;

      float aa = 0;

      int ab = i - y;
      int ac = j - x;

      aa = ab * ab + ac * ac;

      uint ad = a[z];
      int ae = (ad & 0XFF) - u;
      int af = ((ad >> 8) & 0XFF) - v;
      int ag = ((ad >> 16) & 0XFF) - w;

      aa += ae * ae + af * af + ag * ag;

      if (aa <= e && aa < m) {
        m = aa;
        n = z;
      }
    }
  }

  c[l] = n;
  d[l] = m;
}

__kernel void E(__global uint* a, __global float* b, float c, int d, int e, int f)

{
  int g = get_global_id(0);
  int h = get_global_id(1);
  int i = e * f;
  int j = h * e + g;

  if (j > i - 1)
    return;

  int k = max(0, g - d);
  int l = max(0, h - d);
  int m = min(e, g + d);
  int n = min(f, h + d);

  float o = 0;

  uint p = a[j];
  uint q = p & 0XFF;
  uint r = (p >> 8) & 0XFF;
  uint s = (p >> 16) & 0XFF;

  float t = 2 * c * c;

  for (int u = l; u < n; u++) {
    for (int v = k; v < m; v++) {
      int w = u * e + v;

      float x = 0;

      int y = g - v;
      int z = h - u;

      x += y * y + z * z;

      uint aa = a[w];
      int ab = (aa & 0XFF) - q;
      int ac = ((aa >> 8) & 0XFF) - r;
      int ad = ((aa >> 16) & 0XFF) - s;

      x += ab * ab + ac * ac + ad * ad;

      float ae = -exp(-x / t);

      o += -ae;
    }
  }

  b[j] = o / ((m - k) * (n - l));
}