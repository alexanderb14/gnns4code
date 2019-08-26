__kernel void A(__global float4* a, int b, float c, float4 d) {
  int e = get_global_id(0);
  if (e >= b)
    return;

  float4 f = a[e];

  for (int g = 0; g < 10000; g++) {
    f += c * d;
  }

  a[e] = f;
}