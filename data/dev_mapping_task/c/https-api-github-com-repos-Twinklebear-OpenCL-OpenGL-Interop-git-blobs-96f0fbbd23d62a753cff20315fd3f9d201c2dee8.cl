__kernel void A(__global float4* a, __local float4* b, uint c) {
  int d = get_global_id(0);
  int e = 0;
  while (d >= c) {
    d -= c--;
    e++;
  }
  d += e;
  c += e;

  __global float4 *f, *g;

  f = a + e * c * 4 + d;
  b += get_local_id(0) * 8;
  b[0] = f[0];
  b[1] = f[c];
  b[2] = f[2 * c];
  b[3] = f[3 * c];

  if (e == d) {
    f[0] = (float4)(bx, bx, bx, bx);
    f[c] = (float4)(by, by, by, by);
    f[2 * c] = (float4)(bz, bz, bz, bz);
    f[3 * c] = (float4)(bw, bw, bw, bw);
  }

  else {
    g = a + d * c * 4 + e;
    b[4] = g[0];
    b[5] = g[c];
    b[6] = g[2 * c];
    b[7] = g[3 * c];

    g[0] = (float4)(bx, bx, bx, bx);
    g[c] = (float4)(by, by, by, by);
    g[2 * c] = (float4)(bz, bz, bz, bz);
    g[3 * c] = (float4)(bw, bw, bw, bw);

    f[0] = (float4)(bx, bx, bx, bx);
    f[c] = (float4)(by, by, by, by);
    f[2 * c] = (float4)(bz, bz, bz, bz);
    f[3 * c] = (float4)(bw, bw, bw, bw);
  }
}