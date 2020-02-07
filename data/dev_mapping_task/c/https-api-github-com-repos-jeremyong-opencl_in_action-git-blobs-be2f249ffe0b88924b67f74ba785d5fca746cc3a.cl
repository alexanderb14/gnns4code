__kernel void A(__global float4* a, float b) {
  int c = get_global_id(0) / 16;
  int d = get_global_id(0) % 16;

  float e = -2.0f * (c % 2) + 1.0f;
  float f = 2.0f * 0x1.921fb6p+1f * c / 16 + b;
  float g = 0x1.921fb6p+1f * d / 16;

  a[get_global_id(0)].x = 8 * sin(g) * cos(f);
  a[get_global_id(0)].y = 8 * e * cos(g);
  a[get_global_id(0)].z = 8 * sin(g) * sin(f);
  a[get_global_id(0)].w = 1.0f;
}