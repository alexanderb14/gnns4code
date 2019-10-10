typedef struct sort_info {
  float route_length;

  __global const uint* idx;
} sort_t;

inline uint A(__global uint2* const a) {
  enum _dummy { A = 4294883355U };

  uint b = (*a).x, c = (*a).y;
  uint d = b ^ c;
  uint e = mul_hi(b, A);
  b = b * A + c;
  c = e + (b < c);
  *a = (uint2)(b, c);
  return d;
}
inline float B(const float2 a, const float2 b) {
  return fast_distance(a, b);
}
float C(__global const uint* const __restrict a, const int b, __constant const float2* const __restrict c) {
  uint d;
  float e = 0.0f;

  for (d = 0; d < b; d++) {
    e += B(c[a[d]], c[a[d + 1]]);
  }

  return e;
}

inline bool D(uint* a, int b, int c, int d) {
  for (int e = c; e < c + d; e++) {
    if (a[e] == b) {
      return true;
    }
  }

  return false;
}
__kernel void E(__global const uint* __restrict a, __constant const uint* const __restrict b, __global int* __restrict c) {
  uint d = get_group_id(0);
  uint e = get_local_id(0);
  uint f, g;

  a += 128 * d * 76 + e * 76;
  c += 128 * d * 13 + e * 13;

  int h = 220;

  uint i = 0;

  for (f = 0; f < 13; f++) {
    c[f] = 76 - 1;
  }

  c[1] = 0;
  g = 1;
  for (f = 0; f < 76; f++) {
    h -= b[a[f]];
    i += 1;

    if (h <= 0

        || i >= 16) {
      c[++g] = f;

      i = 1;
      h = 220;

      h -= b[a[f]];
    }
  }

  c[0] = g;
}

__kernel void F(__global const uint* __restrict a, __global float* const __restrict b, __constant const float2* const __restrict c, __global const int* __restrict d) {
  const uint e = get_global_id(0);
  const uint f = get_local_id(0);
  const uint g = get_group_id(0);

  uint h, i;

  a += 128 * g * 76 + f * 76;
  d += 128 * g * 13 + f * 13;

  float j = 0.0f;

  i = 2;

  j += B(c[1], c[a[0]]);

  for (h = 0; h < 76 - 1; h++) {
    if (h + 1 == d[i]) {
      j += B(c[a[h]], c[1]);
      j += B(c[1], c[a[h + 1]]);

      i++;
    } else {
      j += B(c[a[h]], c[a[h + 1]]);
    }
  }

  j += B(c[a[h]], c[1]);

  b[e] = j;
}

__kernel void G(__global float* __restrict a, __global const uint* __restrict b, __global uint* __restrict c) {
  int d = get_local_id(0);
  int e = get_group_id(0);
  int f = get_local_id(0);
  int g = get_global_id(0);

  __local sort_t h[128 * 2];

  b 128 * e f

              h[d] = i;
  barrier(1);

  for (int j = 1; j < 128; j <<= 1) {
    bool k = ((d & (j << 1)) != 0);

    for (int l = j; l > 0; l >>= 1) {
      int m = d ^ l;
      sort_t n = h[d];
      uint o = (n.route_length);
      sort_t p = h[m];
      uint q = (p.route_length);
      bool r = (q < o) || (q == o && m < d);
      bool s = r ^ (m < d) ^ k;
      barrier(1);
      h[d] = (s) ? p : n;
      barrier(1);
    }
  }

  uint t;
  c += 128 * e * 76 + f * 76;

  __global const uint* u = h[f].idx;
  for (t = 0; t < 76; t++) {
    c[t] = u[t];
  }

  a[g] = h[f].route_length;
}

__kernel void H(__global float* __restrict a, __global const uint* __restrict b, __global const uint* __restrict c, __global uint* __restrict d) {
  int e = get_local_id(0);
  int f = get_group_id(0);
  int g = get_local_id(0);

  __local sort_t h[128 * 4];

  a += f * 128;
  d += 128 * 76 * f + g * 76;

  sort_t i;

  int j = g / 2;

  if (g > 128) {
    i.idx = c + 128 * 76 * f + j * 76;
    i.route_length = a[j];
  } else {
    i.idx = b + 128 * 76 * f + j * 76;
    i.route_length = a[j + 512];
  }

  h[g] = i;

  barrier(1);

  for (int k = 1; k < get_local_size(0); k <<= 1) {
    bool l = ((e & (k << 1)) != 0);

    for (int m = k; m > 0; m >>= 1) {
      int n = e ^ m;
      sort_t o = h[e];
      uint p = (o.route_length);
      sort_t q = h[n];
      uint r = (q.route_length);
      bool s = (r < p) || (r == p && n < e);
      bool t = s ^ (n < e) ^ l;
      barrier(1);
      h[e] = (t) ? q : o;
      barrier(1);
    }
  }

  if (g < 128) {
    __global const uint* u = h[g].idx;
    for (e = 0; e < 76; e++) {
      d[e] = u[e];
    }

    a[g] = h[g].route_length;
  }
}

__kernel void I(__global const uint* __restrict a, __global uint* __restrict b) {
  uint c = get_global_id(0);

  b[c] = a[c];
}

__kernel void J(__global const uint* __restrict a, __global uint* __restrict b, __global uint2* const __restrict c) {
  uint d = get_global_id(0);
  uint e = get_group_id(0);
  uint f = get_local_id(0);
  uint g, h;

  a += 128 * 76 * e;

  uint i, j = 0, k;

  do {
    i = j;
    k = A(&c[d]) % 4;
  } while (i == f && j++ < 4 && k > j);
  __global const uint* l = a + f * 76;

  __global const uint* m = a + i * 76;

  uint n[76];
  int o[76];

  for (g = 0; g < 76; g++) {
    o[g] = 0;
  }

  uint p = 1;

  uint q;

  int r = 0;

  for (r = 0; r < 76; p++) {
    do {
      q = A(&c[d]) % 76;
    } while (o[q]);

    while (!o[q]) {
      o[q] = p;

      for (g = 0; g < 76; g++) {
        if (l[g] == m[q]) {
          q = g;
          break;
        }
      }

      r += 1;
    }
  }

  bool s = false;

  for (g = 1; g < p + 1; g++) {
    for (h = 0; h < 76; h++) {
      if (o[h] == g) {
        n[h] = s ? l[h] : m[h];
      }
    }

    s = !s;
  }
  b += 128 * 76 * e + f * 76;

  for (g = 0; g < 76; g++) {
    b[g] = n[g];
  }
}

__kernel void K(__global uint* __restrict a, __global uint2* const __restrict b) {
  uint c = get_global_id(0);
  uint d = get_group_id(0);
  uint e = get_local_id(0);
  uint f, g, h;

  uint i;

  a += 128 * d * 76 + e * 76;
  __global uint* j = a;

  if ((A(&b[c]) % 100) < 1) {
    uint k, l, m, n, o;
    k = A(&b[c]) % 76;

    o = A(&b[c]) % (76 - k);

    o /= 2;

    l = k + o;

    m = A(&b[c]) % (76 - (l + o));

    m += l;

    for (f = 0; f < o; f++) {
      i = j[k + f];
      j[k + f] = j[m + f];
      j[m + f] = i;
      ;
    }
  }
}

__kernel void L(__global uint* __restrict a, __global const int* __restrict b, __constant const float2* const __restrict c, __constant const uint* const __restrict d) {
  uint e = get_global_id(0);
  uint f = get_local_id(0);
  uint g = get_group_id(0);

  uint h, i, j, k;

  a += 128 * g * 76 + f * 76;
  b += 128 * g * 13 + f * 13;
  __global uint* const l = a;

  uint m;

  float n;
  float o;

  uint p = b[0];

  for (h = 1; h < p + 1; h++) {
    uint q = b[h];
    uint r = b[h + 1];

    __global uint* const s = l + q;

    uint t = r - q;

    n = C(s, t, c);

    for (i = 0; i < t; i++) {
      for (j = i + 1; j < t; j++) {
        if (i != j) {
          m = s[i];
          s[i] = s[j];
          s[j] = m;
          ;
          o = C(s, t, c);

          if (o < n) {
            n = o;
          } else {
            m = s[i];
            s[i] = s[j];
            s[j] = m;
            ;
          }
        }
      }
    }
  }
}

__kernel void M(__global uint* __restrict a, __global uint2* const __restrict b) {
  uint c = get_local_id(0);
  uint d = get_group_id(0);
  uint e = get_num_groups(0);

  if (c == 0 && d < e / 2) {
    __global uint* f = a + 128 * d * 76;

    __global uint* g = a + 128 * (d + (e / 2)) * 76;

    uint h;

    uint i;
    for (i = 0; i < 76; i++) {
      h = f[i];
      f[i] = g[i];
      g[i] = h;
      ;
    }
  }
}

__kernel void N(__global uint* __restrict a, __global uint2* const __restrict b) {
  uint c = get_local_id(0);
  uint d = get_group_id(0);
  uint e = get_group_id(0);
  uint f = get_num_groups(0);

  __global uint* g = a + 128 * e * 76;

  __global uint* h = a + 128 * 76 + e;

  uint i;

  int j;
  for (j = 0; j < 76; j++) {
    i = g[j];
    g[j] = h[j];
    h[j] = i;
    ;
  }
}