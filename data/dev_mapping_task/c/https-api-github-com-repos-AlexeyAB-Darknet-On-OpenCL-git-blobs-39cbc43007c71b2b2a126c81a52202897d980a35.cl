float A(__global float* a, int b, int c, int d, int e, int f) {
  if (d < 0 || d >= b || e < 0 || e >= c)
    return 0;
  return a[d + b * (e + f * c)];
}

float3 B(float3 a) {
  float b = a.x;
  float c = a.y;
  float d = a.z;

  float e, f, g;
  float h = (b > c) ? ((b > d) ? b : d) : ((c > d) ? c : d);
  float i = (b < c) ? ((b < d) ? b : d) : ((c < d) ? c : d);
  float j = h - i;
  g = h;
  if (h == 0) {
    f = 0;
    e = -1;
  } else {
    f = j / h;
    if (b == h) {
      e = (c - d) / j;
    } else if (c == h) {
      e = 2 + (d - b) / j;
    } else {
      e = 4 + (b - c) / j;
    }
    if (e < 0)
      e += 6;
  }
  return (float3)(e, f, g);
}

float3 C(float3 a) {
  float b = a.x;
  float c = a.y;
  float d = a.z;

  float e, f, g;
  float h, i, j, k;

  if (c == 0) {
    e = f = g = d;
  } else {
    int l = (int)__clc_floor(b);
    h = b - l;
    i = d * (1 - c);
    j = d * (1 - c * h);
    k = d * (1 - c * (1 - h));
    if (l == 0) {
      e = d;
      f = k;
      g = i;
    } else if (l == 1) {
      e = j;
      f = d;
      g = i;
    } else if (l == 2) {
      e = i;
      f = d;
      g = k;
    } else if (l == 3) {
      e = i;
      f = j;
      g = d;
    } else if (l == 4) {
      e = k;
      f = i;
      g = d;
    } else {
      e = d;
      f = i;
      g = j;
    }
  }
  e = (e < 0) ? 0 : ((e > 1) ? 1 : e);
  f = (f < 0) ? 0 : ((f > 1) ? 1 : f);
  g = (g < 0) ? 0 : ((g > 1) ? 1 : g);
  return (float3)(e, f, g);
}

float D(__global float* a, int b, int c, float d, float e, int f) {
  int g = (int)__clc_floor(d);
  int h = (int)__clc_floor(e);

  float i = d - g;
  float j = e - h;

  float k = (1 - j) * (1 - i) * A(a, b, c, g, h, f) + j * (1 - i) * A(a, b, c, g, h + 1, f) + (1 - j) * i * A(a, b, c, g + 1, h, f) + j * i * A(a, b, c, g + 1, h + 1, f);
  return k;
}

__kernel void E(__global float* a, __global float* b, int c, int d, int e, int f, float g, float h, float i, float j, float k) {
  int l = c * d * e;

  int m = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (m >= l)
    return;
  int n = m % d;
  m /= d;
  int o = m % e;
  m /= e;
  float p = b[0];
  float q = b[1];
  float r = b[2];
  float s = b[8 * m + 0];
  float t = b[8 * m + 1];
  float u = b[8 * m + 2];
  float v = b[8 * m + 3];

  g = s * (g - 1) + 1;
  g = (t > .5f) ? 1.f / g : g;
  h = u * (h - 1) + 1;
  h = (v > .5f) ? 1.f / h : h;

  size_t w = m * e * d * 3;

  float x = a[n + d * (o + e * 0) + w];
  float y = a[n + d * (o + e * 1) + w];
  float z = a[n + d * (o + e * 2) + w];
  float3 aa = (float3)(x, y, z);
  if (f) {
    float3 ab = B(aa);
    ab.y *= g;
    ab.z *= h;
    aa = C(ab);
  } else {
    k = 0;
  }
  a[n + d * (o + e * 0) + w] = aa.x * j + i + (p - .5f) * k;
  a[n + d * (o + e * 1) + w] = aa.y * j + i + (q - .5f) * k;
  a[n + d * (o + e * 2) + w] = aa.z * j + i + (r - .5f) * k;
}

__kernel void F(__global float* a, __global float* b, int c, int d, int e, int f, int g, int h, int i, int j, float k, __global float* l) {
  int m = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (m >= c)
    return;

  float n = f / 2.f;
  float o = e / 2.f;

  int p = m;
  int q = m % h;
  m /= h;
  int r = m % g;
  m /= g;
  int s = m % d;
  m /= d;
  int t = m;

  float u = b[8 * t + 4];
  float v = b[8 * t + 5];
  float w = b[8 * t + 6];
  float x = b[8 * t + 7];

  float y = (f - h) * u;
  float z = (e - g) * v;
  j = (j && (w > .5f));
  k = 2 * k * x - k;
  if (!i) {
    y = (f - h) / 2.f;
    z = (e - g) / 2.f;
    j = 0;
    k = 0;
  }

  a += f * e * d * t;

  float aa = (j) ? f - y - q - 1 : q + y;
  float ab = r + z;

  float ac = cos(k) * (aa - n) - sin(k) * (ab - o) + n;
  float ad = sin(k) * (aa - n) + cos(k) * (ab - o) + o;

  l[p] = D(a, f, e, ac, ad, s);
}