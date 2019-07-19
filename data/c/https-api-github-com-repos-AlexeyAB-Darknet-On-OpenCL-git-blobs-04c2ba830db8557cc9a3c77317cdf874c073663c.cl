__kernel void A(int a, __global float* b, int c, __global float* d, int e, __global float* f) {
  int g = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (g < (a + c) * e) {
    int h = g / (a + c);
    int i = g % (a + c);
    if (i < a) {
      if (b)
        b[h * a + i] += f[g];
    } else {
      if (d)
        d[h * c + i - a] += f[g];
    }
  }
}
__kernel void B(int a, __global float* b, int c, __global float* d, int e, __global float* f) {
  int g = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (g < (a + c) * e) {
    int h = g / (a + c);
    int i = g % (a + c);
    if (i < a) {
      f[g] = b[h * a + i];
    } else {
      f[g] = d[h * c + i - a];
    }
  }
}
__kernel void C(int a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, __global float* g, __global float* h) {
  int i = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (i < a) {
    if (e)
      e[i] += h[i] * d[i];
    if (f)
      f[i] += h[i] * (1 - d[i]);
    g[i] += h[i] * (b[i] - c[i]);
  }
}
__kernel void D(int a, __global float* b, __global float* c, __global float* d) {
  int e = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (e < a) {
    d[e] += b[e] * c[e];
  }
}
void E(__global float* a, int b, float c, int d, __global float* e) {
  int f;
  float g = 0;
  float h = -__builtin_inff();
  for (f = 0; f < b; ++f) {
    int i = a[f * d];
    h = (i > h) ? i : h;
  }
  for (f = 0; f < b; ++f) {
    float j = exp(a[f * d] / c - h / c);
    g += j;
    e[f * d] = j;
  }
  for (f = 0; f < b; ++f) {
    e[f * d] /= g;
  }
}
__kernel void F(__global float* a, int b, int c, int d, float e, __global float* f, int g, __constant int* h, __constant int* i) {
  int j = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (j >= b * c * g)
    return;
  int k = j % b;
  j = j / b;
  int l = j % g;
  int m = j / g;
  int n = i[l] * b;
  int o = m * d;
  E(a + n + o + k, h[l], e, b, f + n + o + k);
}
__kernel void G(__global float* a, int b, int c, int d, int e, int f, int g, float h, __global float* i) {
  int j = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (j >= c * e)
    return;
  int k = j / e;
  int l = j % e;
  E(a + k * d + l * f, b, h, g, i + k * d + l * f);
}