__kernel void A(__global float* a) {
  float4 b = (float4)(5.0);

  for (int c = 0; c < 1024; c++) {
    vstore4(b, c, a);
  }
}