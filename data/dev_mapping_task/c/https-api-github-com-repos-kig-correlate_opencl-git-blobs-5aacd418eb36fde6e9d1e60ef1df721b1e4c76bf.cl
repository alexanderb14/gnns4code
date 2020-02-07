__kernel void A(__global float4* a, __global float4* b, const int c) {
  uint d = get_global_id(0);
  float4 e = (float4)0.0f;
  for (int f = 0; f < c; f++) {
    e += b[f];
  }
  a[d] = e;
}