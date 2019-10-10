__kernel void A(__global const float* a, unsigned int b, __global float* c, unsigned int d) {
  int e = get_global_id(0);

  int f = d / sizeof(float);
  int g = f / get_global_size(0);

  float h = a[1] - a[0];

  for (int i = 0; i < g; i++) {
    int j = (e * g) + i;
    c[j] = exp(a[j]) * h;
  }
}