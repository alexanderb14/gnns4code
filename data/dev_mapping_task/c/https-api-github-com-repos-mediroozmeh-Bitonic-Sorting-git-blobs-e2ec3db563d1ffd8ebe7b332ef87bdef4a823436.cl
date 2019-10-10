inline void A(uint* a, uint* b, uint* c, uint* d, uint e) {
  if ((*a > *c) == e) {
    uint f;
    f = *a;
    *a = *c;
    *c = f;
    f = *b;
    *b = *d;
    *d = f;
  }
}

inline void B(__local uint* a, __local uint* b, __local uint* c, __local uint* d, uint e) {
  if ((*a > *c) == e) {
    uint f;
    f = *a;
    *a = *c;
    *c = f;
    f = *b;
    *b = *d;
    *d = f;
  }
}

__kernel __attribute__((reqd_work_group_size(32 / 2, 1, 1))) void C(__global uint* a, __global uint* b, __global uint* c, __global uint* d) {
  __attribute__((xcl_array_partition(complete, 1))) __local uint e[32];
  __attribute__((xcl_array_partition(complete, 1))) __local uint f[32];

  async_work_group_copy(e, c + get_group_id(0) * 32, 32, 0);
  async_work_group_copy(f, d + get_group_id(0) * 32, 32, 0);

  uint g = get_global_id(0) & ((32 / 2) - 1);

  __attribute__((xcl_pipeline_loop)) for (uint h = 2; h < 32; h <<= 1) {
    uint i = (g & (h / 2)) != 0;
    for (uint j = h / 2; j > 0; j >>= 1) {
      barrier(1);

      uint k = 2 * get_local_id(0) - (get_local_id(0) & (j - 1));
      B(&e[k], &f[k], &e[k + j], &f[k + j], i);
    }
  }

  uint i = (get_group_id(0) & 1);

  __attribute__((xcl_pipeline_loop)) for (uint j = 32 / 2; j > 0; j >>= 1) {
    barrier(1);

    uint k = 2 * get_local_id(0) - (get_local_id(0) & (j - 1));

    B(&e[k], &f[k], &e[k + j], &f[k + j], i);
  }

  async_work_group_copy(a + get_group_id(0) * 32, e, 32, 0);
  async_work_group_copy(b + get_group_id(0) * 32, f, 32, 0);
}

__kernel void D(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e, uint f, uint g, uint h) {
  __attribute__((xcl_pipeline_workitems)) {
    uint i = get_global_id(0);
    uint j = i & (e / 2 - 1);

    uint k = h ^ ((j & (f / 2)) != 0);
    uint l = 2 * i - (i & (g - 1));
    uint m = c[l];
    uint n = d[l];
    uint o = c[l + g];
    uint p = d[l + g];

    A(&m, &n, &o, &p, k);

    a[l] = m;
    b[l] = n;
    a[l + g] = o;
    b[l + g] = p;
  }
}

__kernel __attribute__((reqd_work_group_size(32 / 2, 1, 1))) void E(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e, uint f, uint g, uint h) {
  __attribute__((xcl_array_partition(complete, 1))) __local uint i[32];
  __attribute__((xcl_array_partition(complete, 1))) __local uint j[32];

  async_work_group_copy(i, c + get_group_id(0) * 32, 32, 0);
  async_work_group_copy(j, d + get_group_id(0) * 32, 32, 0);

  uint k = get_global_id(0) & ((e / 2) - 1);
  uint l = h ^ ((k & (g / 2)) != 0);

  __attribute__((xcl_pipeline_loop)) for_mergelocal_last : for (; f > 0; f >>= 1) {
    barrier(1);

    uint m = 2 * get_local_id(0) - (get_local_id(0) & (f - 1));
    B(&i[m], &j[m], &i[m + f], &j[m + f], l);
  }

  barrier(1);

  async_work_group_copy(a + get_group_id(0) * 32, i, 32, 0);
  async_work_group_copy(b + get_group_id(0) * 32, j, 32, 0);
}