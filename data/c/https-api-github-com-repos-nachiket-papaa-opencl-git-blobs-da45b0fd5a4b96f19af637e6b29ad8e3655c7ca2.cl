__kernel void A(const __global float* a, __global float* b, const int c, const int d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = get_global_id(2);

  const int j = get_global_size(0);
  const int k = get_global_size(1);

  float l = -3.402823e+37;
  int m = h * f;
  int n = g * f;

  int o = m + e;
  int p = n + e;
  for (unsigned int q = m; q < o; q++) {
    for (unsigned int r = n; r < p; r++) {
      unsigned int s = i * d * c + q * c + r;
      l = fmax(l, a[s]);
    }
  }
  b[(((i * k) + h) * j) + g] = l;
}

__kernel void B(const __global float* a, const __global float* b, __global float* c, const int d, const __global float* e) {
  const int f = get_global_id(0);
  const int g = f * d;
  float h = 0;
  for (int i = 0; i < d; i++) {
    h += b[g + i] * a[i];
  }
  c[f] = h + e[f];
}

__kernel void C(__global float* a) {
  const int b = get_global_id(0);
  float c = 0.0;
  a[b] = fmax(c, a[b]);
}

__attribute__((max_work_group_size(1000))) __kernel void D(__global float* a) {
  __local float b, c[1000];
  const int d = get_global_id(0);
  c[d] = exp(a[d]);

  barrier(1);
  if (d == 0) {
    b = 0;
    for (int e = 0; e < get_global_size(0); e++) {
      b += c[e];
    }
  }
  barrier(1);

  a[d] = c[d] / b;
}

__kernel void E(__global float* a,

                __global float* b, __global float* c, __global float* d) {
  const int e = get_global_id(2);
  const int f = get_global_id(1);
  const int g = get_global_id(0);
  const int h = get_global_size(0);
  const int i = get_global_size(1);
  float j;
  const int k = e * h * i + f * h + g;
  j = a[k] * b[e] + c[e];
  d[k] = j;
}