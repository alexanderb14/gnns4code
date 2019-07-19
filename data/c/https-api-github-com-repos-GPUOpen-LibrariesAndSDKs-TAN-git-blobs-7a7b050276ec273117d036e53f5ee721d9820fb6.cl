__kernel void A(__global short* a, long b, long c, __global short* d, long e, long f) {
  int g = get_global_id(0);
  d[(g * e) + f] = a[(g * b) + c];
}

__kernel void B(__global float* a, long b, long c, __global float* d, long e, long f) {
  int g = get_global_id(0);
  d[(g * e) + f] = a[(g * b) + c];
}

__kernel void C(__global short* a, long b, long c, __global float* d, long e, long f, float g) {
  float h = g / 32767;

  int i = get_global_id(0);
  d[(i * e) + f] = convert_float(a[(i * b) + c]) * h;
}

__kernel void D(__global float* a, long b, long c, __global short* d, long e, long f, float g, __global int* h) {
  int i = get_global_id(0);

  float j = 32767 * g;
  float k = a[(i * b) + c] * j;

  if (k > 32767) {
    k = 32767;
    *h = 1;
  }

  if (k < (-32767 - 1)) {
    k = (-32767 - 1);
    *h = 1;
  }

  d[(i * e) + f] = convert_short(k);
}