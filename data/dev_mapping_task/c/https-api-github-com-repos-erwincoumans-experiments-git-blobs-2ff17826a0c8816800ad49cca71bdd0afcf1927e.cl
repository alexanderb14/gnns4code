__kernel void A(__global const float8* a, __global const float8* b, __global float8* c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;

  float8 f = a[e];
  float8 g = b[e];

  float8 h = f + g;

  c[e] = h;
}