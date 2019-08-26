typedef struct TerrainVertex {
  float4 Position;
  float4 Normal;
} Vertex;

__kernel void A(global Vertex* a, private int b, private int c

                ) {
  float d = get_global_id(0);
  float e = get_global_id(1);
  float f = 1.0f;

  int g = (d * b) + e;

  a[g].Position.x = (e * f) + ((b - 1) * -0.5f);
  a[g].Position.y = 0.0f;
  a[g].Position.z = (-d * f) + ((c - 1) * 0.5f);
  a[g].Position.w = 0.0f;

  a[g].Normal = (float4)(0.0f, 1.0f, 0.0f, 0.0f);
}

__kernel void B(global int* a, private int b

                ) {
  int c = get_global_id(0);
  int d = get_global_id(1);
  int e = get_global_id(2);

  int f = ((c * (b - 1) + d) * 6) + e;

  if (e == 0)
    a[f] = c * b + d;

  if (e == 1 || e == 4)
    a[f] = c * b + d + 1;

  if (e == 2 || e == 3)
    a[f] = (c + 1) * b + d;

  if (e == 5)
    a[f] = (c + 1) * b + d + 1;
}

float C(float2 a, float b, float c) {
  return (a.x * b + a.y * c);
}

float D(float a, float b, float c) {
  return ((1 - c) * a + c * b);
}

float E(float a) {
  return (a * a * a * (a * (6 * a - 15) + 10));
}

__kernel void F(global float* a, global float2* b, global int* c, private int d, private int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  int h, i, j, k, l, m;
  float n, o, p, q, r, s, t, u, v;
  float w = 0.80f;
  float x = 2.0f;

  float y = 10.0f;
  float z = 1.0f / (float)d;
  float aa = 0.0f;

  for (int ab = 0; ab < e; ab++) {
    h = __clc_floor((float)g * z);
    i = __clc_floor((float)f * z);

    n = (float)g * z - (float)h;
    o = (float)f * z - (float)i;

    j = c[(h + c[i & 255]) & 255] & 7;
    k = c[(h + 1 + c[i & 255]) & 255] & 7;
    l = c[(h + c[(i + 1) & 255]) & 255] & 7;
    m = c[(h + 1 + c[(i + 1) & 255]) & 255] & 7;

    p = C(b[j], n, o);
    q = C(b[k], n - 1.0f, o);
    r = C(b[l], n, o - 1.0f);
    s = C(b[m], n - 1.0f, o - 1.0f);

    n = E(n);
    o = E(o);

    t = D(p, q, n);
    u = D(r, s, n);

    v = D(t, u, o);

    aa += v * y;
    y *= w;
    z *= x;
  }

  int ac = (f * d) + g;

  a[ac] = aa;
}

__kernel void G(global Vertex* a, global float* b, private int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = (d * c) + e;

  a[f].Position.y = b[f];
}