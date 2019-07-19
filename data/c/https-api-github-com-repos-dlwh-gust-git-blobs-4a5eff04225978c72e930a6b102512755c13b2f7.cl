__kernel void A(__global float* a, int b, __global const float* c, int d, __global const float* e, int f, int g, int h, int i, int j) {
  int k = get_group_id(0);
  int l = get_group_id(1);

  int m = get_local_id(0);
  int n = get_local_id(1);

  int o = k * i + m;
  int p = l * j + n;

  if (o >= g || p >= h)
    return;

  a[o + p * b] = c[o + p * d] + e[o + p * f];
}

__kernel void B(__global float* a, int b, __global const float* c, int d, int e, int f, int g, int h) {
  int i = get_group_id(0);
  int j = get_group_id(1);

  int k = get_local_id(0);
  int l = get_local_id(1);

  int m = i * g + k;
  int n = j * h + l;

  if (m >= e || n >= f)
    return;

  a[m + n * b] += c[m + n * d];
}

__kernel void C(__global float* a, int b, __global const float* c, int d, __global const float* e, int f, int g, int h, int i, int j) {
  int k = get_group_id(0);
  int l = get_group_id(1);

  int m = get_local_id(0);
  int n = get_local_id(1);

  int o = k * i + m;
  int p = l * j + n;

  if (o >= g || p >= h)
    return;

  a[o + p * b] = c[o + p * d] - e[o + p * f];
}

__kernel void D(__global float* a, int b, __global const float* c, int d, int e, int f, int g, int h) {
  int i = get_group_id(0);
  int j = get_group_id(1);

  int k = get_local_id(0);
  int l = get_local_id(1);

  int m = i * g + k;
  int n = j * h + l;

  if (m >= e || n >= f)
    return;

  a[m + n * b] -= c[m + n * d];
}

__kernel void E(__global float* a, __global float* b, int c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = g % f;
  int i = g / f;

  if (h >= c || i >= d)
    return;

  a[i + h * e] = b[g];
}