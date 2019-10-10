__kernel void A(__global float2* a, __global float* b, __global float* c, int d, int e, float f, float g, float h) {
  int i = get_global_id(0);
  int j = get_global_id(1);
  if (i < d && j < e) {
    int k = i + d * j;
    float l = b[i];
    float m = c[j];
    float n = 3.14159265f;

    l *= l;
    m *= m;

    if (sqrt(l + m) < h) {
      a[k].x = cos(n * f * g * (l + m));
      a[k].y = -1 * sin(n * f * g * (l + m));
    } else {
      a[k].x = 0.0f;
      a[k].y = 0.0f;
    }
  }
}