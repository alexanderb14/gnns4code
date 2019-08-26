__kernel void A(__global const float* a, __global float* b, int c) {
  int d = get_global_id(0);
  if (d < c) {
    float e = a[d * 3];
    float f = a[d * 3 + 1];
    float g = a[d * 3 + 2];

    float h = 0.2126f * e + 0.7152f * f + 0.0722f * g;
    b[d * 3] = b[d * 3 + 1] = b[d * 3 + 2] = h;
  }
}