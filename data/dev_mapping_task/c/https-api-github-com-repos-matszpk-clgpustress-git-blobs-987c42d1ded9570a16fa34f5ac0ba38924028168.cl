kernel void A(uint a, const global float4* b, global float4* c) {
  local float d[128];
  size_t e = get_global_id(0);
  const size_t f = get_local_id(0);

  for (uint g = 0; g < 64; g++) {
    float h;
    float4 i, j, k, l;
    float4 m, n, o, p;

    float4 q = b[e * 4];
    float4 r = b[e * 4 + 1];
    float4 s = b[e * 4 + 2];
    float4 t = b[e * 4 + 3];

    for (uint u = 0; u < 64; u++) {
      i = mad(q, -r, s);
      j = mad(r, s, t);
      k = mad(s, -t, q);
      l = mad(t, q, r);

      d[f] = (l.x + l.y + l.z + l.w) * 0.25f;
      barrier(1);
      h = d[(f + 7) % 128];
      barrier(1);

      i += h;
      m = mad(i, j, k);
      n = mad(j, k, l);
      o = mad(k, l, i);
      p = mad(l, i, j);

      d[f] = (j.x + j.y + j.z + j.w) * 0.25f;
      barrier(1);
      h = d[(f + 55) % 128];
      barrier(1);

      m += h;
      i = mad(m, -n, o);
      j = mad(n, o, -p);
      k = mad(o, -p, m);
      l = mad(p, m, -n);

      q = __builtin_astype((__builtin_astype(i, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
      r = __builtin_astype((__builtin_astype(j, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
      s = __builtin_astype((__builtin_astype(k, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
      t = __builtin_astype((__builtin_astype(l, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
    }

    c[e * 4] = q;
    c[e * 4 + 1] = r;
    c[e * 4 + 2] = s;
    c[e * 4 + 3] = t;

    e += get_global_size(0);
  }
}