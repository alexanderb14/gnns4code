__kernel void A(const __global float* a, const __global float* b, __global float* c, const int d, const int e, const int f, const __global float* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = get_global_id(2);

  const int k = get_global_size(0);
  const int l = get_global_size(1);
  const int m = k + d - 1;
  const int n = l + e - 1;
  float4 o = 0;
  int p = j * e * d * f;

  for (int q = 0; q < f; q++) {
    for (int r = 0; r < e; r++) {
      const int s = p + (q * e + r) * d;
      const int t = (((q * n) + i + r) * m) + h;
      int u = 0;
      int v = 0;
      while (u <= d - 4) {
        float4 w = vload4(v, b + s);
        float4 x = vload4(v, a + t);
        o += x * w;
        u += 4;
        v++;
      }
      for (int y = u; y < d; y++) {
        const int z = s + y;
        const int aa = t + y;
        o.x += b[z] * a[aa];
      }
    }
  }
  c[((j * l * k) + (i * k) + h)] = o.x + o.y + o.z + o.w + g[j];
}

__kernel void B(const __global float* a, __global float* b, const int c, const int d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = get_global_id(2);

  const int j = get_global_size(0);
  const int k = get_global_size(1);

  float l = 0.0;
  int m = h * f;
  int n = g * f;
  int o = min(m + e, d);
  int p = min(n + e, c);
  for (unsigned int q = m; q < o; q++) {
    for (unsigned int r = n; r < p; r++) {
      unsigned int s = i * d * c + q * c + r;
      l = fmax(l, a[s]);
    }
  }
  b[(((i * k) + h) * j) + g] = l;
}

__kernel void C(const __global float* a, const __global float* b, __global float* c, const int d, const __global float* e) {
  const int f = get_global_id(0);
  const int g = f * d;
  float h = 0;
  for (int i = 0; i < d; i++) {
    h += b[g + i] * a[i];
  }
  c[f] = h + e[f];
}

__kernel void D(__global float* a) {
  const int b = get_global_id(0);
  float c = 0.0;
  a[b] = fmax(c, a[b]);
}

__kernel void E(__global float* a) {
  __local float b, c[10];
  const int d = get_local_id(0);
  c[d] = exp(a[d]);

  barrier(1);
  if (get_local_id(0) == 0) {
    for (int e = 0; e < get_local_size(0); e++)
      b += c[e];
  }
  barrier(1);

  a[d] = c[d] / b;
}