__kernel void A(__global float* a, int b, int c, int d, int e) {
  int2 f = (int2)(get_global_id(0), get_global_id(1));

  if (f.x < 1) {
    (a)[((f.y) * d + (f.x))] = 0x1.fffffep127f;
  } else if (f.x < b && f.x > (b - (1 + e))) {
    (a)[((f.y) * d + (f.x))] = 0x1.fffffep127f;
  }
}