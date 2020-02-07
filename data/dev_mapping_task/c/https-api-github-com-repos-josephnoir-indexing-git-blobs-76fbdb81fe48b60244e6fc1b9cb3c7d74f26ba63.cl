typedef struct radix_config {
  uint radices;
  uint blocks;
  uint gpb;
  uint tpg;
  uint epg;
  uint rpb;
  uint mask;
  uint l_val;
  uint tpb;
  uint size;
} configuration;

inline void __attribute__((always_inline)) A(local uint* a, int b, int c) {
  uint d = get_local_id(0);
  int e = 2;

  while (e <= b) {
    int f = e >> 1;
    for (int g = (f - 1) + (d * e); (g + e) < b; g += (c * e))
      a[g + f] = a[g] + a[g + f];
    e = e << 1;
    barrier(1);
  }

  a[b - 1] = 0;
  barrier(1);
  while (e >= 2) {
    int f = e >> 1;
    for (int g = (f - 1) + (d * e); (g + f) <= b; g += (c * e)) {
      uint h = a[g + f];
      a[g + f] = a[g] + a[g + f];
      a[g] = h;
    }
    e = e >> 1;
    barrier(1);
  }
}

kernel void B(global uint* restrict a, global uint* restrict b, local uint* c, configuration d, uint e) {
  const uint f = get_local_id(0);
  const uint g = get_group_id(0);
  const uint h = f / d.tpg;

  for (uint i = 0; i < d.radices; ++i)
    c[d.radices * h + i] = 0;
  barrier(1);

  const uint j = g * d.gpb;

  const uint k = f % d.tpg;

  const uint l = (j + h) * d.epg;

  const uint m = d.blocks * d.gpb;

  const uint n = l + k;
  const uint o = min(l + d.epg, d.size);
  for (uint p = n; p < o; p += d.tpg) {
    const uint q = (a[p] >> e) & d.mask;
    const uint r = (d.radices * h + q);

    for (uint s = 0; s < d.tpg; ++s) {
      if (k == s)
        ++c[r];
      barrier(1);
    }
  }
  for (uint i = 0; i < d.radices; ++i) {
    const uint t = d.radices * h + i;
    const uint u = i * m + j + h;

    b[u] = c[t];
  }
}

kernel void C(global uint* restrict a, global uint* restrict b, global uint* restrict c, local uint* d, configuration e, uint f) {
  const uint g = get_local_id(0);
  const uint h = get_group_id(0);
  const uint i = e.blocks * e.gpb;
  const uint j = e.rpb * h;
  for (uint k = 0; k < e.rpb; ++k) {
    const uint l = j + k;
    const uint m = (l * i) + g;
    const uint n = (l + 1) * i;
    const uint o = b[((l + 1) * i) - 1];

    int p = 0;
    for (uint q = m; q < n; q += e.tpb) {
      d[e.tpb * p + g] = b[q];
      ++p;
    }
    barrier(1);
    A(d, i, e.tpb);
    barrier(1);
    if (g == 1)
      c[l] = d[i - 1] + o;
    barrier(2);
    p = 0;
    for (uint q = m; q < n; q += e.tpb) {
      b[q] = d[g + e.tpb * p];
      ++p;
    }
    barrier(2);
  }
}

kernel void D(global uint* restrict a, global uint* restrict b, global uint* restrict c, global uint* restrict d, local uint* e, local uint* f, configuration g, uint h) {
  const uint i = get_local_id(0);
  const uint j = get_group_id(0);
  const uint k = i / g.tpg;
  const uint l = g.rpb * j;
  const uint m = g.gpb * g.blocks;

  for (uint n = i; n < g.radices; n += g.tpb) {
    f[n] = d[n];
  }
  barrier(1);
  A(f, g.radices, g.tpb);
  barrier(1);

  for (uint n = 0; n < g.gpb; ++n) {
    if (i < g.radices) {
      e[i * g.gpb + n] = c[i * m + j * g.gpb + n] + f[i];
    }
  }
  barrier(1);
  const uint o = j * g.gpb;
  const uint p = i % g.tpg;
  const uint q = (o + k) * g.epg;
  const uint r = q + p;
  const uint s = min(q + g.epg, g.size);
  for (uint n = r; n < s; n += g.tpg) {
    const uint t = (a[n] >> h) & g.mask;
    const uint u = (t * g.gpb) + k;
    for (uint v = 0; v < g.tpg; ++v) {
      if (p == v) {
        b[e[u]] = a[n];
        ++e[u];
      }
      barrier(1);
    }
  }
}

kernel void E(global uint* restrict a, global uint* restrict b, global uint* restrict c, global uint* restrict d, global uint* restrict e, global uint* restrict f, local uint* g, local uint* h, configuration i, uint j) {
  const uint k = get_local_id(0);
  const uint l = get_group_id(0);
  const uint m = k / i.tpg;
  const uint n = i.rpb * l;
  const uint o = i.gpb * i.blocks;

  for (uint p = k; p < i.radices; p += i.tpb) {
    h[p] = f[p];
  }
  barrier(1);
  A(h, i.radices, i.tpb);
  barrier(1);

  for (uint p = 0; p < i.gpb; ++p) {
    if (k < i.radices) {
      g[k * i.gpb + p] = e[k * o + l * i.gpb + p] + h[k];
    }
  }
  barrier(1);
  const uint q = l * i.gpb;
  const uint r = k % i.tpg;
  const uint s = (q + m) * i.epg;
  const uint t = s + r;
  const uint u = min(s + i.epg, i.size);
  for (uint p = t; p < u; p += i.tpg) {
    const uint v = (a[p] >> j) & i.mask;
    const uint w = (v * i.gpb) + m;
    for (uint x = 0; x < i.tpg; ++x) {
      if (r == x) {
        b[g[w]] = a[p];
        d[g[w]] = c[p];
        ++g[w];
      }
      barrier(1);
    }
  }
}