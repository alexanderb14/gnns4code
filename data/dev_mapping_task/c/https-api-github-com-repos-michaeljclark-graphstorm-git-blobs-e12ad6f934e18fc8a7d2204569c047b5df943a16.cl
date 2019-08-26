union BufferType {
  float f;
  uint u;
};

__kernel void A(__global float4* a) {
  a[get_global_id(0)] = (float)0;
}

__kernel void B(__global float4* a, __global float4* b, __global float* c, const int d, const float e) {
  const int f = get_global_id(0);
  if (f >= d)
    return;

  float4 g = a[f];
  float h = c[f];
  float4 i = 0;
  for (int j = 0; j < d; j++) {
    if (f == j)
      continue;

    float4 k = g - a[j];
    float l = length(k);
    k *= (float)1 / fmax(l, (float)0.1f);

    float m = e / fmax(l * l * (float)0.5f, (float)0.005f);
    float4 n = k * m;
    i += n * ((float)1 / h);
  }
  b[f] += i;
}

__kernel void C(__global float4* a, __global float4* b, __global float4* c, __global float* d, __local float4* e, const int f, const float g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = get_global_size(1);
  const int k = get_local_size(0);
  const int l = get_local_id(0);

  e[l] = a[i * k + l];

  barrier(1);

  if (h >= f)
    return;

  float4 m = a[h];
  float n = d[h];

  float4 o = 0;
  const int p = i * k;
  for (int q = 0; q < k; q++) {
    const int r = p + q;
    if (h == r)
      continue;
    if (r >= f)
      break;

    float4 s = m - e[q];
    float t = length(s);
    s *= (float)1 / fmax(t, (float)0.1f);

    float u = g / fmax(t * t * (float)0.5f, (float)0.005f);
    float4 v = s * u;
    o += v * ((float)1 / n);
  }

  c[h * j + i] += o;
}

__kernel void D(__global float4* a, __global float4* b, const int c, const int d) {
  const int e = get_global_id(0);
  if (e >= c)
    return;

  float4 f = (float)0;
  for (int g = 0; g < d; g++) {
    f += b[e * d + g];
  }
  a[e] += f;
}

__kernel void E(__global float4* a, __global float4* b, __global float4* c, __global float* d, __global float* e, __global float* f, __global uint* g, __global uint* h, __global uint* i, __global uint* j, const int k) {
  const int l = get_global_id(0);
  if (l >= k)
    return;
  const int m = g[l];
  const int n = h[l];

  float4 o = a[n] - a[m];
  float p = length(o);
  float q = e[l] - p;
  o *= (float)1 / fmax(p, (float)0.1f);

  float r = f[l] * q * (float)0.5f;
  float4 s = o * -r;
  float4 t = o * r;

  c[i[l]] = s * ((float)1 / d[m]);
  c[j[l]] = t * ((float)1 / d[n]);
}

__kernel void F(__global float4* a, __global float4* b, __global uint* c, __global uint* d, const int e) {
  const int f = get_global_id(0);
  if (f >= e)
    return;

  const uint g = c[f];
  const uint h = g + d[f];

  float4 i = (float)0;
  for (uint j = g; j < h; j++) {
    i += b[j];
  }
  a[f] += i;
}

__kernel void G(__global float4* a, __global float4* b, __global float* c, const int d, const float e) {
  int f = get_global_id(0);
  if (f >= d)
    return;

  float4 g = a[f] * (float)-1;
  float4 h = g * e;
  b[f] += h * ((float)1 / c[f]);
}

__kernel void H(__global float4* a, __global float4* b, __global float4* c, const int d, const float e, const float f, const float g) {
  int h = get_global_id(0);
  if (h >= d)
    return;

  float4 i = (c[h] + b[h] * e) * f;
  float j = length(i);
  if (j > g) {
    i *= g / j;
  }
  c[h] = i;
  b[h] = (float)0;
  a[h] += c[h] * e;
}

__kernel void I(__global float4* a, __global float* b, __global float* c, const int d, const int e) {
  int f = get_global_id(0);
  float g = (float)0;
  while (f < e) {
    float h = length(a[f]);
    g += (float)0.5f * b[f] * h * h;
    f += get_global_size(0);
  }
  c[get_global_id(0)] = g;
}

__kernel void J(__global float* a, __global float* b, const int c) {
  float d = (float)0;
  for (int e = 0; e < c; e++) {
    d += a[e];
  }
  *b = d;
}

__kernel void K(__global float4* a, __global float4* b, __global float4* c, const int d, const int e) {
  int f = get_global_id(0);
  float4 g = (float4)0x1.fffffep127f;
  float4 h = (float4)-0x1.fffffep127f;
  while (f < e) {
    float4 i = a[f];
    g = min(i, g);
    h = max(i, h);
    f += get_global_size(0);
  }
  b[get_global_id(0)] = g;
  c[get_global_id(0)] = h;
}

__kernel void L(__global float4* a, __global float4* b, __global float4* c, const int d) {
  float4 e = (float4)0x1.fffffep127f;
  float4 f = (float4)-0x1.fffffep127f;
  for (int g = 0; g < d; g++) {
    e = min(a[g], e);
    f = max(b[g], f);
  }

  c[0] = e;
  c[1] = f;
}

__kernel void M(__global float4* a, __global float* b, __global uint* c, __global union BufferType* d, __global uint* e, float4 f, float4 g, float4 h, float4 i, float j, __global uint* k, int l) {
  const int m = get_global_id(0);
  const float4 n = a[m];
  const uint o = c[m];
  const float4 p = g - f;
  const float4 q = (n - f) / p * h + i;
  const float3 r = (float3)(q * (k[0] == 0) + q * (k[0] == 1) + q * (k[0] == 2) + q * (k[0] == 3), q * (k[1] == 0) + q * (k[1] == 1) + q * (k[1] == 2) + q * (k[1] == 3), q * (k[2] == 0) + q * (k[2] == 1) + q * (k[2] == 2) + q * (k[2] == 3));
  j *= b[m];

  if (l == 2) {
    __global union BufferType* s = &d[4 * m];
    (*s++).f = r.x;
    (*s++).f = r.y;
    (*s++).f = j;
    (*s++).u = o;
    e[m] = m;
  } else if (l == 3) {
    __global union BufferType* s = &d[5 * m];
    (*s++).f = r.x;
    (*s++).f = r.y;
    (*s++).f = r.z;
    (*s++).f = j;
    (*s++).u = o;
    e[m] = m;
  }
}

__kernel void N(__global float4* a, __global float* b, __global uint* c, __global union BufferType* d, __global uint* e, float4 f, float4 g, float4 h, float4 i, float j, __global uint* k, int l) {
  const int m = get_global_id(0);
  const float4 n = a[m];
  const uint o = c[m];
  const float4 p = g - f;
  const float4 q = (n - f) / p * h + i;
  const float3 r = (float3)(q * (k[0] == 0) + q * (k[0] == 1) + q * (k[0] == 2) + q * (k[0] == 3), q * (k[1] == 0) + q * (k[1] == 1) + q * (k[1] == 2) + q * (k[1] == 3), q * (k[2] == 0) + q * (k[2] == 1) + q * (k[2] == 2) + q * (k[2] == 3));
  j *= b[m];

  if (l == 2) {
    float s = r.x - j, t = r.y - j;
    float u = r.x + j, v = r.y + j;
    __global union BufferType* w = &d[12 * m];
    (*w++).f = s;
    (*w++).f = t;
    (*w++).u = o;
    (*w++).f = s;
    (*w++).f = v;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = v;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = t;
    (*w++).u = o;
    __global uint* x = &e[6 * m];
    uint y = 4 * m;
    *(x++) = y + 0;
    *(x++) = y + 1;
    *(x++) = y + 3;
    *(x++) = y + 1;
    *(x++) = y + 2;
    *(x++) = y + 3;
  } else if (l == 3) {
    float s = r.x - j, t = r.y - j, z = r.z - j;
    float u = r.x + j, v = r.y + j, aa = r.z + j;
    __global union BufferType* w = &d[168 * m];

    (*w++).f = s;
    (*w++).f = t;
    (*w++).f = z;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).f = -1.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = t;
    (*w++).f = z;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).f = -1.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = v;
    (*w++).f = z;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).f = -1.0f;
    (*w++).u = o;
    (*w++).f = s;
    (*w++).f = v;
    (*w++).f = z;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).f = -1.0f;
    (*w++).u = o;

    (*w++).f = s;
    (*w++).f = t;
    (*w++).f = aa;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).f = 1.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = t;
    (*w++).f = aa;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).f = 1.0f, (*w++).u = o;
    (*w++).f = u;
    (*w++).f = v;
    (*w++).f = aa;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).f = 1.0f;
    (*w++).u = o;
    (*w++).f = s;
    (*w++).f = v;
    (*w++).f = aa;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).f = 1.0f;
    (*w++).u = o;

    (*w++).f = s;
    (*w++).f = v;
    (*w++).f = z;
    (*w++).f = 0.0f;
    (*w++).f = 1.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = v;
    (*w++).f = z;
    (*w++).f = 0.0f;
    (*w++).f = 1.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = v;
    (*w++).f = aa;
    (*w++).f = 0.0f;
    (*w++).f = 1.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = s;
    (*w++).f = v;
    (*w++).f = aa;
    (*w++).f = 0.0f;
    (*w++).f = 1.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;

    (*w++).f = s;
    (*w++).f = t;
    (*w++).f = z;
    (*w++).f = 0.0f;
    (*w++).f = -1.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = t;
    (*w++).f = z;
    (*w++).f = 0.0f;
    (*w++).f = -1.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = t;
    (*w++).f = aa;
    (*w++).f = 0.0f;
    (*w++).f = -1.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = s;
    (*w++).f = t;
    (*w++).f = aa;
    (*w++).f = 0.0f;
    (*w++).f = -1.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;

    (*w++).f = s;
    (*w++).f = t;
    (*w++).f = aa;
    (*w++).f = -1.0f;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = s;
    (*w++).f = t;
    (*w++).f = z;
    (*w++).f = -1.0f;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = s;
    (*w++).f = v;
    (*w++).f = z;
    (*w++).f = -1.0f;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = s;
    (*w++).f = v;
    (*w++).f = aa;
    (*w++).f = -1.0f;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;

    (*w++).f = u;
    (*w++).f = t;
    (*w++).f = z;
    (*w++).f = 1.0f;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = t;
    (*w++).f = aa;
    (*w++).f = 1.0f;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = v;
    (*w++).f = aa;
    (*w++).f = 1.0f;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    (*w++).f = u;
    (*w++).f = v;
    (*w++).f = z;
    (*w++).f = 1.0f;
    (*w++).f = 0.0f;
    (*w++).f = 0.0f;
    (*w++).u = o;
    __global uint* x = &e[36 * m];
    uint y = 24 * m;

    *(x++) = y + 0;
    *(x++) = y + 2;
    *(x++) = y + 1;
    *(x++) = y + 0;
    *(x++) = y + 3;
    *(x++) = y + 2;

    *(x++) = y + 4;
    *(x++) = y + 5;
    *(x++) = y + 6;
    *(x++) = y + 6;
    *(x++) = y + 7;
    *(x++) = y + 4;

    *(x++) = y + 8;
    *(x++) = y + 10;
    *(x++) = y + 9;
    *(x++) = y + 8;
    *(x++) = y + 11;
    *(x++) = y + 10;

    *(x++) = y + 12;
    *(x++) = y + 13;
    *(x++) = y + 14;
    *(x++) = y + 14;
    *(x++) = y + 15;
    *(x++) = y + 12;

    *(x++) = y + 16;
    *(x++) = y + 18;
    *(x++) = y + 17;
    *(x++) = y + 16;
    *(x++) = y + 19;
    *(x++) = y + 18;

    *(x++) = y + 20;
    *(x++) = y + 21;
    *(x++) = y + 22;
    *(x++) = y + 22;
    *(x++) = y + 23;
    *(x++) = y + 20;
  }
}

__kernel void O(__global float4* a, __global uint* b, __global uint* c, __global uint* d, __global union BufferType* e, __global uint* f, float4 g, float4 h, float4 i, float4 j, __global uint* k, int l) {
  const int m = get_global_id(0);
  const int n = c[m];
  const int o = d[m];
  const uint p = b[m];
  const float4 q = a[n];
  const float4 r = a[o];
  const float4 s = h - g;
  const float4 t = (q - g) / s * i + j;
  const float4 u = (r - g) / s * i + j;
  const float3 v = (float3)(t * (k[0] == 0) + t * (k[0] == 1) + t * (k[0] == 2) + t * (k[0] == 3), t * (k[1] == 0) + t * (k[1] == 1) + t * (k[1] == 2) + t * (k[1] == 3), t * (k[2] == 0) + t * (k[2] == 1) + t * (k[2] == 2) + t * (k[2] == 3));
  const float3 w = (float3)(u * (k[0] == 0) + u * (k[0] == 1) + u * (k[0] == 2) + u * (k[0] == 3), u * (k[1] == 0) + u * (k[1] == 1) + u * (k[1] == 2) + u * (k[1] == 3), u * (k[2] == 0) + u * (k[2] == 1) + u * (k[2] == 2) + u * (k[2] == 3));

  if (l == 2) {
    float x = v.x, y = v.y;
    float z = w.x, aa = w.y;
    __global union BufferType* ab = &e[6 * m];
    (*ab++).f = x;
    (*ab++).f = y;
    (*ab++).u = p;
    (*ab++).f = z;
    (*ab++).f = aa;
    (*ab++).u = p;
    __global uint* ac = &f[2 * m];
    uint ad = 2 * m;
    *(ac++) = ad + 0;
    *(ac++) = ad + 1;
  } else if (l == 3) {
    float x = v.x, y = v.y, ae = v.z;
    float z = w.x, aa = w.y, af = w.z;
    __global union BufferType* ab = &e[8 * m];
    (*ab++).f = x;
    (*ab++).f = y;
    (*ab++).f = ae;
    (*ab++).u = p;
    (*ab++).f = z;
    (*ab++).f = aa;
    (*ab++).f = af;
    (*ab++).u = p;
    __global uint* ac = &f[2 * m];
    uint ad = 2 * m;
    *(ac++) = ad + 0;
    *(ac++) = ad + 1;
  }
}