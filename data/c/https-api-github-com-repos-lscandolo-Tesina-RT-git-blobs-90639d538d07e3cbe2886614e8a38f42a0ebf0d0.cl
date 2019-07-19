typedef struct {
  float3 ori;
  float3 dir;
  float3 invDir;
  float tMin;
  float tMax;
} Ray;

typedef struct {
  Ray ray;
  int pixel;
  float contribution;
} Sample;

typedef float3 Color;

typedef struct {
  Color diffuse;
  float shininess;
  float reflectiveness;
  float refractive_index;
  int texture;

} Material;

typedef struct {
  bool hit;
  bool shadow_hit;
  bool inverse_n;
  bool reserved;
  float t;
  int id;
  float2 uv;
  float3 n;
  float3 hit_point;

} SampleTraceInfo;

kernel void A(global SampleTraceInfo* a, global Sample* b, global Material* c, global unsigned int* d, global Sample* e, global int* f, int g) {
  int h = get_local_size(0);
  int i = get_group_id(0);
  int j = get_local_id(0);
  int k = get_global_id(0);

  SampleTraceInfo l = a[k];
  if (!l.hit)
    return;

  int m = f[k];
  if (m + 2 >= g)
    return;

  Sample n = b[k];

  int o = d[l.id];
  Material p = c[o];

  float3 q = -normalize(n.ray.dir);
  float3 r = normalize(l.n);
  float s = 1.f;
  Ray t;
  t.tMin = 0.0001f;
  t.tMax = 1e37f;

  if (p.refractive_index > 0.f) {
    float u;
    float v;
    if (l.inverse_n) {
      v = 1.f;
      u = p.refractive_index;
    } else {
      u = 1.f;
      v = p.refractive_index;
    }

    float w = dot(q, r);

    float x = (u / v);
    float y = x * w;
    float z = (1.f + (y - x) * (y + x));

    if (z > 0.f) {
      float aa = (v - 1.f) / (v + 1.f);
      aa *= aa;
      float ab = __clc_pow((1.f - w), 5.f);
      s = aa + (1.f - aa) * ab;

      z = sqrt(z);

      t.ori = l.hit_point;
      t.dir = normalize((y - z) * r - u * q);
      t.invDir = 1.f / t.dir;
      e[m].ray = t;
      e[m].pixel = n.pixel;
      e[m].contribution = n.contribution * p.reflectiveness * (1.f - s);
      m++;
    }
  }

  if (p.reflectiveness > 0.f) {
    q = -q;
    t.ori = l.hit_point;
    t.dir = normalize(q - 2.f * r * (dot(q, r)));
    t.invDir = 1.f / t.dir;
    e[m].ray = t;
    e[m].pixel = n.pixel;
    e[m].contribution = n.contribution * p.reflectiveness * s;
  }
}

kernel void B(global SampleTraceInfo* a, global Sample* b, global Material* c, global unsigned int* d, global int* e) {
  int f = get_global_id(0);
  SampleTraceInfo g = a[f];

  e[f] = 0;

  if (!g.hit)
    return;

  Sample h = b[f];

  int i = d[g.id];
  Material j = c[i];

  float3 k = -normalize(h.ray.dir);
  float3 l = normalize(g.n);

  if (j.refractive_index > 0.f) {
    float m;
    float n;
    if (g.inverse_n) {
      n = 1.f;
      m = j.refractive_index;
    } else {
      m = 1.f;
      n = j.refractive_index;
    }

    float o = dot(k, l);
    float p = (m / n);
    float q = p * o;
    float r = (1.f + (q - p) * (q + p));

    if (r > 0.f) {
      e[f] += 1;
    }
  }

  if (j.reflectiveness > 0.f) {
    e[f] += 1;
  }
}

kernel void C(global SampleTraceInfo* a, global Sample* b, global Material* c, global unsigned int* d, global Sample* e, global int* f, int g, int h) {
  int i = get_local_size(0);
  int j = get_group_id(0);
  int k = get_local_id(0);
  int l = get_global_id(0);

  SampleTraceInfo m = a[l];
  if (!m.hit)
    return;

  int n = f[l];
  int o = f[l + g];

  Sample p = b[l];

  int q = d[m.id];
  Material r = c[q];

  float3 s = -normalize(p.ray.dir);
  float3 t = normalize(m.n);
  float u = 1.f;
  Ray v;
  v.tMin = 0.0001f;
  v.tMax = 1e37f;

  if (r.refractive_index > 0.f && o < h) {
    float w;
    float x;
    if (m.inverse_n) {
      x = 1.f;
      w = r.refractive_index;
    } else {
      w = 1.f;
      x = r.refractive_index;
    }

    float y = dot(s, t);

    float z = (w / x);
    float aa = z * y;
    float ab = (1.f + (aa - z) * (aa + z));

    if (ab > 0.f) {
      float ac = (x - 1.f) / (x + 1.f);
      ac *= ac;
      float ad = __clc_pow((1.f - y), 5.f);
      u = ac + (1.f - ac) * ad;

      ab = sqrt(ab);

      v.ori = m.hit_point;
      v.dir = normalize((aa - ab) * t - w * s);
      v.invDir = 1.f / v.dir;
      e[o].ray = v;
      e[o].pixel = p.pixel;
      e[o].contribution = p.contribution * r.reflectiveness * (1.f - u);
    }
  }

  if (r.reflectiveness > 0.f && n < h) {
    s = -s;

    v.ori = m.hit_point;
    v.dir = normalize(s - 2.f * t * (dot(s, t)));
    v.invDir = 1.f / v.dir;
    e[n].ray = v;
    e[n].pixel = p.pixel;
    e[n].contribution = p.contribution * r.reflectiveness * u;
  }
}

kernel void D(global SampleTraceInfo* a, global Sample* b, global Material* c, global unsigned int* d, global int* e, int f) {
  int g = get_global_id(0);
  SampleTraceInfo h = a[g];

  e[g] = 0;
  e[g + f] = 0;

  if (!h.hit)
    return;

  Sample i = b[g];

  int j = d[h.id];
  Material k = c[j];

  float3 l = -normalize(i.ray.dir);
  float3 m = normalize(h.n);

  if (k.refractive_index > 0.f) {
    float n;
    float o;
    if (h.inverse_n) {
      o = 1.f;
      n = k.refractive_index;
    } else {
      n = 1.f;
      o = k.refractive_index;
    }

    float p = dot(l, m);
    float q = (n / o);
    float r = q * p;
    float s = (1.f + (r - q) * (r + q));

    if (s > 0.f) {
      e[g + f] = 1;
    }
  }

  if (k.reflectiveness > 0.f) {
    e[g] = 1;
  }
}

void E(local int* a, local int* b) {
  size_t c = get_local_id(0);
  size_t d = get_local_size(0) / 2;

  int e = 1;

  b[c] = a[c];

  for (int f = d; f > 0; f >>= 1) {
    barrier(1);

    if (c < f) {
      int g = e * (2 * c + 1) - 1;
      int h = g + e;
      b[h] += b[g];
    }
    e <<= 1;
  }
  barrier(1);

  if (c == 0) {
    b[d * 2 - 1] = 0;
  }

  for (int f = 1; f < d << 1; f <<= 1) {
    e >>= 1;
    barrier(1);
    if (c < f) {
      int g = e * (2 * c + 1) - 1;
      int h = g + e;
      int i = b[g];
      b[g] = b[h];
      b[h] += i;
    }
  }
  barrier(1);
  if (c == 0) {
    b[d * 2] = a[d * 2 - 1] + b[d * 2 - 1];
  }
  barrier(1);
}

int F(const SampleTraceInfo a, const Sample b, global Material* c, global unsigned int* d, Sample* e, Sample* f) {
  if (!a.hit)
    return 0;

  int g = d[a.id];
  Material h = c[g];

  int i = 0;

  float3 j = -normalize(b.ray.dir);
  float3 k = normalize(a.n);
  float l = 1.f;
  Ray m;
  m.tMin = 0.0001f;
  m.tMax = 1e37f;

  if (h.refractive_index > 0.f) {
    float n;
    float o;
    if (a.inverse_n) {
      o = 1.f;
      n = h.refractive_index;
    } else {
      n = 1.f;
      o = h.refractive_index;
    }

    float p = dot(j, k);

    float q = (n / o);
    float r = q * p;
    float s = (1.f + (r - q) * (r + q));

    if (s > 0.f) {
      float t = (o - 1.f) / (o + 1.f);
      t *= t;
      float u = __clc_pow((1.f - p), 5.f);
      l = t + (1.f - t) * u;

      s = sqrt(s);

      m.ori = a.hit_point;
      m.dir = normalize((r - s) * k - n * j);
      m.invDir = 1.f / m.dir;
      f->ray = m;
      f->pixel = b.pixel;
      f->contribution = b.contribution * h.reflectiveness * (1.f - l);
      i++;
    }
  }

  if (h.reflectiveness > 0.f) {
    j = -j;
    m.ori = a.hit_point;
    m.dir = normalize(j - 2.f * k * (dot(j, k)));
    m.invDir = 1.f / m.dir;
    e->ray = m;
    e->pixel = b.pixel;
    e->contribution = b.contribution * h.reflectiveness * l;
    i++;
  }

  return i;
}

kernel void G(global SampleTraceInfo* a, global Material* b, global unsigned int* c, global Sample* d, global Sample* e, global int* f, local int* g, local int* h, int i, int j) {
  int k = (int)get_local_size(0);
  int l = (int)get_local_id(0);

  global int* m = f;
  global int* n = f + 1;

  local int o;

  if (l == 0) {
    o = atomic_add(m, k);
  }
  barrier(1);

  Sample p, q;

  while (o < i) {
    g[l] = 0;

    if (o + l < i) {
      g[l] = F(a[o + l], d[o + l], b, c, &p, &q);
    }
    barrier(1);

    E(g, h);

    barrier(1);

    local int r;
    if (l == 0) {
      int s = h[k];
      r = atomic_add(n, s);
    }
    barrier(1);

    global Sample* t = e + r + h[l];

    if (g[l] > 0) {
      t[0] = p;
      if (g[l] > 1) {
        t[1] = q;
      }
    }

    if (l == 0) {
      o = atomic_add(m, k);
    }
    barrier(1);
  }
}