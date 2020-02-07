typedef unsigned int u32; typedef struct {
  union {
    int4 m_data;
    uint4 m_unsignedData;
  };
  int m_offset;
  int m_n;
  int m_padding[2];
} ConstBuffer;

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void A(__global int* a, ConstBuffer b) {
  int c = get_global_id(0);

  if (c < b.m_n) {
    a[b.m_offset + c] = b.m_data.x;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void B(__global unsigned int* a, const int b, const unsigned int c) {
  int d = get_global_id(0);

  if (d < b) {
    a[d] = c;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void C(__global int2* a, const int b, const int2 c, const int d) {
  int e = get_global_id(0);

  if (e < b) {
  a[ e + d] = (int2)( cc;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void D(__global int4* a, ConstBuffer b) {
  int c = get_global_id(0);

  if (c < b.m_n) {
    a[b.m_offset + c] = b.m_data;
  }
}