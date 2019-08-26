__kernel void A(__read_only image2d_t a, __global float* b, sampler_t c, int d, int e, int f) {
  int2 g = (int2)(get_global_id(0) - 1, get_global_id(1));
  int2 h = (int2)(get_global_id(0) + 1, get_global_id(1));
  int2 i = (int2)(get_global_id(0), get_global_id(1) + 1);
  int2 j = (int2)(get_global_id(0), get_global_id(1) - 1);
  int2 k = (int2)(get_global_id(0), get_global_id(1));

  float4 l = (float4)(0.299f, 0.587f, 0.114f, 0.0f);

  if (k.x < (d - f) && k.y < e) {
    float m = dot(l, read_imagef(a, c, g));
    float n = dot(l, read_imagef(a, c, h));
    float o = dot(l, read_imagef(a, c, i));
    float p = dot(l, read_imagef(a, c, j));
    float q = __clc_fabs(n - m) + __clc_fabs(o - p);

    b[k.x + d * k.y] = q;
  }
}