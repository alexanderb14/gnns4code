__kernel void A(__global float* a, __global float* b, __global float* c, float d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = f * 128 + e;

  if (e > 2 && e < 128 - 2 && f > 2 && f < 128 - 2) {
    b[g] = 2.0f * a[g] - b[g] + c[g] * (16.0f * (a[g - 1] + a[g + 1] + a[g - 128] + a[g + 128]) - (a[g - 2] + a[g + 2] + a[g - (128 * 2)] + a[g + (128 * 2)]) - 60.0f * a[g]);
  }

  if (g == 16)
    b[g] += d;
}

__kernel void B(__global float* a, __global float* b, float c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = e * 128 + d;

  a[f] = 0.0f;
  b[f] = 0.0f;

  if (f == 16)
    a[f] += c;
}