typedef unsigned int u32; typedef struct {
  int m_n;
  int m_padding[3];
} ConstBuffer;

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void A(__global float4* a, __global float4* b, ConstBuffer c) {
  int d = get_global_id(0);

  if (d < c.m_n) {
    float4 e = b[d];

    a[d] = e;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void B(__global float4* a, __global float4* b, ConstBuffer c) {
  int d = get_global_id(0);

  if (2 * d <= c.m_n) {
    float4 e = b[d * 2 + 0];
    float4 f = b[d * 2 + 1];

    a[d * 2 + 0] = e;
    a[d * 2 + 1] = f;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void C(__global float4* a, __global float4* b, ConstBuffer c) {
  int d = get_global_id(0);

  if (4 * d <= c.m_n) {
    int e = d * 4 + 0;
    int f = d * 4 + 1;
    int g = d * 4 + 2;
    int h = d * 4 + 3;

    float4 i = b[e];
    float4 j = b[f];
    float4 k = b[g];
    float4 l = b[h];

    a[e] = i;
    a[f] = j;
    a[g] = k;
    a[h] = l;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void D(__global float* a, __global float* b, ConstBuffer c) {
  int d = get_global_id(0);

  if (d < c.m_n) {
    float e = b[d];

    a[d] = e;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void E(__global float2* a, __global float2* b, ConstBuffer c) {
  int d = get_global_id(0);

  if (d < c.m_n) {
    float2 e = b[d];

    a[d] = e;
  }
}