__kernel void A(__read_only image2d_t a, __read_only image2d_t b, __global float4* c) {
  float4 d = 0;
  int2 e;
  int f = (int)get_global_size(0);
  int g = (int)get_global_size(1);
  const sampler_t h = 0x0000 | 0x0004 | 0x0000;
  int i, j;

  int k = (int)get_global_id(0);
  int l = (int)get_global_id(1);

  for (i = 0; i < 4; i++) {
    e.x = k + i * f;
    for (j = 0; j < 4; j++) {
      e.y = l + j * g;
      d = d + read_imagef(a, h, e) + read_imagef(b, h, e);
    }
  }
  c[l * f + k] = d;
}