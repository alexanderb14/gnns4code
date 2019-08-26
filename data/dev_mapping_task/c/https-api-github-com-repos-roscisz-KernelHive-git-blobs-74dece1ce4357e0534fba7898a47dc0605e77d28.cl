__kernel void A(__global const float* a, unsigned int b, unsigned int c, __global float* d, unsigned int e) {
  int f = get_global_id(0);

  int g = e / sizeof(float);
  int h = g / get_global_size(0);

  float i = a[0];
  float j = a[1];

  float k = (j - i) / g;
  for (int l = 0; l < h; l++) {
    int m = (f * h) + l;
    d[m] = i + (m * k);
  }
}