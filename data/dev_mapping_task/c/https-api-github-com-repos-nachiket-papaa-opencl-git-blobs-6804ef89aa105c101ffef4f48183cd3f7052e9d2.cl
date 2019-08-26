__kernel void A(__global float* a, __constant float* b, __global float* c, const int d, const int e, __global const float* f, __local float* g) {
  int h = get_local_id(0);
  int i = get_local_id(1);

  int j = get_global_id(1);

  const int k = get_global_size(0);
  const int l = get_global_size(1);
  const int m = k - d + 1;
  const int n = l - e + 1;

  g[i * k + h] = a[j * k + h];
  if (i > (get_local_size(1) - e)) {
    g[(i + e - 1) * k + h] = a[(j + e - 1) * k + h];
  }
  barrier(1);

  float o = 0;
  for (int p = 0; p < e; p++) {
    for (int q = 0; q < d; q++) {
      o += b[p * d + q] * g[(i + p) * k + h + q];
    }
  }
  c[j * k + h] = o + *f;
}

__kernel void B(const __global float* a, __constant float* b, __global float* c, const int d, const int e, __global const float* f, __local float* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  const int j = get_global_size(0);
  const int k = get_global_size(1);

  const int l = j + d - 1;
  const int m = k + e - 1;
  float n = 0;
  for (int o = 0; o < e; o++) {
    for (int p = 0; p < d; p++) {
      n += b[o * d + p] * a[(i + o) * l + h + p];
    }
  }
  c[(i * j) + h] = n + *f;
}

__kernel void C(const __global float* a, __constant float* b, __global float* c, const int d, const int e, const int f, __global const float* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = get_global_size(0);
  const int k = get_global_size(1);
  const int l = j + d - 1;
  const int m = k + e - 1;
  float n = 0;
  int o = 0;
  for (int p = 0; p < f; p++) {
    for (int q = 0; q < e; q++) {
      int r = ((p * e + q) * d) + o;
      int s = ((((p * m) + i + q) * l) + h) + o;
      n += b[r] * a[s];
      r++;
      s++;
      n += b[r] * a[s];
      r++;
      s++;
      n += b[r] * a[s];
      r++;
      s++;
      n += b[r] * a[s];
      r++;
      s++;
      n += b[r] * a[s];
      o += 5;
    }
  }
  c[(i * j) + h] = n + *g;
}

__kernel void D(const __global float* a, __constant float* b, __global float* c, const int d, const int e, const int f, __global const float* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = get_global_id(2);

  const int k = get_global_size(0);
  const int l = get_global_size(1);

  float m = 0;
  int n = 0;
  int o = j * e * d * f;
  for (int p = 0; p < f; p++) {
    for (int q = 0; q < e; q++) {
      const int r = o + (p * e + q) * d;
      const int s = (((p * l) + i + q) * k) + h;
      for (n = 0; n < d; n++) {
        const int t = r + n;
        const int u = s + n;
        m += b[t] * a[u];
      }
    }
  }
  c[((j * l * k) + (i * k) + h)] = m + g[j];
}

__kernel void E(const __global float* a, __constant float* b, __global float* c, const int d, const int e, const int f, __global const float* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = get_global_id(2);

  const int k = get_global_size(0);
  const int l = get_global_size(1);

  float m = 0;
  int n = 0;

  int o = j * e * d * f;

  for (int p = 0; p < f; p++) {
    for (int q = 0; q < e; q++) {
      int r = o + ((p * e + q) * d) + n;
      int s = ((((p * l) + i + q) * k) + h) + n;
      m += b[r] * a[s];
      r++;
      s++;
      m += b[r] * a[s];
      r++;
      s++;
      m += b[r] * a[s];
      r++;
      s++;
      m += b[r] * a[s];
      r++;
      s++;
      m += b[r] * a[s];
      n += 5;
    }
  }
  c[(i * k) + h] = m + *g;
}
__kernel void F(const __global float* a, __constant float* b, __global float* c, const int d, const int e, const int f, __global const float* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = get_global_id(2);

  const int k = get_global_size(0);
  const int l = get_global_size(1);
  const int m = k + d - 1;
  const int n = l + e - 1;
  float o = 0;
  int p = 0;
  int q = j * e * d * f;

  for (int r = 0; r < f; r++) {
    for (int s = 0; s < e; s++) {
      const int t = q + (r * e + s) * d;
      const int u = (((r * n) + i + s) * m) + h;
      for (p = 0; p < d; p++) {
        const int v = t + p;
        const int w = u + p;
        o += b[v] * a[w];
      }
    }
  }
  c[((j * l * k) + (i * k) + h)] = o + g[j];
}

__kernel void G(const __global float* a, __constant float* b, __global float* c, const int d, const int e, const int f, __global const float* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = get_global_id(2);

  const int k = get_global_size(0);
  const int l = get_global_size(1);
  const int m = k - d + 1;
  const int n = l - e + 1;

  float o = 0;
  int p = 0;
  int q = j * e * d * f;

  if ((get_global_id(0) < m) && (get_global_id(1) < n)) {
    for (int r = 0; r < f; r++) {
      for (int s = 0; s < e; s++) {
        const int t = q + (r * e + s) * d;
        const int u = (((r * l) + i + s) * k) + h;
        for (p = 0; p < d; p++) {
          const int v = t + p;
          const int w = u + p;
          o += b[v] * a[w];
        }
      }
    }
    c[((j * n * m) + (i * m) + h)] = o + g[j];
  }
}