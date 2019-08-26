__kernel void A(__global float* a, __global float* b, __global float4* c, __global float2* d, int e, int f, int g, int h, float i, int j) {
  int k = get_global_id(0);
  int l = get_global_id(1);
  float4 m = *c;
  float2 n = *d;

  if (!(k < g && l < h))
    return;

  int o = k, p = l;

  float q = dot(m.s23, (float2)(p, o)), r = dot(m.s01, (float2)(p, o));

  q += n.s1;
  r += n.s0;

  int s = ((int)q) + 1, t = (int)q, u = ((int)r) + 1, v = (int)r;

  float w = i;

  if (0.0f <= q && q < e && 0.0f <= r && r < f) {
    if (j == 1) {
      float x = a[v * e + t], y = a[v * e + s], z = a[u * e + t], aa = a[u * e + s];

      if (s >= e) {
        y = i;
        aa = i;
      }
      if (u >= f) {
        z = i;
        aa = i;
      }

      float ab = ((float)(s - q)) * x + ((float)(q - t)) * y,

            ac = ((float)(s - q)) * z + ((float)(q - t)) * aa;

      w = ((float)(u - r)) * ab + ((float)(r - v)) * ac;

    }

    else {
      w = a[((int)r) * e + ((int)q)];
    }
  }

  float ad = -0.5;
  float ae = -0.5;
  if (q >= e + ad) {
    w = i;
  }
  if (r >= f + ae) {
    w = i;
  }

  b[l * g + k] = w;
}

__kernel void B(__global unsigned char* a, __global unsigned char* b, __global float4* c, __global float2* d, int e, int f, int g, int h, float i, int j) {
  int k = get_global_id(0);
  int l = get_global_id(1);
  int m = get_global_id(2);
  float4 n = *c;
  float2 o = *d;

  if (!(l < g && m < h && k < 3))
    return;

  int p = l, q = m;

  float r = dot(n.s23, (float2)(q, p)), s = dot(n.s01, (float2)(q, p));

  r += o.s1;
  s += o.s0;

  int t = ((int)r) + 1, u = (int)r, v = ((int)s) + 1, w = (int)s;

  float x = i;

  if (0.0f <= r && r < e && 0.0f <= s && s < f) {
    if (j == 1) {
      float y = a[3 * (w * e + u) + k], z = a[3 * (w * e + t) + k], aa = a[3 * (v * e + u) + k], ab = a[3 * (v * e + t) + k];

      if (t >= e) {
        z = i;
        ab = i;
      }
      if (v >= f) {
        aa = i;
        ab = i;
      }

      float ac = ((float)(t - r)) * y + ((float)(r - u)) * z,

            ad = ((float)(t - r)) * aa + ((float)(r - u)) * ab;

      x = ((float)(v - s)) * ac + ((float)(s - w)) * ad;

    }

    else {
      x = a[3 * (((int)s) * e + ((int)r)) + k];
    }
  }

  float ae = -0.5;
  float af = -0.5;
  if (r >= e + ae) {
    x = i;
  }
  if (s >= f + af) {
    x = i;
  }

  b[3 * (m * g + l) + k] = x;
}