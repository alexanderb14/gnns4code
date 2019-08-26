kernel void A(uint a, const global float4* b, global float4* c) {
  size_t d = get_global_id(0);

  for (uint e = 0; e < 64; e++) {
    float4 f, g, h, i;
    float4 j, k, l, m;

    float4 n = b[d * 4];
    float4 o = b[d * 4 + 1];
    float4 p = b[d * 4 + 2];
    float4 q = b[d * 4 + 3];

    for (uint r = 0; r < 64; r++) {
      f = mad(n, -o, p);
      g = mad(o, p, q);
      h = mad(p, -q, n);
      i = mad(q, n, o);

      j = mad(f, g, h);
      k = mad(g, h, i);
      l = mad(h, i, f);
      m = mad(i, f, g);

      f = mad(j, -k, l);
      g = mad(k, l, -m);
      h = mad(l, -m, j);
      i = mad(m, j, -k);

      n = __builtin_astype((__builtin_astype(f, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
      o = __builtin_astype((__builtin_astype(g, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
      p = __builtin_astype((__builtin_astype(h, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
      q = __builtin_astype((__builtin_astype(i, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
    }

    c[d * 4] = n;
    c[d * 4 + 1] = o;
    c[d * 4 + 2] = p;
    c[d * 4 + 3] = q;
    d += get_global_size(0);
  }
}