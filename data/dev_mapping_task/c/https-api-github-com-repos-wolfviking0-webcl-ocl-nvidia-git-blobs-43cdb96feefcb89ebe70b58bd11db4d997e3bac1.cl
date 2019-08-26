float4 A(const unsigned int a) {
  float4 b;
  b.x = a & 0xff;
  b.y = (a >> 8) & 0xff;
  b.z = (a >> 16) & 0xff;
  b.w = (a >> 24) & 0xff;
  return b;
}

unsigned int B(const float4 a) {
  unsigned int b = 0U;
  b |= 0x000000FF & (unsigned int)a.x;
  b |= 0x0000FF00 & (((unsigned int)a.y) << 8);
  b |= 0x00FF0000 & (((unsigned int)a.z) << 16);
  b |= 0xFF000000 & (((unsigned int)a.w) << 24);
  return b;
}

__kernel void C(__global const unsigned int* a, __global unsigned int* b, int c, int d, __local unsigned int* e) {
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_id(1);

  if ((f < c) && (g < d)) {
    e[get_local_id(1) * (get_local_size(0) + 1) + get_local_id(0)] = a[(g * c) + f];
  }

  barrier(1);

  f = get_group_id(1) * get_local_size(1) + get_local_id(0);
  g = get_group_id(0) * get_local_size(0) + get_local_id(1);
  if ((f < d) && (g < c)) {
    b[(g * d) + f] = e[get_local_id(0) * (get_local_size(1) + 1) + get_local_id(1)];
  }
}
__kernel void D(__global const unsigned int* a, __global unsigned int* b, int c, int d, float e) {
  unsigned int f = get_group_id(0) * get_local_size(0) + get_local_id(0);
  if (f >= c)
    return;

  a += f;
  b += f;

  float4 g = A(*a);
  for (int h = 0; h < d; h++) {
    float4 i = A(*a);
    float4 j = i + (g - i) * (float4)e;
    *b = B(j);
    g = j;
    a += c;
    b += c;
  }

  a -= c;
  b -= c;

  g = A(*a);
  for (int h = d - 1; h > -1; h--) {
    float4 i = A(*a);
    float4 j = i + (g - i) * (float4)e;
    *b = B((A(*b) + j) * 0.5f);
    g = j;
    a -= c;
    b -= c;
  }
}
__kernel void E(__global const unsigned int* a, __global unsigned int* b, int c, int d, float e, float f, float g, float h, float i, float j, float k, float l) {
  unsigned int m = get_group_id(0) * get_local_size(0) + get_local_id(0);
  if (m >= c)
    return;

  a += m;
  b += m;

  float4 n = (float4)0.0f;
  float4 o = (float4)0.0f;
  float4 p = (float4)0.0f;

  for (int q = 0; q < d; q++) {
    float4 r = A(*a);
    float4 s = (r * e) + (n * f) - (o * i) - (p * j);
    *b = B(s);
    n = r;
    p = o;
    o = s;
    a += c;
    b += c;
  }

  a -= c;
  b -= c;

  float4 t = (float4)0.0f;
  float4 u = (float4)0.0f;
  float4 v = (float4)0.0f;
  float4 w = (float4)0.0f;
  for (int q = d - 1; q > -1; q--) {
    float4 r = A(*a);
    float4 s = (t * g) + (u * h) - (v * i) - (w * j);
    u = t;
    t = r;
    w = v;
    v = s;
    *b = B(A(*b) + s);
    a -= c;
    b -= c;
  }
}