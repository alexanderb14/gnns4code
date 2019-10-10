struct match_t {
  float u1p;
  float v1p;
  float u1c;
  float v1c;
};

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void A(const uint a, const uint b, __global const struct match_t* restrict c, const float d, __global const double* restrict e, __global uchar* restrict f) {
  __local float g[9];
  const size_t h = get_global_id(0) % (b);

  if (get_local_id(0) < 9) {
    const size_t i = get_global_id(0) / b;
    g[get_local_id(0)] = e[i * 9 + get_local_id(0)];
  }

  barrier(1);

  if (h < a) {
    float j = g[0];
    float k = g[1];
    float l = g[2];
    float m = g[3];
    float n = g[4];
    float o = g[5];
    float p = g[6];
    float q = g[7];
    float r = g[8];

    struct match_t s = c[h];
    float t = s.u1p;
    float u = s.v1p;
    float v = s.u1c;
    float w = s.v1c;

    float x = j * t + k * u + l;
    float y = m * t + n * u + o;
    float z = p * t + q * u + r;

    float aa = j * v + m * w + p;
    float ab = k * v + n * w + q;

    float ac = v * x + w * y + z;

    float ad = ac * ac / (x * x + y * y + aa * aa + ab * ab);

    f[get_global_id(0)] = __clc_fabs(ad) < d;
  }
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void B(__global const uchar* restrict a, __global ushort* restrict b, const uint c, const uint d, __local ushort* restrict e) {
  const size_t f = get_group_id(0);
  const unsigned g = f * d;

  ushort h = 0;
  for (unsigned i = get_local_id(0); i < c; i += get_local_size(0)) {
    h += a[g + i];
  }

  e[get_local_id(0)] = h;

  barrier(1);

  for (uint j = get_local_size(0) / 2; j > 0; j /= 2) {
    if (get_local_id(0) < j) {
      e[get_local_id(0)] += e[get_local_id(0) + j];
    }

    barrier(1);
  }

  if (get_local_id(0) == 0) {
    b[get_group_id(0)] = e[0];
  }
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void C(__global const uchar* restrict a, __global const ushort* restrict b, const uint c, const uint d, const uint e, __global uchar* restrict f, __global ushort* restrict g) {
  ushort h = g[get_group_id(0)];

  int i = -1;
  for (unsigned j = 0; j < c; j++) {
    const ushort k = b[j];
    if (k > h) {
      i = j;
      h = k;
    }
  }

  barrier(2);

  if (get_global_id(0) < d) {
    if (i != -1) {
      f[get_global_id(0)] = a[i * e + get_global_id(0)];
      if (get_local_id(0) == 0)
        g[get_group_id(0)] = h;
    }
  }
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void D(__global const float* restrict a, const uint b, const float c, const float d, __global float* restrict e) {
  const uint f = get_global_id(0);
  const float g = a[f];
  const bool h = g > c;
  float i = 0;
  for (uint j = 0; j < b; j++) {
    const float k = g - a[j];
    const float l = exp(-k * k * d);
    i += l;
  }
  e[f] = h ? i : 0;
}