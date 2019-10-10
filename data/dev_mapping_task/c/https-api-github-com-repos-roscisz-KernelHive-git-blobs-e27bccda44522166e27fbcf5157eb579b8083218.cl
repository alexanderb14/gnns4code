struct PreviewObject {
  float f1;
  float f2;
  float f3;
};

__kernel void A(__global float* a, unsigned int b, __global float* c, unsigned int d, __global struct PreviewObject* e) {
  int f = get_global_id(0);

  int g = d / sizeof(float);
  int h = g / get_global_size(0);

  float i = a[1] - a[0];

  for (int j = 0; j < h; j++) {
    int k = (f * h) + j;
    c[k] = a[k] * i;
  }
}