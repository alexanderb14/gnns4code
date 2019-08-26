float A(float a, float b) {
  if (b >= a) {
    return 1;
  }
  return 0;
}

float B(float a, float b, float c) {
  return A(a, c) - A(b, c);
}

float3 C(float a, float b) {
  float c = (1 - B(0.05, 0.95, a)) + (1 - B(0.05, 0.95, b));
  if (c > 0) {
    return (float3)(0.1, 0.1, 0.1);
  }

  if (b > 0.5) {
    return (float3)(0, 0.3, 0.5);
  }
  return (float3)(0.2, 0.2, 0.25);
}

__kernel void D(__global unsigned char* a, int b, int c) {
  int d = get_global_id(0);

  float3 e = C((d % b) / (float)b, (d / b) / (float)c);

  d = d * 4;

  a[d] = 255 * e.z;
  a[d + 1] = 255 * e.y;
  a[d + 2] = 255 * e.x;
  a[d + 3] = 255;
}