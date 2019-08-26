typedef unsigned int u32; typedef struct {
  u32 m_key;
  u32 m_value;
} SortData;

typedef struct {
  u32 m_nSrc;
  u32 m_nDst;
  u32 m_padding[2];
} ConstBuffer;

__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void A(__global SortData* a, __global u32* b, unsigned int c, unsigned int d) {
  int e = get_global_id(0);

  if (e < c) {
    SortData f;
    f.m_key = (u32)(-1);
    f.m_value = (u32)(-1);
    SortData g;
    g.m_key = d;
    g.m_value = d;

    SortData h = (e == 0) ? f : a[e - 1];
    SortData i = (e == c) ? g : a[e];

    if (h.m_key != i.m_key) {
      u32 j = i.m_key;
      { b[j] = e; }
    }
  }
}

__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void B(__global SortData* a, __global u32* b, unsigned int c, unsigned int d) {
  int e = get_global_id(0);

  if (e < c + 1) {
    SortData f;
    f.m_key = 0;
    f.m_value = 0;
    SortData g;
    g.m_key = d;
    g.m_value = d;

    SortData h = (e == 0) ? f : a[e - 1];
    SortData i = (e == c) ? g : a[e];

    if (h.m_key != i.m_key) {
      u32 j = h.m_key;
      { b[j] = e; }
    }
  }
}

__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void C(__global u32* a, __global u32* b, __global u32* c, unsigned int d, unsigned int e) {
  int f = get_global_id(0);

  if (f < e) {
    c[f] = a[f] - b[f];
  }
}