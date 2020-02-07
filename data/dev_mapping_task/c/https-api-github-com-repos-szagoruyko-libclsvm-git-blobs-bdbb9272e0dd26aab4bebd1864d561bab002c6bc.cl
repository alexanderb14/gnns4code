__kernel void A(__global const int* a, __global const float* b, __global const float* c, __global float* d, int e) {
  int f = get_global_id(0);
  int g = a[f];

  float h = 0.f;
  for (int i = 0; i < e; ++i)
    h += c[i] * b[g * e + i];
  d[f] = h;
}

__kernel void B(__global const float* a, __global const float* b, __global float* c, int d) {
  int e = get_global_id(0);
  float f = 0.f;
  for (int g = 0; g < d; ++g)
    f += b[g] * a[e * d + g];
  c[e] = f;
}

__kernel void C(__global const int* a, __global const float* b, __global const float* c, __global float* d, int e, float f, float g, int h) {
  int i = get_global_id(0);

  float j = 0.f;
  for (int k = 0; k < h; ++k) {
    int l = a[k];
    j += c[l] * b[l * e + i];
  }

  d[i] = (1.f - f * g) * d[i] + f / ((float)h) * j;
}

__kernel void D(__global const float* a, __global float* b, int c) {
  float d = 0.f;
  for (int e = 0; e < c; ++e)
    d += a[e] * a[e];
  b[0] = sqrt(d);
}

__kernel void E(__global float* a, float b) {
  a[get_global_id(0)] /= b;
}