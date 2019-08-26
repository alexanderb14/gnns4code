typedef struct Ellmat {
  __global float* elldata;
  __global int* colidx;
  __global int* rownnz;
  int ellwidth;
  int matdim;
} Ellmat;

inline int A(__global float* a, __global int* b, __global int* c, int d, int e, Ellmat* f) {
  if (f == 0) {
    return 0;
  }
  f->elldata = a;
  f->colidx = b;
  f->rownnz = c;
  f->ellwidth = d;
  f->matdim = e;
  return 1;
}

inline float B(Ellmat* a, int b, int c) {
  for (int d = 0; d < a->rownnz[d]; d++) {
    int e = a->colidx[d];
    if (e > c) {
      return 0.0f;
    }
    if (e == c) {
      int f = a->ellwidth * d;
      return a->elldata[f + d];
    }
  }
  return 0.0f;
}

inline float C(Ellmat* a, int b, int c) {
  for (int d = 0; d < a->rownnz[d]; d++) {
    int e = a->colidx[d];
    if (e > c) {
      return 0.0f;
    }
    if (e == c) {
      int f = a->ellwidth * d;
      return a->elldata[f + d];
    }
  }
  return 0.0f;
}

inline __global float* D(Ellmat* a, int b, int c) {
  for (int d = 0; d < a->rownnz[d]; d++) {
    int e = a->colidx[d];
    if (e > c) {
      return 0;
    }
    if (e == c) {
      int f = a->ellwidth * d;
      return &a->elldata[f + d];
    }
  }
  return 0;
}
__kernel void E(__global float* a, __global int* b, __global int* c, __private int d, __private int e, __global float* f, __global float* g, __local float* h) {
  uint i = get_global_id(1);
  uint j = get_local_id(0);
  uint k = get_local_id(1);
  uint l = get_local_size(0);

  h[l * k + j] = 0;

  uint m = e * l;
  uint n = d / l;
  if (n == 0)
    n = 1;
  float o = 0;

  for (int p = 0; p < n; ++p) {
    int q = p * m + i + (e * j);
    int r = b[q];
    float s = a[q];
    float t = f[r];
    o += s * t;
  }
  h[k * l + j] = o;

  if (j == 0) {
    barrier(1);
    o = 0;
    uint u = k * l;
    for (int p = 0; p < l; ++p) {
      o += h[u + p];
    }
    barrier(1);
    g[i] = o;
  }
}

__kernel void F(__global float* a, __global int* b, __global int* c, __private int d, __private int e, __global float* f, __global float* g, __local float* h) {
  uint i = get_global_id(1);
  uint j = get_local_id(0);
  uint k = get_local_id(1);
  uint l = get_local_size(0);
  uint m = get_local_size(1);

  h[l * k + j] = 0;

  uint n = e * l;
  uint o = d / l;

  float4 p = 0;
  for (int q = 0; q < o; q += 4) {
    int4 r, s;
    float4 t, u;

    r.x = q * n + i + (e * j);
    r.y = (q + 1) * n + i + (e * j);
    r.z = (q + 2) * n + i + (e * j);
    r.w = (q + 3) * n + i + (e * j);
    s.x = b[r.x];
    s.y = b[r.y];
    s.z = b[r.z];
    s.w = b[r.w];
    t.x = a[r.x];
    t.y = a[r.y];
    t.z = a[r.z];
    t.w = a[r.w];
    u.x = f[s.x];
    u.y = f[s.y];
    u.z = f[s.z];
    u.w = f[s.w];
    p += t * u;
  }

  h[k * l + j] = p.x + p.y + p.z + p.w;

  if (j == 0) {
    barrier(1);
    p.x = 0;
    p.y = 0;
    p.z = 0;
    p.w = 0;
    uint v = k * l;
    for (int q = 0; q < l; q += 4) {
      p.x += h[v + q];
      p.y += h[v + q + 1];
      p.z += h[v + q + 2];
      p.w += h[v + q + 3];
    }
    barrier(1);
    if (i < e)
      g[i] = p.x + p.y + p.z + p.w;
  }
}

__kernel void G(__global float* a, __global int* b, __global int* c, __private int d, __private int e, __global float* f, __global float* g, __local float* h) {
  uint i = get_global_id(0);
  uint j = get_global_id(1);
  uint k = get_local_id(0);
  uint l = get_local_id(1);
  uint m = get_local_size(0);
  uint n = get_local_size(1);

  h[m * l + k] = 0;

  uint o = e * m;
  uint p = d / m;

  float4 q = 0;
  for (int r = 0; r < p; r += 4) {
    int4 s, t;
    float4 u, v;
    int w = j + (e * k);

    s.x = r * o + w;
    s.y = (r + 1) * o + w;
    s.z = (r + 2) * o + w;
    s.w = (r + 3) * o + w;
    t.x = b[s.x];
    t.y = b[s.y];
    t.z = b[s.z];
    t.w = b[s.w];
    u.x = a[s.x];
    u.y = a[s.y];
    u.z = a[s.z];
    u.w = a[s.w];
    v.x = f[t.x];
    v.y = f[t.y];
    v.z = f[t.z];
    v.w = f[t.w];
    q += u * v;
  }
  uint x = (l * m) + k;
  h[x] = q.x + q.y + q.z + q.w;

  if (k < 4) {
    barrier(1);
    q.x = 0;
    q.y = 0;
    q.z = 0;
    q.w = 0;
    for (int r = 0; r < m; r += 4) {
      q.x += h[x + r];
      q.y += h[x + r + 1];
      q.z += h[x + r + 2];
      q.w += h[x + r + 3];
    }
    barrier(1);
    if (k == 0)
      g[j] = q.x + q.y + q.z + q.w;
  }
}

__kernel void H(__global float* a, __global int* b, __global int* c, __private int d, __private int e, __global float* f, __global float* g, __local float* h) {
  uint i = get_global_id(0);
  uint j = get_global_id(1);
  uint k = get_local_id(0);
  uint l = get_local_id(1);
  uint m = get_local_size(0);
  uint n = get_local_size(1);

  h[m * l + k] = 0;

  uint o = e * m;
  uint p = d / m;

  float4 q = 0;
  for (int r = 0; r < p; r += 4) {
    int4 s, t, u, v;
    float4 w, x;
    int y = j + (e * k);

    s.x = r * o + y;
    s.y = (r + 1) * o + y;
    s.z = (r + 2) * o + y;
    s.w = (r + 3) * o + y;
    u = s / e;
    v = s % e;
    t.x = b[s.x];
    t.y = b[s.y];
    t.z = b[s.z];
    t.w = b[s.w];
    w.x = (u.x < c[v.x]) ? a[s.x] : 0;
    w.y = (u.y < c[v.y]) ? a[s.y] : 0;
    w.z = (u.z < c[v.z]) ? a[s.z] : 0;
    w.w = (u.w < c[v.w]) ? a[s.w] : 0;
    x.x = f[t.x];
    x.y = f[t.y];
    x.z = f[t.z];
    x.w = f[t.w];
    q += w * x;
  }
  uint z = (l * m) + k;
  h[z] = q.x + q.y + q.z + q.w;

  if (k < 4) {
    barrier(1);
    q.x = 0;
    q.y = 0;
    q.z = 0;
    q.w = 0;
    for (int r = 0; r < m; r += 4) {
      q.x += h[z + r];
      q.y += h[z + r + 1];
      q.z += h[z + r + 2];
      q.w += h[z + r + 3];
    }
    barrier(1);
    if (k == 0)
      g[j] = q.x + q.y + q.z + q.w;
  }
}

__kernel void I(__global float* a, __global int* b, __global int* c, __private int d, __private int e, __global float* f, __global float* g, __local float* h) {
  uint i = get_group_id(0);
  uint j = get_local_id(0);
  uint k = get_local_size(0);
  if (i < e) {
    uint l = c[i];
    uint m = i + (j * e);
    h[j] = 0;
    for (int n = 0; n < d; n += k) {
      int o = (n * e) + m;
      int p = b[o];
      float q = a[o];
      float r = f[p];
      float s = q * r;
      h[j] += s;
    }

    barrier(1);
    {
      for (int t = k / 2; t > 0; t /= 2) {
        if (j < t) {
          h[j] += h[t];
        }
        barrier(1);
      }
      if (j == 0)
        g[i] = h[0];
    }
  }
}

__kernel void J(__global float* a, __global int* b, __global int* c, __private int d, __private int e, __global float* f, __global float* g, __local float* h) {
  uint i = get_group_id(0);
  uint j = get_local_id(0);
  uint k = get_local_size(0);
  uint l = d / k;
  if (l == 0) {
    l = 1;
  }
  uint m = k * e;
  uint n = i + (j * e);

  if (i < e) {
    h[j] = 0;
    for (int o = 0; o < l; o++) {
      int p = (o * m) + n;
      int q = b[p];
      float r = a[p];
      float s = f[q];
      float t = r * s;
      h[j] += t;
    }
    barrier(1);
    if (get_local_id(0) == 0) {
      float u = 0;
      for (int o = 0; o < k; o++) {
        u += h[o];
      }
      g[i] = u;
    }
  }
}

__kernel void K(__global float* a, __global int* b, __global int* c, __private int d, __private int e, __global float* f, __global float* g, __local float* h) {
  uint i = get_global_id(0);
  if (i < e) {
    uint j = c[i];
    float k = 0;
    for (int l = 0; l < j; l++) {
      int m = l * e + i;
      int n = b[m];
      float o = a[m];
      float p = f[n];
      k += o * p;
    }
    g[i] = k;
  }
}

__kernel void L(__global float* a, __global int* b, __global int* c, __private int d, __private int e, __global float* f, __global float* g, __local float* h) {
  uint i = get_global_id(0);
  if (i < e) {
    uint j = c[i];
    float4 k = 0;
    for (int l = 0; l < j; l += 4) {
      int4 m, n;
      float4 o, p;
      m.s0 = l * e + i;
      m.s1 = (l + 1) * e + i;
      m.s2 = (l + 2) * e + i;
      m.s3 = (l + 3) * e + i;
      n.s0 = b[m.s0];
      n.s1 = b[m.s1];
      n.s2 = b[m.s2];
      n.s3 = b[m.s3];
      o.s0 = a[m.s0];
      o.s1 = a[m.s1];
      o.s2 = a[m.s2];
      o.s3 = a[m.s3];
      p.s0 = f[n.s0];
      p.s1 = f[n.s1];
      p.s2 = f[n.s2];
      p.s3 = f[n.s3];
      k.s0 += o.s0 * p.s0;
      k.s1 += o.s1 * p.s1;
      k.s2 += o.s2 * p.s2;
      k.s3 += o.s3 * p.s3;
    }
    g[i] = k.s0 + k.s1 + k.s2 + k.s3;
  }
}