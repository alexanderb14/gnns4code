__kernel void A(__global float2* a, __global float2* b, __global float2* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  if (f < d && g < e) {
    int h = f + d * g;

    c[h].x = a[h].x * b[h].x - a[h].y * b[h].y;
    c[h].y = a[h].x * b[h].y + a[h].y * b[h].x;
  }
}