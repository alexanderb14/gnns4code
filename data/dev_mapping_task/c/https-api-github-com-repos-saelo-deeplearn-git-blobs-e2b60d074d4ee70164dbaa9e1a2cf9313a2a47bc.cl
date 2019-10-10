typedef int2 pos2; kernel void A(uint a, uint b, uint c, uint d, uint e, uint f, uint g, global const float* h, global float* i) {
  uint2 j, k;
  j.x = get_global_id(0);
  j.y = get_global_id(1);
  uint l = get_global_id(2);
  k.x = j.x * f;
  k.y = j.y * g;

  if (j.x >= a || j.y >= b || l >= c)
    return;

  float m = 0x1.0p-126f;
  for (uint n = k.y; n < k.y + g; n++) {
    for (uint o = k.x; o < k.x + f; o++) {
      if (o < d && n < e)
        m = max(m, h[l * (d * e) + n * d + o]);
    }
  }

  i[l * (a * b) + j.y * a + j.x] = m;
}

kernel void B(uint a, uint b, uint c, uint d, uint e, uint f, uint g, global const float* h, global const float* i, global float* j) {
  uint2 k, l;
  l.x = get_global_id(0);
  l.y = get_global_id(1);
  uint m = get_global_id(2);
  k.x = l.x * f;
  k.y = l.y * g;

  if (l.x >= a || l.y >= b || m >= c)
    return;

  float n = 0x1.0p-126f;
  uint o = k.x, p = k.y;
  for (uint q = k.y; q < k.y + g; q++) {
    for (uint r = k.x; r < k.x + f; r++) {
      if (r < d && q < e) {
        float s = h[m * (d * e) + q * d + r];
        if (s > n) {
          o = r, p = q;
          n = s;
        }
      }
    }
  }

  j[m * (d * e) + p * d + o] = i[m * (a * b) + l.y * a + l.x];
}