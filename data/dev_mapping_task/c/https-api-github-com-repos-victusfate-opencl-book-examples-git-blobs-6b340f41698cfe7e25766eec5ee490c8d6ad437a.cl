typedef struct _slab_header {
  uint offset;
  uint outindex;
  uint outspan;
} slab_header;

typedef struct _packet {
  uint seg_input_offset;
  uint future_seg_input_offset;
  uint npackets_remaining;
  uint seg_output_offset;
  uint pad1;
  uint pad2;
  uint pad3;
  uint pad4;
  ushort input_offset_short[16];
  union {
    float8 matdataV8[2];
    float matdata[16];
  } uf;
} packet;

__kernel void A(__global float* a, __global float* b, __global uint* c, __private uint d, __private uint e, __private uint f, __private uint g, __local float* h) {
  uint i, j, k, l, m, n, o, p, q, r;
  __global slab_header* s;
  __global float* t;
  __global packet* u;
  __global packet* v;
  __global float* w;
  __local float* x;

  s = ((__global slab_header*)c) + get_global_id(1);
  r = s->outspan;
  q = s->outindex;
  p = get_local_size(0) / f;
  j = get_local_id(0);
  o = j / f;
  l = get_global_id(0);
  m = get_global_size(0);

  for (i = l; i < e; i += m) {
    h[i] = 0.0f;
  }
  barrier(1);

  u = &(((__global packet*)c)[s->offset]);
  w = &b[q];

  if (f == 16) {
    k = j % f;
    __global uint* y;
    y = (__global uint*)u;
    int z, aa;
    z = y[o] / 65536;
    aa = y[o] % 65536;
    u += g + z;
    for (i = 0; i < aa; ++i) {
      x = &h[u->seg_output_offset];
      t = &a[u->seg_input_offset];
      x[k] += u->uf.matdata[k] * t[u->input_offset_short[k]];
      ++u;
    }
  } else {
    u += g;
    n = u->npackets_remaining;
    int ab = ((o + 1) * n) / p;
    int ac = ((o)*n) / p;
    v = &u[ab];
    u = &u[ac];
    while (u < v) {
      x = &h[u->seg_output_offset];
      t = &a[u->seg_input_offset];
      for (k = 0; k < 16; ++k) {
        x[k] += u->uf.matdata[k] * t[u->input_offset_short[k]];
      }
      ++u;
    }
  }
  barrier(1);

  for (i = l; i < r; i += m) {
    w[i] = h[i];
  }
}
__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(__global float* a, __global float* b, __global uint* c, __private uint d, __private uint e, __private uint f, __private uint g, __local float* h, __local float* i, __local packet* j) {
  __global slab_header* k;
  __local float* l;
  __local float8* m;
  int n, o;
  event_t p[2], q[2], r;

  int s = f / 2;
  int t = 0;
  while (s) {
    ++t;
    s >>= 1;
  }

  __global packet* u;
  __local packet* v;

  k = ((__global slab_header*)c) + get_global_id(0);
  u = &(((__global packet*)c)[k->offset]);
  u += g;
  v = &j[0];

  int w = 0;
  int x = 0;
  int y = 0;
  int z = 0;
  {
    p[z] = async_work_group_copy((__local uchar16*)&j[(0)], (const __global uchar16*)&u[w], (size_t)((sizeof(packet) / 16) * (f / 2)), (event_t)0);
    w += (f / 2);
  }
  wait_group_events(1, &p[0]);
  uint aa = v->npackets_remaining;
  if (aa == 0)
    return;
  {
    p[z] = async_work_group_copy((__local uchar16*)&j[(f / 2)], (const __global uchar16*)&u[w], (size_t)((sizeof(packet) / 16) * (f / 2)), (event_t)0);
    w += (f / 2);
  }
  o = (f < aa) ? f : aa;
  for (n = 0; n < e; ++n) {
    i[n] = 0.0f;
  }

  uint ab = v->seg_input_offset;
  uint ac = v->future_seg_input_offset;
  { q[0] = async_work_group_copy((__local float8*)&h[d * 0], (const __global float8*)&a[ab], (size_t)(d >> 3), (event_t)0); }
  { q[1] = async_work_group_copy((__local float8*)&h[d * 1], (const __global float8*)&a[ac], (size_t)(d >> 3), (event_t)0); }
  wait_group_events(1, &q[x]);

  while (aa > o) {
    for (n = 0; n < f / 2; ++n) {
      {
        float8 ad[2];
        v = (__local struct _packet*)&j[y];
        if (v->seg_input_offset != ab) {
          ab = v->seg_input_offset;
          ac = v->future_seg_input_offset;
          { q[x] = async_work_group_copy((__local float8*)&h[d * x], (const __global float8*)&a[ac], (size_t)(d >> 3), (event_t)0); }
          x = 1 - x;
          wait_group_events(1, &q[x]);
        }
        l = &h[d * x];
        m = (__local float8*)&i[v->seg_output_offset];
        ad[0].s0 = l[v->input_offset_short[0]];
        ad[0].s1 = l[v->input_offset_short[1]];
        ad[0].s2 = l[v->input_offset_short[2]];
        ad[0].s3 = l[v->input_offset_short[3]];
        ad[0].s4 = l[v->input_offset_short[4]];
        ad[0].s5 = l[v->input_offset_short[5]];
        ad[0].s6 = l[v->input_offset_short[6]];
        ad[0].s7 = l[v->input_offset_short[7]];
        ad[1].s0 = l[v->input_offset_short[8]];
        ad[1].s1 = l[v->input_offset_short[9]];
        ad[1].s2 = l[v->input_offset_short[10]];
        ad[1].s3 = l[v->input_offset_short[11]];
        ad[1].s4 = l[v->input_offset_short[12]];
        ad[1].s5 = l[v->input_offset_short[13]];
        ad[1].s6 = l[v->input_offset_short[14]];
        ad[1].s7 = l[v->input_offset_short[15]];
        m[0] = __clc_fma(v->uf.matdataV8[0], ad[0], m[0]);
        m[1] = __clc_fma(v->uf.matdataV8[1], ad[1], m[1]);
        ++y;
      }
    }

    y &= (f - 1);
    z = (y == (f / 2)) ? 1 : 0;
    aa -= f / 2;
    {
      p[z] = async_work_group_copy((__local uchar16*)&j[((f / 2) - y)], (const __global uchar16*)&u[w], (size_t)((sizeof(packet) / 16) * (f / 2)), (event_t)0);
      w += (f / 2);
    };
    wait_group_events(1, &p[z]);
  }

  while (aa) {
    {
      float8 ad[2];
      v = (__local struct _packet*)&j[y];
      if (v->seg_input_offset != ab) {
        ab = v->seg_input_offset;
        ac = v->future_seg_input_offset;
        { q[x] = async_work_group_copy((__local float8*)&h[d * x], (const __global float8*)&a[ac], (size_t)(d >> 3), (event_t)0); }
        x = 1 - x;
        wait_group_events(1, &q[x]);
      }
      l = &h[d * x];
      m = (__local float8*)&i[v->seg_output_offset];
      ad[0].s0 = l[v->input_offset_short[0]];
      ad[0].s1 = l[v->input_offset_short[1]];
      ad[0].s2 = l[v->input_offset_short[2]];
      ad[0].s3 = l[v->input_offset_short[3]];
      ad[0].s4 = l[v->input_offset_short[4]];
      ad[0].s5 = l[v->input_offset_short[5]];
      ad[0].s6 = l[v->input_offset_short[6]];
      ad[0].s7 = l[v->input_offset_short[7]];
      ad[1].s0 = l[v->input_offset_short[8]];
      ad[1].s1 = l[v->input_offset_short[9]];
      ad[1].s2 = l[v->input_offset_short[10]];
      ad[1].s3 = l[v->input_offset_short[11]];
      ad[1].s4 = l[v->input_offset_short[12]];
      ad[1].s5 = l[v->input_offset_short[13]];
      ad[1].s6 = l[v->input_offset_short[14]];
      ad[1].s7 = l[v->input_offset_short[15]];
      m[0] = __clc_fma(v->uf.matdataV8[0], ad[0], m[0]);
      m[1] = __clc_fma(v->uf.matdataV8[1], ad[1], m[1]);
      ++y;
    }
    y &= (f - 1);
    z = (y == (f / 2)) ? 1 : 0;
    --aa;
    if ((y & ((f / 2) - 1)) == 0) {
      if (aa > f / 2) {
        {
          p[z] = async_work_group_copy((__local uchar16*)&j[((f / 2) - y)], (const __global uchar16*)&u[w], (size_t)((sizeof(packet) / 16) * (f / 2)), (event_t)0);
          w += (f / 2);
        };
      }
      if (aa > 0) {
        wait_group_events(1, &p[z]);
      }
    }
  }

  r = async_work_group_copy((__global float*)&b[k->outindex], (__const local float*)i, (size_t)(k->outspan), (event_t)0);
  wait_group_events(1, &r);
  wait_group_events(1, &q[1 - x]);
  wait_group_events(2, p);
}