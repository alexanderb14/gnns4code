__kernel void A(__global const float* a, __global float* b, __global float* c, const int d, const int e, const int f, const int g, const int h, const float i, const int j, const int k) {
  int l = get_global_id(0);
  int m = get_global_id(1);
  int n = j + k;
  int o = n * (m * get_global_size(0) + l);
  int p = ((d + l) & 127) * f + ((e + m) & 127) * g + h;
  float q;
  int r;
  float s = i * c[p];
  for (r = 0; r < j; ++r) {
    q = s + a[o];
    b[o++] = clamp(q, 0.0f, 1.0f);
  }
  if (k)
    b[o] = a[o];
}