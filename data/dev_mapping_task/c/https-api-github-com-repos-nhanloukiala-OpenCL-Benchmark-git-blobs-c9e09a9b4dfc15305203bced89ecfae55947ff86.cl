__kernel void A(__global float* a, __global float* b) {
  size_t c = 4;
  size_t d = (get_group_id(0) * get_local_size(0) + get_local_id(0)) * c;
  size_t e = d;
  size_t f = (d + 1);
  size_t g = (d + 2);
  size_t h = (d + 3);

  float16 i = vload16(e, a);
  float16 j = vload16(f, a);
  float16 k = vload16(g, a);
  float16 l = vload16(h, a);

  vstore16(i, e, b);
  vstore16(j, f, b);
  vstore16(k, g, b);
  vstore16(l, h, b);
}