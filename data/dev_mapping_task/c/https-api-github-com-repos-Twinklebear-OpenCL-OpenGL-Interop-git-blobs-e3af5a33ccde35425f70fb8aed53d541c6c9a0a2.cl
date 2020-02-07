__kernel void A(int a, __global int* b, __global int* c, __global float* d, __global float* e, __global float* f) {
  int g = get_global_id(0);

  int h = -1;
  int i = -1;

  for (int j = g; j < a; ++j) {
    if (b[j] == g && h == -1)
      h = j;
    if (b[j] == g + 1 && h != -1 && i == -1) {
      i = j - 1;
      break;
    }
    if (j == a - 1 && h != -1 && i == -1)
      i = j;
  }
  float k = 0.0f;
  for (int j = h; j <= i; ++j)
    k += d[j] * e[c[j]];

  f[g] = k;
}
__kernel void B(__global float2* a, __global float2* b, __global float* c) {
  int d = get_global_id(0);
  c[d] = dot(a[d], b[d]);

  float e = 0.0f;
  if (d == 0) {
    for (int f = 0; f < get_global_size(0); ++f)
      e += c[f];

    c[d] = e;
  }
}

__kernel void C(__global float* a, __global float* b, __global float* c, __global float* d) {
  int e = get_global_id(0);
  a[e] = 0.0f;
  b[e] = d[e];
  c[e] = d[e];
}

__kernel void D(__global float* a, __global float* b, __global float* c) {
  *c = (*a) / (*b);
}

__kernel void E(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(0);
  d[f] += (*a) * b[f];
  e[f] -= (*a) * c[f];
}

__kernel void F(__global float* a, __global float* b, __global float* c, __global float* d) {
  int e = get_global_id(0);
  d[e] = c[e] + (*a) / (*b) * d[e];
}