typedef struct Vector {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
} Vector;

typedef struct Image {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
  int stride_y;
} Image;

typedef struct Tensor3D {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
  int stride_y;
  int stride_z;
} Tensor3D;

typedef struct Tensor4D {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
  int stride_y;
  int stride_z;
  int stride_w;
} Tensor4D;
Vector inline A(__global uchar* a, uint b, uint c, uint d) {
  Vector e = {.ptr = a.offset_first_element_in_bytc;
  e.ptr += e.offset_first_element_in_bytes + get_global_id(0) * d;
  return e;
}
Image inline B(__global uchar* a, uint b, uint c, uint d, uint e, uint f) {
  Image g = {.ptr = a.offset_first_element_in_bytc.stride_y = e g.ptr += g.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f;
  return g;
}
Image inline C(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h) {
  Image i = {.ptr = a.offset_first_element_in_bytc.stride_y = e i.ptr += i.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f + get_global_id(2) * h;
  return i;
}
Tensor3D inline D(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h) {
  Tensor3D i = {.ptr = a.offset_first_element_in_bytc.stride_y = e.stride_z = g i.ptr += i.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f + get_global_id(2) * h;
  return i;
}

Tensor4D inline E(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h, uint i, uint j, uint k) {
  Tensor4D l = {
    .ptr = a.offset_first_element_in_bytc.stride_y = e.stride_z = g.stride_w = i

                                                                                   l.ptr += l.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f + (get_global_id(2) % k) * h + (get_global_id(2) / k) * j;
  return l;
}

__global inline const uchar* F(const Vector* a, int b) {
  return a->ptr + b * a->stride_x;
}

__global inline uchar* G(const Image* a, int b, int c) {
  return a->ptr + b * a->stride_x + c * a->stride_y;
}
__global inline const uchar* H(const Tensor3D* a, int b, int c, int d) {
  return a->ptr + b * a->stride_x + c * a->stride_y + d * a->stride_z;
}
__global inline const uchar* I(const Tensor4D* a, int b, int c, int d, int e) {
  return a->ptr + b * a->stride_x + c * a->stride_y + d * a->stride_z + e * a->stride_w;
}
typedef struct Coordinates2D {
  int x;
  int y;
} Coordinates2D;

typedef struct Keypoint {
  int x;
  int y;
  float strength;
  float scale;
  float orientation;
  int tracking_status;
  float error;
} Keypoint;

typedef struct DetectionWindow {
  ushort x;
  ushort y;
  ushort width;
  ushort height;
  ushort idx_class;
  float score;
} DetectionWindow;
constant int Ga[16][2] = {
    {0, -3}, {1, -3}, {2, -2}, {3, -1}, {3, 0}, {3, 1}, {2, 2}, {1, 3}, {0, 3}, {-1, 3}, {-2, 2}, {-3, 1}, {-3, 0}, {-3, -1}, {-2, -2}, {-1, -3},
};
uchar J(uchar a, __global unsigned char* b, unsigned int c, unsigned char d) {
  short e = d;
  short f = 255;
  while (f - e > 1) {
    uchar g = convert_uchar_sat((e + f) / 2);
    unsigned int h = 0;
    unsigned int i = 0;

    unsigned char j = add_sat(a, g);
    unsigned char k = sub_sat(a, g);

    bool l = 0;

    for (uint m = 0; m < 16; m++) {
      {
        unsigned char n;
        n = *(b + (int)c * Ga[m][1] + Ga[m][0]);
        i |= (n < k) << m;
        h |= (n > j) << m;
      }
    }

    h |= (h << 16);
    i |= (i << 16);
    {
      for (int m = 0; m < 16; m++) {
        l |= ((h & 0x1FF) == 0x1FF);
        l |= ((i & 0x1FF) == 0x1FF);
        if (l) {
          break;
        }
        h >>= 1;
        i >>= 1;
      }
    };

    if (l) {
      e = convert_short(g);
    } else {
      f = convert_short(g);
    }
  }
  return e;
}
__kernel void K(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, float m) {
  Image n = B(a, f, b, c, d, e);
  Image o = B(g, l, h, i, j, k);

  const unsigned char p = (uchar)m;

  unsigned int q = 0;
  unsigned int r = 0;

  unsigned char s = 0;

  unsigned char t = *n.ptr;
  unsigned char u = add_sat(t, p);
  unsigned char v = sub_sat(t, p);

  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[0][1] + Ga[0][0]);
    r |= (w < v) << 0;
    q |= (w > u) << 0;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[4][1] + Ga[4][0]);
    r |= (w < v) << 4;
    q |= (w > u) << 4;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[8][1] + Ga[8][0]);
    r |= (w < v) << 8;
    q |= (w > u) << 8;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[12][1] + Ga[12][0]);
    r |= (w < v) << 12;
    q |= (w > u) << 12;
  }

  if (((q | r) & 0x1111) == 0) {
    *o.ptr = 0;
    return;
  }

  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[1][1] + Ga[1][0]);
    r |= (w < v) << 1;
    q |= (w > u) << 1;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[2][1] + Ga[2][0]);
    r |= (w < v) << 2;
    q |= (w > u) << 2;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[3][1] + Ga[3][0]);
    r |= (w < v) << 3;
    q |= (w > u) << 3;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[5][1] + Ga[5][0]);
    r |= (w < v) << 5;
    q |= (w > u) << 5;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[6][1] + Ga[6][0]);
    r |= (w < v) << 6;
    q |= (w > u) << 6;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[7][1] + Ga[7][0]);
    r |= (w < v) << 7;
    q |= (w > u) << 7;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[9][1] + Ga[9][0]);
    r |= (w < v) << 9;
    q |= (w > u) << 9;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[10][1] + Ga[10][0]);
    r |= (w < v) << 10;
    q |= (w > u) << 10;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[11][1] + Ga[11][0]);
    r |= (w < v) << 11;
    q |= (w > u) << 11;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[13][1] + Ga[13][0]);
    r |= (w < v) << 13;
    q |= (w > u) << 13;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[14][1] + Ga[14][0]);
    r |= (w < v) << 14;
    q |= (w > u) << 14;
  }
  {
    unsigned char w;
    w = *(n.ptr + (int)d * Ga[15][1] + Ga[15][0]);
    r |= (w < v) << 15;
    q |= (w > u) << 15;
  }

  q |= (q << 16);
  r |= (r << 16);

  {
    for (int x = 0; x < 16; x++) {
      s |= ((q & 0x1FF) == 0x1FF);
      s |= ((r & 0x1FF) == 0x1FF);
      if (s) {
        break;
      }
      q >>= 1;
      r >>= 1;
    }
  }

  if (!s) {
    *o.ptr = 0;
    return;
  }

  *o.ptr = 1;
}
__kernel void L(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h, __global uint* i, __global Keypoint* j) {
  if (*i >= g) {
    return;
  }

  Image k = B(a, f, b, c, d, e);

  uchar l = *k.ptr;

  if (l > 0) {
    int m = atomic_add(i, 1);
    if (m < g) {
      j[m].strength = l;
      j[m].x = get_global_id(0) + h;
      j[m].y = get_global_id(1) + h;
      j[m].tracking_status = 1;
      j[m].scale = 0.f;
      j[m].orientation = 0.f;
      j[m].error = 0.f;
    }
  }
}