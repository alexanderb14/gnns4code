typedef struct {
  global float* data;
  int3 size;
} volume;

volume A(global float* a, int3 b) {
  volume c;
  c.data = a;
  c.size = b;
  return c;
}

int B(volume a, int3 b) {
  return b.x + b.y * a.size.x + b.z * a.size.x * a.size.y;
}

int3 C(volume a, int b) {
return (int3)(a.size.x,
             (ba.size.x)) % a.size.y,
              ba.size.x * a.size.y) );
}

float D(volume a, int3 b) {
  return a.data[B(a, b)];
}

void E(volume a, int3 b, float c) {
  a.data[B(a, b)] = c;
}
float F(float a, float b, float c, float d, float e, float f, float g, float h, float3 i) {
  float j = mix(a, b, i.x);
  float k = mix(d, g, i.x);
  float l = mix(c, e, i.x);
  float m = mix(f, h, i.x);

  float n = mix(j, k, i.z);
  float o = mix(l, m, i.z);

  float p = mix(n, o, i.y);

  return p;
}
float G(float a, float b, float c, float d, float2 e) {
  float f = mix(a, b, e.x);
  float g = mix(c, d, e.x);

  return mix(f, g, e.y);
}

float H(volume a, float3 b) {
  int3 c = (int3)(b * (a.size.x - 1), b * (a.size.y - 1), b * (a.size.z - 1));
  return D(a, c);
}

float I(volume a, float3 b) {
  float3 c = (float3)(b * (a.size.x - 1), b * (a.size.y - 1), b * (a.size.z - 1));

  int3 d = (int3)(b * (a.size.x - 1), b * (a.size.y - 1), b * (a.size.z - 1));

  float3 e = (float3)(fmod(c 1.0f), fmod(c 1.0f), fmod(c 1.0f));

  int3 f = d;
  int3 g = f + (int3)(1, 0, 0);
  int3 h = f + (int3)(0, 1, 0);
  int3 i = f + (int3)(0, 0, 1);
  int3 j = f + (int3)(1, 1, 0);
  int3 k = f + (int3)(0, 1, 1);
  int3 l = f + (int3)(1, 0, 1);
  int3 m = f + (int3)(1, 1, 1);

  float n = D(a, f);
  float o = D(a, g);
  float p = D(a, h);
  float q = D(a, i);
  float r = D(a, j);
  float s = D(a, k);
  float t = D(a, l);
  float u = D(a, m);

  return F(n, o, p, q, r, s, t, u, e);
}

float J(volume a, float2 b, int c) {
  float2 d = (float2)(b * (a.size.x - 1), b * (a.size.y - 1));

  int3 e = (int3)(b * (a.size.x-1),
                     b * (a.size.y-1),
                     c  float2 f = (float2)(fmod(d 1.0f),
                           fmod(d 1.0f));

  int3 g = e;
  int3 h = g + (int3)(1,0,0);
  int3 i = g + (int3)(0,1,0);
  int3 j = g + (int3)(1,1,0);

  float k = D(a, g);
  float l = D(a, h);
  float m = D(a, i);
  float n = D(a, j);

  return G(k, l, m, n, f);
}