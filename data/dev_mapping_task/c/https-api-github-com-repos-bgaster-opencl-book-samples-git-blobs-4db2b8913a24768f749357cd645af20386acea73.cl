__kernel void A(__global float4* a, unsigned int b, unsigned int c, float d) {
  unsigned int e = get_group_id(0) * get_local_size(0) + get_local_id(0);
  unsigned int f = get_group_id(1) * get_local_size(1) + get_local_id(1);

  float g = e / (float)b;
  float h = f / (float)c;
  g = g * 2.0f - 1.0f;
  h = h * 2.0f - 1.0f;

  float i = 4.0f;
  float j = sin(g * i + d) * cos(h * i + d) * 0.5f;

  a[f * b + e] = (float4)(g, j, h, 1.0f);
}