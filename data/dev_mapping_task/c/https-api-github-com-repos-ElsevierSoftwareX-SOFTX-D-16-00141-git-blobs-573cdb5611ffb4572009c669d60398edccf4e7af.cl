__kernel void A(__global float* a, unsigned int b, const __global float* c, float d) {
  unsigned int e = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if (e < b) {
    float f = c[e] * (d * 0.25f / 3.14159265f);
    float g = 1.f - 2.f * ((f) * (f));
    float h = 0.5f * (1.f + ((g) * (g)));
    a[get_group_id(1) * b + e] *= h;
  }
}
__kernel void B(__global float* a, unsigned int b) {
  unsigned int c = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if (c < b)
    a[c] = 0;
}
__kernel void C(__global float* a, unsigned int b, const __global float* c, unsigned int d) {
  unsigned int e = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if (e < b) {
    float f = c[e];
    a[e] += ((f) * (f)) * d;
  }
}
__kernel void D(__global float* a, unsigned int b, float c) {
  unsigned int d = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if (d < b)
    a[d] += c;
}
__kernel void E(__global float* a, unsigned int b, unsigned int c) {
  unsigned int d = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if (d < b) {
    float e = 0;
    for (unsigned int f = 1; f < c; f++)
      e += a[f * b + d];
    a[d] += e;
  }
}
__kernel void F(__global float* a, const __global float* b, const __global float* c, const __global float* d, unsigned int e, const __global float4* f, unsigned int g, unsigned int h, unsigned int i, unsigned int j, unsigned int k) {
  if ((k) && (get_group_id(0) < get_group_id(1)))
    return;
  unsigned int l = get_local_id(0), m = get_local_id(1);
  unsigned int n = get_group_id(0) * 16 + l;
  unsigned int o = get_group_id(1) * 16 + l;
  unsigned int p = get_group_id(1) * 16 + m;
  __local float q[16], r[16], s[16], t[16], u[16], v[16];
  __local float w[16][16];
  w[m][l] = 0;
  if ((m == 0) && (n + h < j)) {
    float4 x = f[h + n];
    t[l] = x.x, u[l] = x.y, v[l] = x.z;
  }
  if ((m == 4) && (o + g < i)) {
    float4 x = f[g + o];
    q[l] = x.x, r[l] = x.y, s[l] = x.z;
  }
  barrier(1);
  if (!k) {
    if ((n + h < j) && (p + g < i))
      w[m][l] = sqrt(((q[m] - t[l]) * (q[m] - t[l])) + ((r[m] - u[l]) * (r[m] - u[l])) + ((s[m] - v[l]) * (s[m] - v[l])));
  } else {
    if ((n + h < j) && (p + g < i) && (n > p))
      w[m][l] = sqrt(((q[m] - t[l]) * (q[m] - t[l])) + ((r[m] - u[l]) * (r[m] - u[l])) + ((s[m] - v[l]) * (s[m] - v[l])));
  }
  barrier(1);
  i = (((16) < (i - g - get_group_id(1) * 16)) ? (16) : (i - g - get_group_id(1) * 16));
  j = (((16) < (j - h - get_group_id(0) * 16)) ? (16) : (j - h - get_group_id(0) * 16));
  for (unsigned int y = 0; y < e; y += ((16) * (16))) {
    unsigned int z = y + m * 16 + l;
    if (z < e) {
      float aa = 0, ab;
      float ac = d[z];
      if ((k) && (get_group_id(0) == get_group_id(1))) {
        for (p = 0; p < i; p++) {
          for (n = p + 1; n < j; n++) {
            ab = ac * w[p][n];
            aa += sin(ab) / (ab + 0.000001f);
          }
        }
      } else {
        for (p = 0; p < i; p++) {
          for (n = 0; n < j; n += 8) {
            ab = ac * w[p][n];
            aa += sin(ab) / (ab + 0.000001f);
            ab = ac * w[p][n + 1];
            aa += sin(ab) / (ab + 0.000001f);
            ab = ac * w[p][n + 2];
            aa += sin(ab) / (ab + 0.000001f);
            ab = ac * w[p][n + 3];
            aa += sin(ab) / (ab + 0.000001f);
            ab = ac * w[p][n + 4];
            aa += sin(ab) / (ab + 0.000001f);
            ab = ac * w[p][n + 5];
            aa += sin(ab) / (ab + 0.000001f);
            ab = ac * w[p][n + 6];
            aa += sin(ab) / (ab + 0.000001f);
            ab = ac * w[p][n + 7];
            aa += sin(ab) / (ab + 0.000001f);
          }
        }
      }
      a[e * (get_num_groups(0) * get_group_id(1) + get_group_id(0)) + z] += 2.f * aa * b[z] * c[z];
    }
  }
}
__kernel void G(__global float* a, float b, const __global float* c, unsigned int d, const __global float4* e, unsigned int f, unsigned int g, unsigned int h, unsigned int i, unsigned int j) {
  if ((j) && (get_group_id(0) < get_group_id(1)))
    return;
  unsigned int k = get_local_id(0), l = get_local_id(1);
  unsigned int m = get_group_id(0) * 16 + k;
  unsigned int n = get_group_id(1) * 16 + k;
  unsigned int o = get_group_id(1) * 16 + l;
  __local float p[16], q[16], r[16], s[16], t[16], u[16];
  __local float v[16][16];
  v[l][k] = 0;
  if ((l == 0) && (m + g < i)) {
    float4 w = e[g + m];
    s[k] = w.x, t[k] = w.y, u[k] = w.z;
  }
  if ((l == 4) && (n + f < h)) {
    float4 w = e[f + n];
    p[k] = w.x, q[k] = w.y, r[k] = w.z;
  }
  barrier(1);
  if (!j) {
    if ((m + g < i) && (o + f < h))
      v[l][k] = sqrt(((p[l] - s[k]) * (p[l] - s[k])) + ((q[l] - t[k]) * (q[l] - t[k])) + ((r[l] - u[k]) * (r[l] - u[k])));
  } else {
    if ((m + g < i) && (o + f < h) && (m > o))
      v[l][k] = sqrt(((p[l] - s[k]) * (p[l] - s[k])) + ((q[l] - t[k]) * (q[l] - t[k])) + ((r[l] - u[k]) * (r[l] - u[k])));
  }
  barrier(1);
  h = (((16) < (h - f - get_group_id(1) * 16)) ? (16) : (h - f - get_group_id(1) * 16));
  i = (((16) < (i - g - get_group_id(0) * 16)) ? (16) : (i - g - get_group_id(0) * 16));
  for (unsigned int x = 0; x < d; x += ((16) * (16))) {
    unsigned int y = x + l * 16 + k;
    if (y < d) {
      float z = 0, aa;
      float ab = c[y];
      if ((j) && (get_group_id(0) == get_group_id(1))) {
        for (o = 0; o < h; o++) {
          for (m = o + 1; m < i; m++) {
            aa = ab * v[o][m];
            z += sin(aa) / (aa + 0.000001f);
          }
        }
      } else {
        for (o = 0; o < h; o++) {
          for (m = 0; m < i; m += 8) {
            aa = ab * v[o][m];
            z += sin(aa) / (aa + 0.000001f);
            aa = ab * v[o][m + 1];
            z += sin(aa) / (aa + 0.000001f);
            aa = ab * v[o][m + 2];
            z += sin(aa) / (aa + 0.000001f);
            aa = ab * v[o][m + 3];
            z += sin(aa) / (aa + 0.000001f);
            aa = ab * v[o][m + 4];
            z += sin(aa) / (aa + 0.000001f);
            aa = ab * v[o][m + 5];
            z += sin(aa) / (aa + 0.000001f);
            aa = ab * v[o][m + 6];
            z += sin(aa) / (aa + 0.000001f);
            aa = ab * v[o][m + 7];
            z += sin(aa) / (aa + 0.000001f);
          }
        }
      }
      a[d * (get_num_groups(0) * get_group_id(1) + get_group_id(0)) + y] += 2.f * z * b;
    }
  }
}
__kernel void H(__global float* a, __global float* b, unsigned int c, unsigned int d, unsigned int e) {
  unsigned int f = get_local_size(0) * get_group_id(0) + get_local_id(0);
  if (f < d) {
    float g = 0;
    for (unsigned int h = 0; h < e; h++)
      g += a[h * d + f];
    b[(c + 1) * d + f] = g;
    b[f] = 0;
  }
}