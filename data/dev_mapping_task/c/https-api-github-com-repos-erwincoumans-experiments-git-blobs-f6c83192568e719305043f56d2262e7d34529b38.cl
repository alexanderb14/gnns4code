typedef unsigned int u32; typedef struct {
  u32 m_key;
  u32 m_value;
} SortData;

typedef struct {
  u32 m_startBit;
  u32 m_numGroups;
  u32 m_padding[2];
} ConstBuffer;

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void A(__global SortData* a, __global u32* b, ConstBuffer c) {
  __local u32 d[16][256];

  int e = get_local_id(0);
  int f = get_global_id(0);

  for (int g = 0; g < 16; g++) {
    d[g][e] = 0.f;
    d[g][e + 128] = 0.f;
  }

  barrier(1);

  SortData h[4];
  h[0] = a[f * 4 + 0];
  h[1] = a[f * 4 + 1];
  h[2] = a[f * 4 + 2];
  h[3] = a[f * 4 + 3];

  h[0].m_key = (h[0].m_key >> c.m_startBit) & 0xff;
  h[1].m_key = (h[1].m_key >> c.m_startBit) & 0xff;
  h[2].m_key = (h[2].m_key >> c.m_startBit) & 0xff;
  h[3].m_key = (h[3].m_key >> c.m_startBit) & 0xff;

  int i = e % 16;

  atom_inc(&(d[i][h[0].m_key]));
  atom_inc(&(d[i][h[1].m_key]));
  atom_inc(&(d[i][h[2].m_key]));
  atom_inc(&(d[i][h[3].m_key]));

  barrier(1);

  u32 j, k;
  j = k = 0;
  for (int g = 0; g < 16; g++) {
    j += d[g][e];
    k += d[g][e + 128];
  }

  b[e * c.m_numGroups + get_group_id(0)] = j;
  b[(e + 128) * c.m_numGroups + get_group_id(0)] = k;
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void B(__global SortData* a, __global SortData* b, __global u32* c, ConstBuffer d) {
  __local u32 e[256];

  int f = get_local_id(0);
  int g = get_global_id(0);

  {
    e[f] = c[f * d.m_numGroups + get_group_id(0)];
    e[f + 128] = c[(f + 128) * d.m_numGroups + get_group_id(0)];
  }

  barrier(1);

  SortData h[4];
  int i[4];
  h[0] = a[g * 4 + 0];
  h[1] = a[g * 4 + 1];
  h[2] = a[g * 4 + 2];
  h[3] = a[g * 4 + 3];

  i[0] = (h[0].m_key >> d.m_startBit) & 0xff;
  i[1] = (h[1].m_key >> d.m_startBit) & 0xff;
  i[2] = (h[2].m_key >> d.m_startBit) & 0xff;
  i[3] = (h[3].m_key >> d.m_startBit) & 0xff;

  int j[4];
  for (int k = 0; k < 128; k++) {
    if (k == f) {
      j[0] = atom_inc(&(e[i[0]]));
      j[1] = atom_inc(&(e[i[1]]));
      j[2] = atom_inc(&(e[i[2]]));
      j[3] = atom_inc(&(e[i[3]]));
    }
    barrier(1);
  }
  b[j[0]] = h[0];
  b[j[1]] = h[1];
  b[j[2]] = h[2];
  b[j[3]] = h[3];
}