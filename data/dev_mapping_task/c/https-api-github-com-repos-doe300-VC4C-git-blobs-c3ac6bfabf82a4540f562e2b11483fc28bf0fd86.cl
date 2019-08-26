__kernel void A(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);
  int g = get_global_size(1);

  float h = -__builtin_inff();

  int i = d - c / 2;

  const int j = max(0, c / 2 - d);
  const int k = min(c, f - d + c / 2);

  for (int l = j; l < k; ++l)
    h = fmax(h, a[i + l + e * f]);

  b[d + e * f] = h;
}

__kernel void B(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);
  int g = get_global_size(1);

  float h = -__builtin_inff();

  int i = e - c / 2;

  const int j = max(0, c / 2 - e);
  const int k = min(c, g - e + c / 2);

  for (int l = j; l < k; ++l)
    h = fmax(h, a[d + (i + l) * f]);

  b[d + e * f] = h;
}

__kernel void C(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);
  int g = get_global_size(1);

  float h = __builtin_inff();

  int i = d - c / 2;

  const int j = max(0, c / 2 - d);
  const int k = min(c, f - d + c / 2);

  for (int l = j; l < k; ++l)
    h = fmin(h, a[i + l + e * f]);

  b[d + e * f] = h;
}

__kernel void D(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);
  int g = get_global_size(1);

  float h = __builtin_inff();

  int i = e - c / 2;

  const int j = max(0, c / 2 - e);
  const int k = min(c, g - e + c / 2);

  for (int l = j; l < k; ++l)
    h = fmin(h, a[d + (i + l) * f]);

  b[d + e * f] = h;
}

__kernel void E(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_id(2);

  int g = get_global_size(0);
  int h = get_global_size(1);
  int i = get_global_size(2);

  float j = -__builtin_inff();

  int k = d - c / 2;

  const int l = max(0, c / 2 - d);
  const int m = min(c, g - d + c / 2);

  for (int n = l; n < m; ++n)
    j = fmax(j, a[k + n + e * g + f * g * h]);

  b[d + e * g + f * g * h] = j;
}

__kernel void F(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_id(2);

  int g = get_global_size(0);
  int h = get_global_size(1);
  int i = get_global_size(2);

  float j = -__builtin_inff();

  int k = e - c / 2;

  const int l = max(0, c / 2 - e);
  const int m = min(c, h - e + c / 2);

  for (int n = l; n < m; ++n)
    j = fmax(j, a[d + (k + n) * g + f * g * h]);

  b[d + e * g + f * g * h] = j;
}

__kernel void G(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_id(2);

  int g = get_global_size(0);
  int h = get_global_size(1);
  int i = get_global_size(2);

  float j = -__builtin_inff();

  int k = f - c / 2;

  const int l = max(0, c / 2 - f);
  const int m = min(c, i - f + c / 2);

  for (int n = l; n < m; ++n)
    j = fmax(j, a[d + e * g + (k + n) * g * h]);

  b[d + e * g + f * g * h] = j;
}

__kernel void H(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_id(2);

  int g = get_global_size(0);
  int h = get_global_size(1);
  int i = get_global_size(2);

  float j = __builtin_inff();

  int k = d - c / 2;

  const int l = max(0, c / 2 - d);
  const int m = min(c, g - d + c / 2);

  for (int n = l; n < m; ++n)
    j = fmin(j, a[k + n + e * g + f * g * h]);

  b[d + e * g + f * g * h] = j;
}

__kernel void I(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_id(2);

  int g = get_global_size(0);
  int h = get_global_size(1);
  int i = get_global_size(2);

  float j = __builtin_inff();

  int k = e - c / 2;

  const int l = max(0, c / 2 - e);
  const int m = min(c, h - e + c / 2);

  for (int n = l; n < m; ++n)
    j = fmin(j, a[d + (k + n) * g + f * g * h]);

  b[d + e * g + f * g * h] = j;
}

__kernel void J(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_id(2);

  int g = get_global_size(0);
  int h = get_global_size(1);
  int i = get_global_size(2);

  float j = __builtin_inff();

  int k = f - c / 2;

  const int l = max(0, c / 2 - f);
  const int m = min(c, i - f + c / 2);

  for (int n = l; n < m; ++n)
    j = fmin(j, a[d + e * g + (k + n) * g * h]);

  b[d + e * g + f * g * h] = j;
}