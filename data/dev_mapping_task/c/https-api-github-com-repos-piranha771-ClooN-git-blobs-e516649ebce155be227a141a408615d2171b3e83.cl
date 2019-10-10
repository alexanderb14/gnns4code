typedef struct {
  float x;
  float y;
  float z;
} Single3;

typedef struct {
  float startX;
  float offsetX;
  int lengthX;
  float startY;
  float offsetY;
  int lengthY;
  float startZ;
  float offsetZ;
  int lengthZ;
} ImplicitCube;

__constant float Ga[] = {
    1, 1, 0, -1, 1, 0, 1, -1, 0, -1, -1, 0, 1, 0, 1, -1, 0, 1, 1, 0, -1, -1, 0, -1, 0, 1, 1, 0, -1, 1, 0, 1, -1, 0, -1, -1, 1, 1, 0, 0, -1, 1, -1, 1, 0, 0, -1, -1,
};

float A(float a) {
  return a * a * a * (a * (a * 6 - 15) + 10);
}

float B(float a, float b, float c) {
  return b + a * (c - b);
}

float C(int a, float b, float c, float d) {
  int e = a & 15;
  float f = Ga[e * 3];
  float g = Ga[e * 3 + 1];
  float h = Ga[e * 3 + 2];
  return b * f + c * g + d * h;
}

float D(__global int* a, int b) {
  return a[b & 255];
}

float E(__global int* a, float b, float c, float d) {
  int e = (int)__clc_floor(b) & 255;
  int f = (int)__clc_floor(c) & 255;
  int g = (int)__clc_floor(d) & 255;

  b -= __clc_floor(b);
  c -= __clc_floor(c);
  d -= __clc_floor(d);

  float h = A(b);
  float i = A(c);
  float j = A(d);

  int k = D(a, e + 0) + f, l = D(a, k) + g, m = D(a, k + 1) + g, n = D(a, e + 1) + f, o = D(a, n) + g, p = D(a, n + 1) + g;

  return B(j, B(i, B(h, C(D(a, l), b, c, d), C(D(a, o), b - 1, c, d)), B(h, C(D(a, m), b, c - 1, d), C(D(a, p), b - 1, c - 1, d))), B(i, B(h, C(D(a, l + 1), b, c, d - 1), C(D(a, o + 1), b - 1, c, d - 1)), B(h, C(D(a, m + 1), b, c - 1, d - 1), C(D(a, p + 1), b - 1, c - 1, d - 1))));
}

float F(__global int* a, float b, float c, float d, int e) {
  int f = (int)__clc_floor(b) & 255;
  int g = (int)__clc_floor(c) & 255;
  int h = (int)__clc_floor(d) & 255;

  int i = D(a, D(a, f) + g) + h;
  return (int)D(a, i + e) % 256 / 255.0f;
}

float G(__global int* a, float4 b) {
  float4 c = __clc_floor(b);

  float d = 5;

  int e = 0;
  for (int f = (int)c.z - 1; f <= c.z + 1; f++) {
    for (int g = (int)c.y - 1; g <= c.y + 1; g++) {
      for (int h = (int)c.x - 1; h <= c.x + 1; h++) {
                float4 i = (float4)(
                 a  h +gF f, 0),
                 a  h +gF f, 1),
                 a  h +gF f, 2),
                    0);
                float4 j = i - b;
                float k = dot(j, j);

                if (k < d)
                  d = k;

                e++;
      }
    }
  }

  return clamp(d * 2 - 1, -1.0f, 1.0f);
}

float H(__global int* a, float4 b) {
  float4 c = __clc_floor(b);

  float d = 5;
  float e = 5;

  int f = 0;
  for (int g = (int)c.z - 1; g <= c.z + 1; g++) {
    for (int h = (int)c.y - 1; h <= c.y + 1; h++) {
      for (int i = (int)c.x - 1; i <= c.x + 1; i++) {
                float4 j = (float4)(
                 a  i +hF g, 0),
                 a  i +hF g, 1),
                 a  i +hF g, 2),
                    0);
                float4 k = j - b;
                float l = dot(k, k);

                if (l < d) {
                  float m = d;
                  d = l;
                  l = m;
                }

                if (l < e)
                  e = l;

                f++;
      }
    }
  }

  return clamp(e * 2 - 1, -1.0f, 1.0f);
}

float I(__global int* a, float4 b) {
  float4 c = __clc_floor(b);

  float d = 5;
  float e = 5;

  int f = 0;
  for (int g = (int)c.z - 1; g <= c.z + 1; g++) {
    for (int h = (int)c.y - 1; h <= c.y + 1; h++) {
      for (int i = (int)c.x - 1; i <= c.x + 1; i++) {
                float4 j = (float4)(
                 a  i +hF g, 0),
                 a  i +hF g, 1),
                 a  i +hF g, 2),
                    0);
                float4 k = j - b;
                float l = dot(k, k);

                if (l < d) {
                  float m = d;
                  d = l;
                  l = m;
                }

                if (l < e)
                  e = l;

                f++;
      }
    }
  }

  return clamp((e - d) * 2 - 1, -1.0f, 1.0f);
}

float J(__global int* a, float4 b) {
  float4 c = __clc_floor(b);

  float d = 5;
  float e = 5;
  float f = 5;

  int g = 0;
  for (int h = (int)c.z - 1; h <= c.z + 1; h++) {
    for (int i = (int)c.y - 1; i <= c.y + 1; i++) {
      for (int j = (int)c.x - 1; j <= c.x + 1; j++) {
                float4 k = (float4)(
                 a  j +iF h, 0),
                 a  j +iF h, 1),
                 a  j +iF h, 2),
                    0);
                float4 l = k - b;
                float m = dot(l, l);

                if (m < d) {
                  float n = d;
                  d = m;
                  m = n;
                }

                if (m < e) {
                  float n = e;
                  e = m;
                  m = n;
                }

                if (m < f)
                  f = m;

                g++;
      }
    }
  }

  return clamp(f * 2 - 1, -1.0f, 1.0f);
}

float K(__global int* a, float4 b) {
  float4 c = __clc_floor(b);

  float d = 5;
  float4 e = b;

  int f = 0;
  for (int g = (int)c.z - 1; g <= c.z + 1; g++) {
    for (int h = (int)c.y - 1; h <= c.y + 1; h++) {
      for (int i = (int)c.x - 1; i <= c.x + 1; i++) {
                float4 j = (float4)(
                 a  i +hF g, 0),
                 a  i +hF g, 1),
                 a  i +hF g, 2),
                    0);
                float4 k = j - b;
                float l = dot(k, k);

                if (l < d) {
                  e = j;
                  d = l;
                }

                f++;
      }
    }
  }

  return F(a, e.x, e.y, e.z, 0);
}

float L(Single3 a, int b, float c, float d, float e, __global int* f) {
  float g = 1.0f;
  float h = 0.0f;
  for (int i = 0; i < b; i++) {
    int j = D(f, i);
    int k = D(f, j);
    int l = D(f, k);

    a.x += j;
    a.y += k;
    a.z += l;

    h += E(f, a.x * c, a.y * c, a.z * c) * g;
    g *= e;
    c *= d;
  }
  return h;
}

float M(Single3 a, int b, float c, float d, float e, float f, __global int* g) {
  float h = 1.0f;
  float i = 0.0f;
  float j = 0.0f;
  float k = 1.0f;

  for (int l = 0; l < b; l++) {
    int m = D(g, l);
    int n = D(g, m);
    int o = D(g, n);

    a.x += m;
    a.y += n;
    a.z += o;

    float p = E(g, a.x * c, a.y * c, a.z * c);
    p = f - __clc_fabs(p);
    p *= p;

    j += p * h * k;
    k *= p;

    i += h;
    h *= e;

    c *= d;
  }
  return j / i * 2 - 1;
}

float N(Single3 a, int b, float c, float d, float e, __global int* f) {
  float g = 1.0f;
  float h = 0.0f;
  for (int i = 0; i < b; i++) {
    float j = E(f, a.x * c, a.y * c, a.z * c);
    j = __clc_fabs(j);
    j *= g;

    h += j;

    g *= e;

    c *= d;
  }

  return h;
}