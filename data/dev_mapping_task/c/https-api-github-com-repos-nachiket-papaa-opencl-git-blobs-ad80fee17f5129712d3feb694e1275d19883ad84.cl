__kernel void A(const __global float* restrict a, __global float* restrict b, const int c, const int d, const int e, const int f) {
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

__attribute__((num_simd_work_items(4))) __attribute__((reqd_work_group_size(8, 1, 1))) __kernel void B(const __global float* restrict a, const __global float* restrict b, __global float* restrict c, const int d, const __global float* restrict e, const unsigned char f) {
  const int g = get_global_id(0);

  const int h = get_local_id(0);
  const int i = get_local_size(0);
  __local float j[256 * 6 * 6];
  int k = d / i;
  int l = d - k * i;
  for (int m = 0; m < k; m++) {
    j[m * i + h] = a[m * i + h];
  }

  if (h < l) {
    j[i * k + h] = a[i * k + h];
  }
  barrier(1);

  const int n = g * d;
  float o = 0;
  float p = 0;
  for (int q = 0; q < d; q++) {
    o += b[n + q] * j[q];
  }
  o += e[g];
  if (f == 1) {
    c[g] = fmax(p, o);
  } else {
    c[g] = o;
  }
}
__attribute__((max_work_group_size(1000))) __kernel void C(__global float* a) {
  const int b = get_global_id(0);
  a[b] = exp(a[b]);
}

__kernel void D(__global float* restrict a,

                __global float* restrict b, __global float* restrict c, __global float* restrict d) {
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