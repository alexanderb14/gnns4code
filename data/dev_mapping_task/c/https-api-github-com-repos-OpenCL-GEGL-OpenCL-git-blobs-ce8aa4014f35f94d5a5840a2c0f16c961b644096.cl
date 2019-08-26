float2 A(uint2 a, uint b) {
  ulong c;
  int d;

  for (d = 0; d < 3; d += 1) {
    c = a.x * 0xcd9e8d57ul;

    a.x = ((uint)(c >> 32)) ^ a.y ^ b;
    a.y = (uint)c;

    b += 0x9e3779b9u;
  }

  return convert_float2(a) / 2147483648.0f - 1.0f;
}

__kernel void B(__global float* a, const int b, const int c, const uint d, const float e, const uint f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  float i, j, k;
  float2 l;
  int m;

  for (m = 0, k = 0, i = 1, j = e; m < d; i *= 2, j *= 2, m += 1) {
    float n, o, p;
    float2 q[3], r[3], s, t;
    int u;

      l = (float2)(gbhc* j;




      n = (l.x + l.y) * (sqrt(3.0f) - 1) / 2;
      s = __clc_floor(l + n);




      n = (s.x + s.y) * (3 - sqrt(3.0f)) / 6;
      r[0] = l - s + n;

      t = r[0].x >= r[0].y ? (float2)(1, 0) : (float2)(0, 1);

      r[1] = r[0] - t + (3 - sqrt(3.0f)) / 6;
      r[2] = r[0] - 1 + (3 - sqrt(3.0f)) / 3;






      q[0] = A(convert_uint2(convert_int2(s)), f);
      q[1] = A(convert_uint2(convert_int2(s + t)), f);
      q[2] = A(convert_uint2(convert_int2(s + 1)), f);

      for (u = 0, p = 0 ; u < 3 ; u += 1)
        {
      o = 0.5f - dot(r[u], r[u]);

      if (o > 0) {
        o *= o;
        p += o * o * dot(q[u], r[u]);
      }
        }

      k += 70 * p / i;
  }

  a[h * get_global_size(0) + g] = k;
}