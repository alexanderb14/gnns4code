__constant int2 Ga = {0, -1};
__constant int2 Gb = {0, 1};
__constant int2 Gc = {-1, 0};
__constant int2 Gd = {1, 0};

__constant float2 Ge = {0, -1};
__constant float2 Gf = {0, 1};
__constant float2 Gg = {-1, 0};
__constant float2 Gh = {1, 0};

__constant sampler_t Gi = 0x0000 | 0x0002 | 0x0000;

__constant sampler_t Gj = 0x0000 | 0x0002 | 0x0010;

__constant sampler_t Gk = 0x0000 | 0x0004 | 0x0010;

__constant sampler_t Gl = 0x0000 | 0x0004 | 0x0000;

__constant sampler_t Gm = 0x0000 | 0x0000 | 0x0000;

int A(int2 a, int2 b) {
  return a.x * b.x + a.y * b.y;
}

short B(short2 a, short2 b) {
  return a.x * b.x + a.y * b.y;
}

bool C(int2 a, image2d_t b) {
  if (a.x >= get_image_width(b))
    return false;
  if (a.y >= get_image_height(b))
    return false;
  if (min(a.x, a.y) < 0)
    return false;
  return true;
}

bool D(float2 a, image2d_t b) {
  if (a.x >= get_image_width(b))
    return false;
  if (a.y >= get_image_height(b))
    return false;
  if (min(a.x, a.y) < 0)
    return false;
  return true;
}

float E(float a) {
  return a * a;
}

float4 F(image2d_t a, float2 b, float c) {
  float d = 2 * c * c;

  float4 e = 0;
  float f = .00001f;
  int2 g;

  int h = convert_int_rte(2.5f * c);

  if (c == 0) {
    return read_imagef(a, Gj, b + .5f);
  }

  for (g.x = -h; g.x <= h; g.x++)
    for (g.y = -h; g.y <= h; g.y++) {
      float i = 0;
      float2 j = b + convert_float2(g) / 2;

      float2 k = b - convert_float2(j);
      i = exp(-dot(k, k) / d);

      if (D(j, a)) {
        f += i;
        e += read_imagef(a, Gi, j) * i;
      }
    }
  e /= f;

  return e;
}

__kernel void G(__read_only image2d_t a, __global int* b) {
  int2 c = {get_global_id(0), get_global_id(1)};

  float4 d = read_imagef(a, Gl, c);
  int4 e = convert_int4(__clc_fabs(d) * 1000);

  if (C(c, a)) {
    atomic_max(&b[0], e.x);
    atomic_max(&b[1], e.y);
    atomic_max(&b[2], e.z);
    atomic_max(&b[3], e.w);
  }
}