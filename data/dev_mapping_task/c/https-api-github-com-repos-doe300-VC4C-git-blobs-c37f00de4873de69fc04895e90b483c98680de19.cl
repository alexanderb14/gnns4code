__kernel void A(__global float* a) {
  int b = get_local_id(0);
  float16 c = vload16(b, a);
  vstore16(c * 2, b, a);
}