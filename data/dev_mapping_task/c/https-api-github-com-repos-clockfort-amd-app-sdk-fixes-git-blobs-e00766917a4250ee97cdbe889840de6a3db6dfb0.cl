__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void A(__global uint4* a, __global uint* b, uint c) {
  __local uint d[16 * 256];

  uint e = get_global_id(0);
  uint f = get_local_id(0);
  uint g = get_global_size(0);

  uint h, i;
  uint4 j, k;
  const uint l = (uint)8;
  const uint m = (uint)(256 - 1);
  uint n = (uint)f % (uint)(16);

  uint o = 16 * 256;
  uint p;
  uint q;

  q = ((1) < (get_local_size(0) / o)) ? (1) : (get_local_size(0) / o);

  q = ((1) > (q / o)) ? (1) : (q / o);

  q = o / q;

  q = ((get_local_size(0)) < (q)) ? (get_local_size(0)) : (q);

  p = o / q;

  __local uint4* r = (__local uint4*)d;

  if (f < q) {
    for (h = 0, i = f; h < p / 4; h++, i += q) {
      r[i] = 0;
    }
  }

  barrier(1);

  for (h = 0, i = e; h < c; h++, i += g) {
    j = a[i];
    k = (j & m) * (uint4)16 + n;

    (void)atom_inc(d + k.x);
    (void)atom_inc(d + k.y);
    (void)atom_inc(d + k.z);
    (void)atom_inc(d + k.w);

    j = j >> l;
    k = (j & m) * (uint4)16 + n;

    (void)atom_inc(d + k.x);
    (void)atom_inc(d + k.y);
    (void)atom_inc(d + k.z);
    (void)atom_inc(d + k.w);

    j = j >> l;
    k = (j & m) * (uint4)16 + n;

    (void)atom_inc(d + k.x);
    (void)atom_inc(d + k.y);
    (void)atom_inc(d + k.z);
    (void)atom_inc(d + k.w);

    j = j >> l;
    k = (j & m) * (uint4)16 + n;

    (void)atom_inc(d + k.x);
    (void)atom_inc(d + k.y);
    (void)atom_inc(d + k.z);
    (void)atom_inc(d + k.w);
  }

  barrier(1);

  if (f < 256) {
    uint s = 0;

    for (h = 0; h < 16; h++) {
      s += d[(f * 16) + h];
    }

    b[(get_group_id(0) * 256) + f] = s;
  }
}

__kernel void B(__global uint* a, uint b) {
  uint c = get_global_id(0);
  uint d = 0;

  for (int e = 0; e < b; e++)
    d += a[(e * 256) + c];

  a[c] = d;
}