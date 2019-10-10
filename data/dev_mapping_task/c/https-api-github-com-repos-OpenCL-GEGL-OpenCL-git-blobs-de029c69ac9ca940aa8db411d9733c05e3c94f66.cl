__kernel void A(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;

  float f = fmax(d.x, fmax(d.y, d.z));
  float g = fmin(d.x, fmin(d.y, d.z));
  float h = f - g;

  if (f == 0.0f || h == 0.0f) {
      e = (float4) ((1.0f - f                       (1.0f - f                       (1.0f - f                       d;
  } else {
      e = (float4) ((1.0f - fd/ f                      (1.0f - fd/ f                      (1.0f - fd/ f                      d;
  }

  e.w = d.w;
  b[c] = e;
}