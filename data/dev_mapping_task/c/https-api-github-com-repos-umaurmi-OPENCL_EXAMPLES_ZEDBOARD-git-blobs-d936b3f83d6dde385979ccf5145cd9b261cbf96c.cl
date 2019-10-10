__kernel void A(__global float* a, __global float* b, __global float* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  float h = 0;
  for (int i = 0; i < d; ++i) {
    float j = b[g * d + i];
    float k = c[i * e + f];
    h += j * k;
  }

  a[g * d + f] = h;
}