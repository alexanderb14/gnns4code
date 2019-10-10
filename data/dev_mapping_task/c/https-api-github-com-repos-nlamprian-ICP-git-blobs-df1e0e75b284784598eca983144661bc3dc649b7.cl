typedef struct {
  float dist;
  uint id;
} dist_id;
kernel void A(global float4* a, global float4* b) {
  uint c = get_global_size(0);

  uint d = get_global_id(0);
  uint e = get_global_id(1);

  uint f = (((d >> 1) << 1) << 2) + 2;
  uint g = e * 3 + 1;

  b[e * c + d] = a[(48 + g) * 1280 + (128 + f) + d % 2];
}
kernel void B(global float8* a, global float8* b) {
  uint c = get_global_size(0);
  uint d = get_global_size(1);

  uint e = get_global_id(0);
  uint f = get_global_id(1);

  uint g = 128 / c;
  uint h = 128 / d;

  uint i = e * g + (g >> 1) - 1;
  uint j = f * h + (h >> 1) - 1;

  b[f * c + e] = a[j * 128 + i];
}
kernel void C(global dist_id* a, global float* b, global double* c, local float* d, uint e) {
  uint f = get_local_size(0);

  uint g = get_global_id(0);
  uint h = get_local_id(0);
  uint i = get_group_id(0);

  float j = 0.f;
  float k = 0.f;

  uint l = g << 1;
  if (l < e) {
    j = 100.f / (100.f + a[l].dist);
    b[l] = j;

    k = 100.f / (100.f + a[l + 1].dist);
    b[l + 1] = k;
  }

  d[(h << 1)] = j;
  d[(h << 1) + 1] = k;

  for (uint m = f; m > 0; m >>= 1) {
    barrier(1);
    if (h < m)
      d[h] += d[h + m];
  }

  if (h == 0)
    c[i] = convert_double(d[0]);
}
kernel void D(global dist_id* a, global float* b, global float* c, local float* d, uint e) {
  uint f = get_local_size(0);

  uint g = get_global_id(0);
  uint h = get_local_id(0);
  uint i = get_group_id(0);

  float j = 0.f;
  float k = 0.f;

  uint l = g << 1;
  if (l < e) {
    j = 100.f / (100.f + a[l].dist);
    b[l] = j;

    k = 100.f / (100.f + a[l + 1].dist);
    b[l + 1] = k;
  }

  d[(h << 1)] = j;
  d[(h << 1) + 1] = k;

  for (uint m = f; m > 0; m >>= 1) {
    barrier(1);
    if (h < m)
      d[h] += d[h + m];
  }

  if (h == 0)
    c[i] = d[0];
}
kernel void E(global float4* a, global double* b, local double* c, uint d) {
  uint e = get_local_size(0);
  uint f = get_num_groups(0);

  uint g = get_global_id(0);
  uint h = get_global_id(1);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  uint k = g << 1;
  int4 l = (uint4)(k) < (uint4)(d);
  double4 m = convert_double4(((l) ? (a[h * d + k]) : ((float4)(0.f))));
  l = (uint4)(k + 1) < (uint4)(d);
  double4 n = convert_double4(((l) ? (a[h * d + k + 1]) : ((float4)(0.f))));

  c[(i << 1)] = dot(m, (double4)(1.0));
  c[(i << 1) + 1] = dot(n, (double4)(1.0));

  for (uint o = e; o > 0; o >>= 1) {
    barrier(1);
    if (i < o)
      c[i] += c[i + o];
  }

  if (i == 0)
    b[h * f + j] = c[0];
}
kernel void F(global float4* a, global float4* b, global float4* c, local float* d, uint e) {
  uint f = get_local_size(0);
  uint g = get_num_groups(0);

  uint h = get_global_id(0);
  uint i = get_global_id(1);
  uint j = get_local_id(0);
  uint k = get_group_id(0);

  global float4* l[2] = {a, b};
  global float4* m = l[i];

  uint n = h << 1;
  int3 o = (uint3)(n) < (uint3)(e);
  vstore3(((o) ? (m[n << 1].xyz / (float3)(e)) : ((float3)(0.f))), (j << 1), d);
  vstore3(((o) ? (m[(n + 1) << 1].xyz / (float3)(e)) : ((float3)(0.f))), (j << 1) + 1, d);

  float3 p, q;
  for (uint r = f; r > 0; r >>= 1) {
    barrier(1);
    if (j < r) {
      p = vload3(j, d);
      q = vload3(j + r, d);
      vstore3(p + q, j, d);
    }
  }

  if (j == 0)
        c[i * g + k] = (float4) (vload3 (0, d0.f);
}
kernel void G(global float4* a, global float4* b, global float4* c, global float* d, constant double* e, local float* f, uint g) {
  uint h = get_local_size(0);
  uint i = get_num_groups(0);

  uint j = get_global_id(0);
  uint k = get_global_id(1);
  uint l = get_local_id(0);
  uint m = get_group_id(0);

  global float4* n[2] = {a, b};
  global float4* o = n[k];

  uint p = j << 1;
  int3 q = (uint3)(p) < (uint3)(g);
  vstore3(((q) ? ((float3)(d[p] / e[0]) * o[p << 1].xyz) : ((float3)(0.f))), (l << 1), f);
  vstore3(((q) ? ((float3)(d[p + 1] / e[0]) * o[(p + 1) << 1].xyz) : ((float3)(0.f))), (l << 1) + 1, f);

  float3 r, s;
  for (uint t = h; t > 0; t >>= 1) {
    barrier(1);
    if (l < t) {
      r = vload3(l, f);
      s = vload3(l + t, f);
      vstore3(r + s, l, f);
    }
  }

  if (l == 0)
        c[k * i + m] = (float4) (vload3 (0, f0.f);
}
kernel void H(global float4* a, global float4* b, local float* c, uint d) {
  uint e = get_local_size(0);
  uint f = get_num_groups(0);

  uint g = get_global_id(0);
  uint h = get_global_id(1);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  uint k = g << 1;
  int3 l = (uint3)(k) < (uint3)(d);
  vstore3(((l) ? (a[h * d + k].xyz) : ((float3)(0.f))), (i << 1), c);
  l = (uint3)(k + 1) < (uint3)(d);
  vstore3(((l) ? (a[h * d + k + 1].xyz) : ((float3)(0.f))), (i << 1) + 1, c);

  float3 m, n;
  for (uint o = e; o > 0; o >>= 1) {
    barrier(1);
    if (i < o) {
      m = vload3(i, c);
      n = vload3(i + o, c);
      vstore3(m + n, i, c);
    }
  }

  if (i == 0)
        b[h * f + j] = (float4) (vload3 (0, c0.f);
}
kernel void I(global float4* a, global float4* b, global float4* c, global float4* d, constant float4* e) {
  uint f = get_global_id(0);
  uint g = get_global_id(1);

  global float4* h[2] = {a, b};
  global float4* i[2] = {c d};
  global float4* j = h[g];
  global float4* k = i[g];

  k[f] = j[f * 2] - e[g];
}
kernel void J(global float4* a, global float4* b, global float* c, uint d, float e) {
  uint f = get_global_size(0);

  uint g = get_global_id(0);

  float3 h[4];
  h[0] = (float3)(0.f);
  h[1] = (float3)(0.f);
  h[2] = (float3)(0.f);
  h[3] = (float3)(0.f);

  for (uint i = g; i < d; i += f) {
    int4 j = (uint4)(i) < (uint4)(d);
    float4 k = (float4)e * ((j) ? (a[i]) : ((float4)(0.f)));
    float4 l = (float4)e * ((j) ? (b[i]) : ((float4)(0.f)));

    h[0] += k.xxx * l.xyz;
    h[1] += k.yyy * l.xyz;
    h[2] += k.zzz * l.xyz;
    h[3] += (float3)(dot(lxyz, lxyz), dot(kxyz, kxyz), 0.f);
  }

  uint m = g;
  c[m] = h[0].x;
  m += f;
  c[m] = h[0].y;
  m += f;
  c[m] = h[0].z;
  m += f;
  c[m] = h[1].x;
  m += f;
  c[m] = h[1].y;
  m += f;
  c[m] = h[1].z;
  m += f;
  c[m] = h[2].x;
  m += f;
  c[m] = h[2].y;
  m += f;
  c[m] = h[2].z;
  m += f;
  c[m] = h[3].x;
  m += f;
  c[m] = h[3].y;
}
kernel void K(global float4* a, global float4* b, global float* c, global float* d, uint e, float f) {
  uint g = get_global_size(0);

  uint h = get_global_id(0);

  float3 i[4];
  i[0] = (float3)(0.f);
  i[1] = (float3)(0.f);
  i[2] = (float3)(0.f);
  i[3] = (float3)(0.f);

  for (uint j = h; j < e; j += g) {
    int4 k = (uint4)(j) < (uint4)(e);
    float4 l = (float4)f * ((k) ? (a[j]) : ((float4)(0.f)));
    float4 m = (float4)f * ((k) ? (b[j]) : ((float4)(0.f)));
    float n = ((k.x) ? (c[j]) : (0.f));

    i[0] += (float3)n * (l.xxx * m.xyz);
    i[1] += (float3)n * (l.yyy * m.xyz);
    i[2] += (float3)n * (l.zzz * m.xyz);
    i[3] += (float3)(n * dot(mxyz, mxyz), n * dot(lxyz, lxyz), 0.f);
  }

  uint o = h;
  d[o] = i[0].x;
  o += g;
  d[o] = i[0].y;
  o += g;
  d[o] = i[0].z;
  o += g;
  d[o] = i[1].x;
  o += g;
  d[o] = i[1].y;
  o += g;
  d[o] = i[1].z;
  o += g;
  d[o] = i[2].x;
  o += g;
  d[o] = i[2].y;
  o += g;
  d[o] = i[2].z;
  o += g;
  d[o] = i[3].x;
  o += g;
  d[o] = i[3].y;
}
kernel void L(global float4* a, global float4* b, constant float4* c) {
  uint d = get_global_size(0);
  uint e = get_global_size(1);

  uint f = get_global_id(0);
  uint g = get_global_id(1);

  uint h = g * d + f;

  uint i = h / e;
  uint j = h % e;

  float4 k = a[j * d + i];

  if (i == 0) {
    float4 l = c[0];
    float4 m = c[1];

    float3 n = k.xyz;

    k.xyz = m.w * (n + cross(2 * l.xyz, cross(l.xyz, n) + l.w * n)) + m.xyz;
  }

  b[j * d + i] = k;
}
kernel void M(global float4* a, global float4* b, constant float4* c) {
  uint d = get_global_size(0);
  uint e = get_global_size(1);

  uint f = get_global_id(0);
  uint g = get_global_id(1);

  uint h = g * d + f;

  uint i = h / e;
  uint j = h % e;

  float4 k = a[j * d + i];

  if (i == 0) {
    float4 l = c[0];
    float4 m = c[1];

    float4 n = (float4)(kxyz, 0.f);

    float4 o = (float4)(dot((float4)(l.w, -l.z, l.y, l.x), n), dot((float4)(l.z, l.w, -l.x, l.y), n), dot((float4)(-l.y, l.x, l.w, l.z), n), dot((float4)(-l.x, -l.y, -l.z, l.w), n));

    k.x = m.w * dot((float4)(l.w, -l.z, l.y, -l.x), o) + m.x;
    k.y = m.w * dot((float4)(l.z, l.w, -l.x, -l.y), o) + m.y;
    k.z = m.w * dot((float4)(-l.y, l.x, l.w, -l.z), o) + m.z;
  }

  b[j * d + i] = k;
}
kernel void N(global float4* a, global float4* b, constant float4* c) {
  uint d = get_global_size(0);
  uint e = get_global_size(1);

  uint f = get_global_id(0);
  uint g = get_global_id(1);

  uint h = g * d + f;

  uint i = h / e;
  uint j = h % e;

  float4 k = a[j * d + i];

  if (i == 0) {
    float4 l = k;

    k.x = dot(c[0], l);
    k.y = dot(c[1], l);
    k.z = dot(c[2], l);
  }

  b[j * d + i] = k;
}
inline void O(float4* a, float4* b, float4* c) {
  (*c).x = dot(a[0], *b);
  (*c).y = dot(a[1], *b);
  (*c).z = dot(a[2], *b);
  (*c).w = dot(a[3], *b);
}
kernel void P(global float* a, global float4* b, global float4* c) {
  float d = a[0];
  float e = a[1];
  float f = a[2];
  float g = a[3];
  float h = a[4];
  float i = a[5];
  float j = a[6];
  float k = a[7];
  float l = a[8];

  float m = sqrt(a[9] / a[10]);

  prefetch(b, 2);

  float4 n[4] = lgfk

      float4 o = (float4)(1.f);
  float4 p;

  uint q = 1000;
  float r, s;

  while (true) {
    for (uint t = 0; t < q; ++t) {
      O(n, &o, &p);

      p = fast_normalize(p);

      r = s;
      if ((s = fast_distance(o, p)) == r)
        break;

      o = p;
    }

    float u = dot(n[0], p) / p.x;

    if (u < 0) {
      n[0].x -= u;
      n[1].y -= u;
      n[2].z -= u;
      n[3].w -= u;

      o = (float4)(1.f);
    } else
      break;
  }

  o = p;
  O(n, &o, &p);
  p = normalize(p);

  float4 v = p;

  float3 w = b[0].xyz;
  float3 x = b[1].xyz;

  float3 y = w - m * (x + cross(2 * v.xyz, cross(v.xyz, x) + v.w * x));

  c[0] = v;
    c[1] = (float4) (y m;
}