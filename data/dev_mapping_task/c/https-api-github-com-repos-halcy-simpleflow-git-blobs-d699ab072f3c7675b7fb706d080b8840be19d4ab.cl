float4 A(float4 a, float4 b) {
  float4 c = b - fmax(a, b);
  float4 d = -(b + fmin(a, -b));
  return sign(c + d) * fmax(-c, d);
}

float4 B(float4 a, float4 b) {
  return -2.0f * dot(a, b) * b + a;
}

float C(float a, float b, const __global float* c) {
  int d = ((a + 10.5f) / (10.5f * 2.0f * 8.0f)) * 4096.0f;
  int e = ((b + 10.5f) / (10.5f * 2.0f * 8.0f)) * 4096.0f;
  int f = d + e * 4096;
  f = max(0, min(f, 4096 * 4096));
  return c[f] * 128.0f - 2.0f - 4.0f;
}

float4 D(float a, float b, const __global float* c) {
  float d = (10.5f * 2.0f * 8.0f) / 4096.0f;
  float e = C(a + d, b, c);
  float f = C(a - d, b, c);
  float g = C(a, b + d, c);
  float h = C(a, b - d, c);
  float4 i = (float4)(a + deb, 0.0f) - (float4)(a - dfb, 0.0f);
  float4 j = (float4)(a, gb + d0 .0f) - (float4)(a, hb - d0 .0f);
  return cross(i, j);
}

void E(float4 a, float4* b, float4* c, const __global float* d) {
  float4 e = *b;
  float4 f = *c;

  float g = C(e.x, e.z, d);
  if (e.y < g) {
    float4 h = a;
    float4 i = e;
    float4 j = h + 0.5f * (i - h);
    while (length(i - h) > 0.001f) {
      float k = C(j.x, j.z, d);
      if (j.y < k) {
        i = j;
      } else {
        h = j;
      }
      j = h + 0.5f * (i - h);
    }
    float4 l = h;

    float m = length(e - l);
    float4 n = normalize(D(l.x, l.z, d));
    f = B(f, n) * 0.85f;
    e = e + m * normalize(f);
    g = C(e.x, e.z, d);
    if (e.y < g) {
      e.y = g + 0.001f;
    }
  }

  *b = e;
  *c = f;
}

float F(float4 a, float4 b) {
  float4 c = a - b;
  float d = 315.0f / (64.0f * 3.1415f * __clc_pow(0.1f, 9.0f));
  float e = __clc_pow(__clc_pow(0.1f, 2.0f) - dot(c, c), 3.0f);
  return d * e;
}

float G(float4 a, const float4* b, int c) {
  float d = 0.0f;
  for (int e = 0; e < c; e++) {
    d += F(a, b[e]);
  }
  return fmax(500.0f, fmin(d, 1000000.0f));
}

float H(float a) {
  return 1000.0f * (a - 500.0f);
}

float I(float a) {
  return H(a) / __clc_pow(a, 2.0f);
}

float4 J(float4 a, float4 b, float c, float d) {
  float4 e = a - b;
  float f = c + d;
  float g = -45.0f / (3.1415f * __clc_pow(0.1f, 6.0f));
  float h = __clc_pow(0.1f - dot(e, e), 2.0f);
  float4 i = normalize(e);
  return f * g * h * i;
}

float4 K(float4 a, float b, const float4* c, const float4* d, int e) {
  float4 f = (float4){0.0f, 0.0f, 0.0f, 0.0f};
  for (int g = 0; g < e; g++) {
    float h = d[g].x;
    float i = d[g].y;
    f += J(a, c[g], b, i);
  }
  return f;
}

float4 L(float4 a, float4 b, float c, float4 d, float4 e) {
  float4 f = a - b;
  float4 g = (e - d) / c;
  float h = 45.0f / (3.1415f * __clc_pow(0.1f, 6.0f));
  float i = 0.1f - dot(f, f);
  return g * h * i;
}

float4 M(float4 a, float b, float4 c, const float4* d, const float4* e, const float4* f, int g) {
  float4 h = (float4){0.0f, 0.0f, 0.0f, 0.0f};
  for (int i = 0; i < g; i++) {
    float j = f[i].x;
    h += L(a, d[i], j, c, e[i]);
  }
  return (60.0f / b) * h;
}

float4 N(float a, float4 b, float4 c) {
  return c - b / a;
}

float4 O(float4 a, float4 b, float4 c, const float4* d, const float4* e, const float4* f, float g, int h, float4 i, float j) {
  float4 k = ((float4){0.0f, -9.81f, 0.0f, 0.0f});

  if (a.y > -2.0f + 0.5f) {
    float l = dot(i, a);
    float m = min(1.0f, max(0.0f, a.y + 0.5f + 2.0f));
    float n = (sin(g + l * 2.0f) + 1.0f) * m;
    k.y += sin(g + l) * 4.0f * j;
    k -= i * sin(g + l) * 2.0f * j;
  }

  float o = c.x;
  float p = c.y;
  float4 q = K(a, p, d, f, h);
  float4 r = M(a, o, b, d, e, f, h);
  k += N(o, q, r);
  return k;
}

int P(float4 a, const __global float4* b, const __global float4* c, const __global float4* d, float4* e, float4* f, float4* g, const __global int* h, const __global int* i, const __global int* j) {
  int k = (int)(((__clc_floor(((a).x + ((float)((int)220) * 0.1f * 0.5f)) / 0.1f))) + ((__clc_floor(((a).y + ((float)((int)42) * 0.1f * 0.5f)) / 0.1f))) * ((int)42) + ((__clc_floor(((a).z + ((float)((int)220) * 0.1f * 0.5f)) / 0.1f))) * ((int)42) * ((int)220));
  int l[27];
  for (int m = 0; m < 27; m++) {
    int n = j[m];
    int o = (n % 3) - 1;
    int p = (((n / 3) % 3) - 1) * ((int)42);
    int q = ((n / 9) - 1) * ((int)42) * ((int)220);
    l[m] = max(0, min((k + o + p + q), ((int)128) * ((int)128) * ((int)128)));
  }

  int r = 0;
  for (int n = 0; n < 27; n++) {
    int s = h[l[n]];
    int t = i[l[n]] - s;
    for (int m = 0; m < s; m++) {
      float4 u = b[t + m];
      float4 v = a - u;
      if ((r < 32) && (dot(v, v) < 0.1f * 0.1f)) {
        e[r] = u;
        f[r] = c[t + m];
        g[r] = d[t + m];
        r++;
      }
    }
  }

  return r;
}

int Q(float4 a, const __global float4* b, float4* c, const __global int* d, const __global int* e, const __global int* f) {
  int g = (int)(((__clc_floor(((a).x + ((float)((int)220) * 0.1f * 0.5f)) / 0.1f))) + ((__clc_floor(((a).y + ((float)((int)42) * 0.1f * 0.5f)) / 0.1f))) * ((int)42) + ((__clc_floor(((a).z + ((float)((int)220) * 0.1f * 0.5f)) / 0.1f))) * ((int)42) * ((int)220));
  int h[27];
  for (int i = 0; i < 27; i++) {
    int j = f[i];
    int k = (j % 3) - 1;
    int l = (((j / 3) % 3) - 1) * ((int)42);
    int m = ((j / 9) - 1) * ((int)42) * ((int)220);
    h[i] = max(0, min((g + k + l + m), ((int)128) * ((int)128) * ((int)128)));
  }

  int n = 0;
  for (int j = 0; j < 27; j++) {
    int o = d[h[j]];
    int p = e[h[j]] - o;
    for (int i = 0; i < o; i++) {
      float4 q = b[p + i];
      float4 r = a - q;
      if ((n < 32) && (dot(r, r) < 0.1f * 0.1f)) {
        c[n] = q;
        n++;
      }
    }
  }

  return n;
}

__kernel void R(const __global float4* a, __global float4* b, const __global int* c, const __global int* d, const __global int* e, const int f) {
  int g = get_global_id(0);
  if (g < f) {
    float4 h = a[g];
    float4 i[32];
    int j = Q(h, a, i, c, d, e);
    float k = G(h, i, j);
    float l = I(k);

    b[g].x = k;
    b[g].y = l;
  }
}

__kernel void S(const __global float4* a, __global float4* b, const __global float4* c, __global float4* d, const __global float4* e, const __global int* f, const __global int* g, const __global int* h, const float i, const float j, const int k, const __global float* l, const float4 m, const float n) {
  int o = get_global_id(0);
  if (o < k) {
    float4 p = a[o];
    float4 q = c[o];
    float4 r = e[o];

    float4 s[32];
    float4 t[32];
    float4 u[32];
    int v = P(p, a, c, e, s, t, u, f, g, h);

    float4 w = O(p, q, r, s, t, u, j, v, m, n);

    float4 x = w;

    float4 y = p + q * i + 0.5f * x * i * i;

    float4 z = w;

    float4 aa = q + 0.5f * (x + z) * i;

    float4 ab = A(y, ((float4){10.5f, 2.0f, 10.5f, 10000000.0f}));
    E(p, &y, &aa, l);
    if (length(ab) != 0.0f) {
      y += ab + normalize(ab) * 0.01f;
      aa *= -normalize(__clc_fabs(ab)) * 0.85f;
    }

    aa = __clc_fabs(aa) > 4.0f ? 4.0f * sign(aa) : aa;

    y.w = length(aa);
    b[o] = y;
    d[o] = aa;
  }
}

__kernel void T(const __global float4* a, __global int* b, volatile __global int* c, const int d) {
  int e = get_global_id(0);
  if (e < d) {
    float4 f = a[e];
    int g = max(0, min(((int)(((__clc_floor(((f).x + ((float)((int)220) * 0.1f * 0.5f)) / 0.1f))) + ((__clc_floor(((f).y + ((float)((int)42) * 0.1f * 0.5f)) / 0.1f))) * ((int)42) + ((__clc_floor(((f).z + ((float)((int)220) * 0.1f * 0.5f)) / 0.1f))) * ((int)42) * ((int)220))), ((int)128) * ((int)128) * ((int)128)));
    b[e] = atomic_add(&c[g], 1);
  }
}

__kernel void U(__global int* a, const int b) {
  int c = get_global_id(0);
  if (c < b) {
    a[c] = 0;
  }
}

__kernel void V(const __global float4* a, __global float4* b, const __global float4* c, __global float4* d, const __global int* e, const __global int* f, const __global int* g, const int h) {
  int i = get_global_id(0);
  if (i < h) {
    float4 j = a[i];
    int k = max(0, min(((int)(((__clc_floor(((j).x + ((float)((int)220) * 0.1f * 0.5f)) / 0.1f))) + ((__clc_floor(((j).y + ((float)((int)42) * 0.1f * 0.5f)) / 0.1f))) * ((int)42) + ((__clc_floor(((j).z + ((float)((int)220) * 0.1f * 0.5f)) / 0.1f))) * ((int)42) * ((int)220))), ((int)128) * ((int)128) * ((int)128)));
    int l = e[i];
    int m = g[k] - f[k];
    int n = m + l;

    j.w = 0.0f;
    b[n] = j;
    d[n] = c[i];
  }
}

__kernel void W(const __global int* a, __global int* b, const int c, const int d) {
  int e = get_global_id(0);
  if (e < c) {
    if (e < d) {
      b[e] = a[e];
    } else {
      b[e] = a[e] + a[e - d];
    }
  }
}