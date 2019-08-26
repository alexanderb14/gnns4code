__kernel void A(__global float4* a, __global float4* b, __global float* c) {
  float d;

  int e = get_global_size(0);
  int f = e / 4;
  int g = get_global_id(0) * f;
  a += g;
  c += g * 4;

  for (int h = 0; h < e; h++) {
    d = 0.0f;
    for (int i = 0; i < f; i++) {
      d += dot(a[i], b[h * f + i]);
    }
    c[h] = d;
  }
}

inline void B(int a, __local float4* b, __global float4* c) {
  b[0] = c[0];
  b[1] = c[a];
  b[2] = c[2 * a];
  b[3] = c[3 * a];

  c[0] = (float4)(bx, bx, bx, bx);
  c[a] = (float4)(by, by, by, by);
  c[2 * a] = (float4)(bz, bz, bz, bz);
  c[3 * a] = (float4)(bw, bw, bw, bw);
}

__kernel void C(__global float4* a, __local float4* b, uint c) {
  __global float4 *d, *e;

  int f = get_global_id(0);
  int g = 0;
  while (f >= c) {
    f -= c--;
    g++;
  }
  f += g;
  c += g;

  d = a + g * c * 4 + f;
  b += get_local_id(0) * 8;
  b[0] = d[0];
  b[1] = d[c];
  b[2] = d[2 * c];
  b[3] = d[3 * c];

  if (g == f) {
    d[0] = (float4)(bx, bx, bx, bx);
    d[c] = (float4)(by, by, by, by);
    d[2 * c] = (float4)(bz, bz, bz, bz);
    d[3 * c] = (float4)(bw, bw, bw, bw);
  }

  else {
    e = a + f * c * 4 + g;
    b[4] = e[0];
    b[5] = e[c];
    b[6] = e[2 * c];
    b[7] = e[3 * c];

    e[0] = (float4)(bx, bx, bx, bx);
    e[c] = (float4)(by, by, by, by);
    e[2 * c] = (float4)(bz, bz, bz, bz);
    e[3 * c] = (float4)(bw, bw, bw, bw);

    d[0] = (float4)(bx, bx, bx, bx);
    d[c] = (float4)(by, by, by, by);
    d[2 * c] = (float4)(bz, bz, bz, bz);
    d[3 * c] = (float4)(bw, bw, bw, bw);
  }
}