float4 A(float4 a) {
  float4 b;

  b.x = (a.x > a.y) ? a.y : a.x;
  b.y = (a.y > a.x) ? a.y : a.x;
  b.z = (a.z > a.w) ? a.w : a.z;
  b.w = (a.w > a.z) ? a.w : a.z;

  a.x = (b.x > b.z) ? b.z : b.x;
  a.y = (b.y > b.w) ? b.w : b.y;
  a.z = (b.z > b.x) ? b.z : b.x;
  a.w = (b.w > b.y) ? b.w : b.y;

  b.x = a.x;
  b.y = (a.y > a.z) ? a.z : a.y;
  b.z = (a.z > a.y) ? a.z : a.y;
  b.w = a.w;
  return b;
}

float4 B(float4 a, float4 b) {
  a.x = (a.x < b.w) ? a.x : b.w;
  a.y = (a.y < b.z) ? a.y : b.z;
  a.z = (a.z < b.y) ? a.z : b.y;
  a.w = (a.w < b.x) ? a.w : b.x;
  return a;
}

float4 C(float4 a, float4 b) {
  b.x = (a.w >= b.x) ? a.w : b.x;
  b.y = (a.z >= b.y) ? a.z : b.y;
  b.z = (a.y >= b.z) ? a.y : b.z;
  b.w = (a.x >= b.w) ? a.x : b.w;
  return b;
}

__kernel void D(__global float4* a, __global float4* b, const int c) {
  int d = get_group_id(0);

  if (d * get_local_size(0) + get_local_id(0) < c / 4) {
    float4 e = a[d * get_local_size(0) + get_local_id(0)];
    b[d * get_local_size(0) + get_local_id(0)] = A(e);
  }
}
__kernel void E(__global float4* a, __global float4* b, const int c, int d, __global int* e) {
  int f = get_global_id(0);

  int g = f / d;
  if (g >= (1024))
    return;

  int h = f - g * d;
  int i = e[g] + h * c;

  int j = i + c / 2;
  global float4* k;
  k = &(b[i]);

  if (i >= e[g + 1])
    return;
  if (j >= e[g + 1]) {
    for (int l = 0; l < (e[g + 1] - i); l++) {
      k[l] = a[i + l];
    }
    return;
  }

  int m = 0;
  int n = 0;
  int o = 0;
  float4 p, q;
  p = a[i + m];
  q = a[j + n];

  while (true)

  {
    float4 r = a[i + m + 1];
    float4 s = a[j + n + 1];

    float4 t = B(p, q);
    float4 u = C(p, q);
    p = A(t);
    q = A(u);

    k[o++] = p;

    bool v;
    bool w;

    v = (m + 1 < c / 2);
    w = (n + 1 < c / 2) && (j + n + 1 < e[g + 1]);

    if (v) {
      if (w) {
        if (r.x < s.x) {
          m += 1;
          p = r;
        } else {
          n += 1;
          p = s;
        }
      } else {
        m += 1;
        p = r;
      }
    } else {
      if (w) {
        n += 1;
        p = s;
      } else {
        break;
      }
    }
  }
  k[o++] = q;
}

__kernel void F(__global float* a, __global float* b, __constant int* c, __constant int* d, __constant int* e) {
  int f = get_global_id(0);
  int g = get_group_id(1);

  if ((e[g] + f) >= e[g + 1])
    return;
  b[e[g] + f] = a[c[g] * 4 + d[g] + f];
}