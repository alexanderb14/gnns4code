float A(float a, float b, float c) {
  return (-2.0f * cos(3.141592653589793 * (c) / 8.0f) * sin(3.141592653589793 * (a)) * sin(3.141592653589793 * (a)) * cos(3.141592653589793 * (b)) * sin(3.141592653589793 * (b)));
}

float B(float a, float b, float c) {
  return (2.0f * cos(3.141592653589793 * (c) / 8.0f) * cos(3.141592653589793 * (a)) * sin(3.141592653589793 * (a)) * sin(3.141592653589793 * (b)) * sin(3.141592653589793 * (b)));
}

__kernel void C(int a, __global float3* b, float c, float d) {
  int e;
  float f, g, h, i, j, k, l, m, n, o;
  float p, q, r;
  e = get_global_id(0);
  if (e < a) {
    f = b[e].x;
    g = b[e].y;

    h = A(f, g, c);
    i = B(f, g, c);

    p = f + 0.5f * h * d;
    q = g + 0.5f * i * d;
    r = c + 0.5f * d;
    j = A(p, q, r);
    k = B(p, q, r);

    p = f + 0.5f * j * d;
    q = g + 0.5f * k * d;
    r = c + 0.5f * d;
    l = A(p, q, r);
    m = B(p, q, r);

    p = f + l * d;
    q = g + m * d;
    r = c + d;
    n = A(p, q, r);
    o = B(p, q, r);

    b[e].x = f + (h + 2.0f * j + 2.0f * l + n) / 6.0f * d;
    b[e].y = g + (i + 2.0f * k + 2.0f * m + o) / 6.0f * d;
  }
}