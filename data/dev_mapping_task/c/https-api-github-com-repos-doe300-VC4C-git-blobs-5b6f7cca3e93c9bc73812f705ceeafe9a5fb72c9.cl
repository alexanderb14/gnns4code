float A(uchar3 a) {
  return (float)a.y * 1.96321f + (float)a.x;
}

__kernel void B(__global uchar4* a, __global uchar4* b, __global int* c, __global int* d) {
  int e = get_global_id(0);
  int f = e % *c;
  int g = e / *c;

  bool h = true;
  bool i = true;
  bool j = true;
  bool k = true;

  uchar3 l = a[e].xyz;

  float m = A(l);

  uchar3 n = l;
  uchar3 o = l;
  uchar3 p = l;
  uchar3 q = l;
  float r = m;
  float s = m;
  float t = m;
  float u = m;

  if (f > 0) {
    n = a[e - 1].xyz;
    r = A(p);
  } else {
    b[e] = a[e];
    return;
  }
  if (f < *c - 1) {
    o = a[e + 1].xyz;
    s = A(o);
  } else {
    b[e] = a[e];
    return;
  }
  if (g > 0) {
    p = a[e - *c].xyz;
    t = A(p);
  } else {
    b[e] = a[e];
    return;
  }
  if (g < *d - 1) {
    q = a[e + *c].xyz;
    u = A(q);
  } else {
    b[e] = a[e];
    return;
  }

  float v = min(m, min(min(t, r), min(u, s)));
  float w = max(m, max(max(t, r), max(u, s)));
  float x = w - v;
  if (x < max((float)1 / 16, w * 1 / 8)) {
    b[e] = a[e];
    return;
  }

  float y = (t + r + s + u) * 0.25;
  int z = __clc_fabs(y - m);
  float aa = max(0.0f, (z / x) - 1 / 4) * 0;
  aa = min((float)3 / 4, aa);

  float3 ab = convert_float3(l);
  ab += convert_float3(p);
  ab += convert_float3(n);
  ab += convert_float3(o);
  ab += convert_float3(q);

  uchar3 ac = l;
  uchar3 ad = l;
  uchar3 ae = l;
  uchar3 af = l;
  float ag = m;
  float ah = m;
  float ai = m;
  float aj = m;

  ac = a[e - *c - 1].xyz;
  ag = A(ac);

  ad = a[e - *c + 1].xyz;
  ah = A(ad);

  ae = a[e + *c - 1].xyz;
  ai = A(ae);

  af = a[e + *c + 1].xyz;
  aj = A(af);

  ab += convert_float3(ac);
  ab += convert_float3(ad);
  ab += convert_float3(ae);
  ab += convert_float3(af);
  ab = ab * (float3)(0.1111f, 0.1111f, 0.1111f);

  b[e].x = (uchar)ab.x;
  b[e].y = (uchar)ab.y;
  b[e].z = (uchar)ab.z;
  b[e].w = 255;
}