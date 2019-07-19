inline float4 A(float a, float b, float c, float d, float e, float4 f) {
  return mad(f, mad(f, mad(f, mad(f, e, d), c), b), a);
}

kernel void B(uint a, const global float4* b, global float4* c, float d, float e, float f, float g, float h) {
  size_t i = get_global_id(0);

  for (uint j = 0; j < 64; j++) {
    float4 k = b[i * 4];
    float4 l = b[i * 4 + 1];
    float4 m = b[i * 4 + 2];
    float4 n = b[i * 4 + 3];
    for (uint o = 0; o < 64; o++) {
      k = A(d, e, f, g, h, k);
      l = A(d, e, f, g, h, l);
      m = A(d, e, f, g, h, m);
      n = A(d, e, f, g, h, n);
    }

    c[i * 4] = k;
    c[i * 4 + 1] = l;
    c[i * 4 + 2] = m;
    c[i * 4 + 3] = n;

    i += get_global_size(0);
  }
}