typedef struct {
  union {
    float4 m_min;
    float m_minElems[4];
    int m_minIndices[4];
  };
  union {
    float4 m_max;
    float m_maxElems[4];
    int m_maxIndices[4];
  };
} btAabbCL;

bool A(const btAabbCL* a, __local const btAabbCL* b);
bool A(const btAabbCL* a, __local const btAabbCL* b) {
  if ((a->m_maxIndices[3] == 0) && (b->m_maxIndices[3] == 0))
    return false;

  bool c = true;
  c = (a->m_min.x > b->m_max.x || a->m_max.x < b->m_min.x) ? false : c;
  c = (a->m_min.z > b->m_max.z || a->m_max.z < b->m_min.z) ? false : c;
  c = (a->m_min.y > b->m_max.y || a->m_max.y < b->m_min.y) ? false : c;
  return c;
}

__kernel void B(__global const btAabbCL* a, volatile __global int2* b, volatile __global int* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_local_id(0);

  __local int i[1];
  __local int j[1];
  __local btAabbCL k[128];

  int2 l[64];

  btAabbCL m;

  m = (g < d) ? a[g] : a[0];
  float n = m.m_maxElems[e];

  if (h == 0) {
    i[0] = 0;
    j[0] = 0;
  }
  int o = 0;
  int p = 0;
  k[h] = (g + p) < d ? a[g + p] : a[0];
  k[h + 64] = (g + p + 64) < d ? a[g + p + 64] : a[0];

  barrier(1);
  atomic_add(i, 1);
  barrier(1);
  int q = 0;
  int r = 0;

  int s = g + 1;
  do {
    barrier(1);

    if (s < d) {
      if (n < (k[o + h + 1].m_minElems[e])) {
        if (!q) {
          atomic_add(j, 1);
          q = 1;
        }
      }
    }

    barrier(1);

    if (s >= d && !q) {
      atomic_add(j, 1);
      q = 1;
    }
    barrier(1);

    if (!q) {
      if (A(&m, &k[o + h + 1])) {
        int2 t;
        t.x = m.m_minIndices[3];
        t.y = k[o + h + 1].m_minIndices[3];
        l[r] = t;
        r++;
        if (r == 64) {
          int u = atomic_add(c, r);

          if ((u + r) < f) {
            for (int v = 0; v < r; v++) {
              b[u + v] = l[v];
            }
          }
          r = 0;
        }
      }
    }
    barrier(1);

    o++;
    if (o == 64) {
      o = 0;
      p += 64;
      k[h] = ((g + p) < d) ? a[g + p] : a[0];
      k[h + 64] = ((g + 64 + p) < d) ? a[g + p + 64] : a[0];
    }
    s++;

  } while (j[0] < i[0]);

  if (r > 0) {
    int u = atomic_add(c, r);
    if ((u + r) < f) {
      for (int v = 0; v < r; v++) {
        b[u + v] = l[v];
      }
    }
    r = 0;
  }
}