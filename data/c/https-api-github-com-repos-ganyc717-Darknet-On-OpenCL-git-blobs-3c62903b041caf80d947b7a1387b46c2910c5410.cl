__kernel void A(int a, int b, int c, int d, __global float* e, __global float* f) {
  int g = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (g >= a)
    return;

  int h = g % d;
  g /= d;
  int i = g;

  int j;
  int k = (h + d * i);
  f[k] = 0;
  for (j = 0; j < b * c; ++j) {
    int l = j + c * b * (h + i * d);
    f[k] += e[l];
  }
  f[k] /= b * c;
}

__kernel void B(int a, int b, int c, int d, __global float* e, __global float* f) {
  int g = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (g >= a)
    return;

  int h = g % d;
  g /= d;
  int i = g;

  int j;
  int k = (h + d * i);
  for (j = 0; j < b * c; ++j) {
    int l = j + c * b * (h + i * d);
    e[l] += f[k] / (b * c);
  }
}