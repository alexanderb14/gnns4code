__kernel void A(__global float8* a, __global float8* b, __global float8* c) {
  uint8 d = (uint8)(0, -1, 0, -1, 0, -1, 0, -1);

  uint e = get_global_id(0);
  float8 f = a[e + 1];
  float8 g = b[e + 1];
  c[e + 1] = ((d) ? (g) : (f));
}