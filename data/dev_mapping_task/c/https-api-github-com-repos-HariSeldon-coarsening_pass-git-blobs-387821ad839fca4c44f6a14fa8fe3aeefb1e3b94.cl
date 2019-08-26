__kernel void A(__global float* a, __const int b) {
  unsigned int c = get_global_id(0);

  const unsigned int d = c % b;
  const unsigned int e = 2 * b * (c / b) + d;

  const unsigned int f = e + b;

  float g = a[e];
  float h = a[f];

  a[e] = g + h;
  a[f] = g - h;
}