__kernel void A(const __global float* restrict a, const __global float* restrict b, const __global float* restrict c, __global float* restrict d, const unsigned int e, const unsigned int f, const unsigned int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = get_global_id(2);

  const int k = get_global_size(0);
  const int l = get_global_size(1);
  const int m = k + e - 1;
  const int n = l + e - 1;

  int o = h * f;
  int p = i * f;
  int q = o + e;
  int r = p + e;

  const int s = j * e * e * g;
  int t = (int)e;
  float u, v;
  float4 w = 0.0;
  float x = 0.0;
  float y = 0.0;
  for (unsigned int z = 0; z < g; z++) {
    for (unsigned int aa = 0; aa < e; aa++) {
      const int ab = s + z * e * e + aa * e;
      const int ac = ((z * n) + p + aa) * m + o;
      int ad = 0;
      int ae = 0;

      while (ad <= t - 4) {
        float4 af = vload4(ae, b + ab);
        float4 ag = vload4(ae, a + ac);
        w += af * ag;
        ad += 4;
        ae++;
      }

      for (int ah = ad; ah < e; ah++) {
        w.x += b[ab + ah] * a[ac + ah];
      }
    }
  }
  y = w.x + w.y + w.z + w.w + c[j];
  d[((j * l) + i) * k + h] = fmax(x, y);
}
__kernel void B(const __global float* restrict a, __global float* restrict b, const int c, const int d, const int e, const int f) {
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

__kernel void C(const __global float* restrict a, const __global float* restrict b, __global float* restrict c, const int d, const __global float* restrict e, const unsigned char f) {
  const int g = get_global_id(0);
  const int h = g * d;
  float i = 0;
  float j = 0;
  for (int k = 0; k < d; k++) {
    i += b[h + k] * a[k];
  }
  i += e[g];
  if (f == 1) {
    c[g] = fmax(j, i);
  } else {
    c[g] = i;
  }
}

__attribute__((max_work_group_size(1000))) __kernel void D(__global float* a) {
  const int b = get_global_id(0);
  a[b] = exp(a[b]);
}

__kernel void E(__global float* restrict a,

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