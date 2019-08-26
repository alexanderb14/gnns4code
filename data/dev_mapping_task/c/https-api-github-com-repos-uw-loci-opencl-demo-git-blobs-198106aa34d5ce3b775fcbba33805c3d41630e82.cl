__kernel void A(__global float* a, int b, int c) {
  int d = get_global_id(0);
  int e = d * 4;
  int f = e + 1;
  int g = e + b;
  int h = f + b;
  float i = a[c + e] + a[c + f];
  float j = a[c + e] - a[c + f];
  float k = a[c + g] + a[c + h];
  float l = a[c + g] - a[c + h];
  a[c + e] = i + k;
  a[c + f] = j + l;
  a[c + g] = i - k;
  a[c + h] = j - l;
};