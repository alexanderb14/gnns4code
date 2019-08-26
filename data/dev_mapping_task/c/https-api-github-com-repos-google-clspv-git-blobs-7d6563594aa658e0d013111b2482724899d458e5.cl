kernel void A(global float4* a, global float* b, uint c) {
  *a = vload4(c, b);
}