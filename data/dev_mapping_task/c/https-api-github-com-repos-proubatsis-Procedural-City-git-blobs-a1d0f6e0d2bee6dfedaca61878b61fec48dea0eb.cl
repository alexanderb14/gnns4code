float A(float a, float b) {
  if (b >= a) {
    return 1;
  }
  return 0;
}

float B(float a, float b, float c) {
  return A(a, c) - A(b, c);
}

float3 C(int a) {
  a = a % 5;

  if (a == 1)
    return (float3)(0.2, 0.2, 0.2);
  if (a == 2)
    return (float3)(0, 0, 0.2);
  if (a == 3)
    return (float3)(0.2, 0.2, 0);
  if (a == 4)
    return (float3)(0, 0.1, 0.2);
  return (float3)(0, 0, 0.2);
}

float3 D(float a, float b) {
  float c = a * 5;
  float d = b * 25;
  int e = (int)c;
  int f = (int)d;
  float g = c - e;
  float h = d - f;

  float i = B(0.5 - 0.35 / 2, 0.5 + 0.35 / 2, h);
  if (i > 0) {
    if (f % 2 == 0)
      return C(e + 1);
    return C(e);
  }

  return (float3)(0.9, 0.9, 0.84);
}

__kernel void E(__global unsigned char* a, int b, int c) {
  int d = get_global_id(0);

  float3 e = D((d % b) / (float)b, (d / b) / (float)c);

  d = d * 4;

  a[d] = 255 * e.z;
  a[d + 1] = 255 * e.y;
  a[d + 2] = 255 * e.x;
  a[d + 3] = 255;
}