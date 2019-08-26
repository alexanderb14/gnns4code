__kernel void A(__read_only image2d_t a, __global uchar* b, int c, int d) {
  sampler_t e = 0x0000 | 0x0002 | 0x0000;

  const int f = get_global_id(0);
  const int g = get_global_id(1);

  float h = read_imageui(a, e, (int2)(f2, g)).x / 16.0f;
  float i = read_imageui(a, e, (int2)(f1, g)).x / 4.0f;
  float j = (3 * read_imageui(a, e, (int2)(f g)).x) / 8.0f;
  float k = read_imageui(a, e, (int2)(f1, g)).x / 4.0f;
  float l = read_imageui(a, e, (int2)(f2, g)).x / 16.0f;

  int m = __clc_round(h + i + j + k + l);

  if (f < c && g < d) {
    b[g * c + f] = (uchar)m;
  }
}

__kernel void B(__read_only image2d_t a, __global uchar* b, int c, int d) {
  sampler_t e = 0x0000 | 0x0002 | 0x0000;

  const int f = get_global_id(0);
  const int g = get_global_id(1);

  float h = read_imageui(a, e, (int2)(2 * f 2 * g - 2)).x / 16.0f;
  float i = read_imageui(a, e, (int2)(2 * f 2 * g - 1)).x / 4.0f;
  float j = (3 * read_imageui(a, e, (int2)(2 * f 2 * g)).x) / 8.0f;
  float k = read_imageui(a, e, (int2)(2 * f 2 * g + 1)).x / 4.0f;
  float l = read_imageui(a, e, (int2)(2 * f 2 * g + 2)).x / 16.0f;

  int m = __clc_round(h + i + j + k + l);

  if (f < c - 2 && g < d - 2) {
    b[g * c + f] = (uchar)m;
  }
}

__kernel void C(__read_only image2d_t a, __global short* b, int c, int d, int e, int f, int g) {
  sampler_t h = 0x0000 | 0x0002 | 0x0000;
  const int i = get_global_id(0);
  const int j = get_global_id(1);

    float k = read_imagei( a, h, (int2)(i1, j).x * e;
    float l = read_imagei( a, h, (int2)(i j)).x * f;
    float m = read_imagei( a, h, (int2)(i1, j).x * g;

    int n = __clc_round( k + l + m );

    if( i < c && j < d ) {
    b[j * c + i] = (short)n;
    }
}

__kernel void D(__read_only image2d_t a, __global short* b, int c, int d, int e, int f, int g) {
  sampler_t h = 0x0000 | 0x0002 | 0x0000;
  const int i = get_global_id(0);
  const int j = get_global_id(1);

  if (i > 0 && j > 0 && i < c - 1 && j < d - 1) {
    float k = read_imagei(a, h, (float2)(i j1)).x * e;
    float l = read_imagei(a, h, (float2)(i j)).x * f;
    float m = read_imagei(a, h, (float2)(i j1)).x * g;

    int n = __clc_round(k + l + m);
    b[j * c + i] = (short)n;
  }
}
__kernel void E(__read_only image2d_t a, __read_only image2d_t b, __global int4* c, int d, int e) {
  sampler_t f = 0x0000 | 0x0002 | 0x0000;
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  int i = 0;
  int j = 0;
  int k = 0;
  for (int l = -4; l <= 4; l++) {
    for (int m = -4; m <= 4; m++) {
      int n = read_imagei(a, f, (int2)(m, l)).x;
      int o = read_imagei(b, f, (int2)(m, l)).x;

      i += n * n;
      k += o * o;
      j += n * o;
    }
  }
   int4 p = (int4)( ik;
   if( g < d && h < e ) {
    c[h * d + g] = p;
   }
}

__kernel void F(__read_only image2d_t a, __global float4* b, int c, int d) {
  sampler_t e = 0x0000 | 0x0002 | 0x0000;
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  if (f < c && g < d) {
        uint4 h = read_imageui( a, e, (float2)(f g);
        float4 i;
        i.x = h.x;
        i.y = h.y;
        i.z = h.z;
        i.w = h.w;
        b[g*c + f ] = i;
  }
}