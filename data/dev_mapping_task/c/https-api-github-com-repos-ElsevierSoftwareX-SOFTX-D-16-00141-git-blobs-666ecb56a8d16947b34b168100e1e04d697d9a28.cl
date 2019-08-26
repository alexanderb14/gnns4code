__kernel void A(__global float* a, unsigned int b, unsigned int c) {
  unsigned int d = get_local_size(1) * get_group_id(1) + get_local_id(1), e = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if ((d < b) && (e < c))
    a[d * c + e] = 0;
}
__kernel void B(__global float* a, __global float* b, unsigned int c, unsigned int d) {
  unsigned int e = get_local_size(1) * get_group_id(1) + get_local_id(1), f = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if ((e < c) && (f < d)) {
    a[e * d + f] = 0;
    b[e * d + f] = 0;
  }
}
__kernel void C(__global float* a, const __global float* b, const __global float* c, unsigned int d, unsigned int e) {
  unsigned int f = get_local_size(1) * get_group_id(1) + get_local_id(1), g = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if ((f < d) && (g < e))
    a[f * e + g] += ((b[f * e + g]) * (b[f * e + g])) + ((c[f * e + g]) * (c[f * e + g]));
}
__kernel void D(__global float* a, unsigned int b, unsigned int c, float d) {
  unsigned int e = get_local_size(1) * get_group_id(1) + get_local_id(1), f = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if ((e < b) && (f < c))
    a[e * c + f] *= d;
}
__kernel void E(__global float* a, unsigned int b, unsigned int c, const __global float* d, float e) {
  unsigned int f = get_local_size(1) * get_group_id(1) + get_local_id(1), g = get_local_size(0) * get_group_id(0) + get_local_id(0);
  unsigned int h = get_local_size(1) * get_group_id(1) + get_local_id(0);
  __local float i[16];
  if ((get_local_id(1) == 0) && (h < b)) {
    float j = d[h] * (e * 0.25f / 3.14159265f);
    float k = 1.f - 2.f * ((j) * (j));
    i[get_local_id(0)] = 0.5f * (1.f + ((k) * (k)));
  }
  barrier(1);
  if ((f < b) && (g < c))
    a[f * c + g] *= i[get_local_id(1)];
}
__kernel void F(__global float* a, __global float* b, const __global float* c, unsigned int d, unsigned int e, const __global float4* f, float g, const __global float4* h, unsigned int i, unsigned int j, const __global float* k) {
  unsigned int l = get_local_size(1) * get_group_id(1) + get_local_id(1), m = get_local_size(0) * get_group_id(0) + get_local_id(0);
  unsigned int n = get_local_size(1) * get_group_id(1) + get_local_id(0);
  __local float o[16];
  __local float p[16];
  __local float4 q[128];
  unsigned int r = j / 128 + ((j % 128) ? 1 : 0);
  float4 s;
  float t = 0, u = 0, v = 0, w = 0, x = 0, y = 0;
  if ((get_local_id(1) == 0) && (n < d))
    o[get_local_id(0)] = k[n];
  if ((get_local_id(1) == 4) && (n < d))
    p[get_local_id(0)] = c[n];
  barrier(1);
  if ((l < d) && (m < e)) {
    float z = m * 2.f * 3.14159265f / e;
    w = sin(z);
    v = cos(z);
    x = 0.25f * g * p[get_local_id(1)] / 3.14159265f;
    y = 1.f - ((x) * (x));
    sp[get_local_id(1)];

  s = (float4)(dot(s f0]),dot(s f1]),dot(s f2]),0);
  }
  for (unsigned int aa = 0; aa < r; aa++) {
    unsigned int ab = (((j - aa * 128) < (128)) ? (j - aa * 128) : (128));
    if (get_local_id(1) < 128 / 16) {
      unsigned int ac = get_local_id(1) * 16 + get_local_id(0);
      if (ac < ab)
        q[ac] = h[i + aa * 128 + ac];
    }
    barrier(1);
    if ((l < d) && (m < e)) {
      for (unsigned int ac = 0; ac < ab; ac++) {
        float z = dot(s, q[ac]);
        w = sin(z);
        v = cos(z);
        t += v;
        u += w;
      }
    }
    barrier(1);
  }
  if ((l < d) && (m < e)) {
    a[l * e + m] += o[get_local_id(1)] * t;
    b[l * e + m] += o[get_local_id(1)] * u;
  }
}
__kernel void G(__global float* a, __global float* b, const __global float* c, unsigned int d, unsigned int e, const __global float4* f, float g, const __global float4* h, unsigned int i, unsigned int j, float k) {
  unsigned int l = get_local_size(1) * get_group_id(1) + get_local_id(1), m = get_local_size(0) * get_group_id(0) + get_local_id(0);
  unsigned int n = get_local_size(1) * get_group_id(1) + get_local_id(0);
  __local float o[16];
  __local float4 p[128];
  unsigned int q = j / 128 + ((j % 128) ? 1 : 0);
  float4 r;
  float s = 0, t = 0, u = 0, v = 0, w = 0, x = 0;
  if ((get_local_id(1) == 4) && (n < d))
    o[get_local_id(0)] = c[n];
  barrier(1);
  if ((l < d) && (m < e)) {
    float y = m * 2.f * 3.14159265f / e;
    v = sin(y);
    u = cos(y);
    w = 0.25f * g * o[get_local_id(1)] / 3.14159265f;
    x = 1.f - ((w) * (w));
  owget_local_id(1)];
  r = (float4)(dot(r f0]), dot(r f1]), dot(r f2]),0);
  }
  for (unsigned int z = 0; z < q; z++) {
    unsigned int aa = (((j - z * 128) < (128)) ? (j - z * 128) : (128));
    if (get_local_id(1) < 128 / 16) {
      unsigned int ab = get_local_id(1) * 16 + get_local_id(0);
      if (ab < aa)
        p[ab] = h[i + z * 128 + ab];
    }
    barrier(1);
    if ((l < d) && (m < e)) {
      for (unsigned int ab = 0; ab < aa; ab++) {
        float y = dot(r, p[ab]);
        v = sin(y);
        u = cos(y);
        s += u;
        t += v;
      }
    }
    barrier(1);
  }
  if ((l < d) && (m < e)) {
    a[l * e + m] += k * s;
    b[l * e + m] += k * t;
  }
}