__kernel void A(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);

  float g = 0.f;
  float h = 0.f;
  int i = d - c / 2;

  const int j = ((d - c / 2) < 0) ? c / 2 - d : 0;
  const int k = ((d + c / 2) >= f) ? c - (d + c / 2 - f + 1) : c;

  for (int l = j; l < k; ++l) {
    float m = exp((float)(-10.f * (l - c / 2.f) * (l - c / 2.f) / c / c));
    h += m;
    g += m * a[i + l + e * f];
  }

  b[d + e * f] = g / h;
}

__kernel void B(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);
  int g = get_global_size(1);

  float h = 0.f;
  float i = 0.f;

  int j = e - c / 2;

  const int k = ((e - c / 2) < 0) ? c / 2 - e : 0;
  const int l = ((e + c / 2) >= g) ? c - (e + c / 2 - g + 1) : c;

  for (int m = k; m < l; ++m) {
    float n = exp((float)(-10.f * (m - c / 2.f) * (m - c / 2.f) / c / c));
    i += n;
    h += n * a[d + (j + m) * f];
  }

  b[d + e * f] = h / i;
}

__kernel void C(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);

  float g = 0.f;
  float h = 0.f;
  float i = 0.f;

  float j = 0.f;

  int k = d - c / 2;

  const int l = ((d - c / 2) < 0) ? c / 2 - d : 0;
  const int m = ((d + c / 2) >= f) ? c - (d + c / 2 - f + 1) : c;

  for (int n = l; n < m; ++n) {
    float o = exp((float)(-5.f * (n - c / 2.f) * (n - c / 2.f) / c / c));
    j += o;
    g += o * a[0 + 3 * (k + n) + 3 * e * f];
    h += o * a[1 + 3 * (k + n) + 3 * e * f];
    i += o * a[2 + 3 * (k + n) + 3 * e * f];
  }

  b[0 + 3 * (d + e * f)] = g / j;
  b[1 + 3 * (d + e * f)] = h / j;
  b[2 + 3 * (d + e * f)] = i / j;
}

__kernel void D(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);
  int g = get_global_size(1);

  float h = 0.f;
  float i = 0.f;
  float j = 0.f;

  float k = 0.f;

  int l = e - c / 2;

  const int m = ((e - c / 2) < 0) ? c / 2 - e : 0;
  const int n = ((e + c / 2) >= g) ? c - (e + c / 2 - g + 1) : c;

  for (int o = m; o < n; ++o) {
    float p = exp((float)(-5.f * (o - c / 2.f) * (o - c / 2.f) / c / c));
    k += p;
    h += p * a[0 + 3 * (d + (l + o) * f)];
    i += p * a[1 + 3 * (d + (l + o) * f)];
    j += p * a[2 + 3 * (d + (l + o) * f)];
  }

  b[0 + 3 * (d + e * f)] = h / k;
  b[1 + 3 * (d + e * f)] = i / k;
  b[2 + 3 * (d + e * f)] = j / k;
}