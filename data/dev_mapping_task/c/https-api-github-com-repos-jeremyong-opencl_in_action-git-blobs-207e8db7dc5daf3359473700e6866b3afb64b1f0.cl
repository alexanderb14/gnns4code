__kernel void A(__global float4* a, __local float4* b, uint c) {
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