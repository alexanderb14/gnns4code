bool A(float3 a, float3 b, float3 c, float3 d, float3 e, float* f) {
  float3 g = cross(b, e);
  float h = dot(d, g);
  if (h > -0.00001f && h < 0.00001f) {
    return false;
  }
  float i = 1.f / h;

  float3 j = a - c;

  float k = i * dot(j, g);
  if (k < 0.f || k > 1.f) {
    return false;
  }

  float3 l = cross(j, d);
  float m = i * dot(b, l);

  if (m < 0.f || k + m > 1.f) {
    return false;
  }

  *f = i * dot(e, l);

  if (*f > 0.00001f) {
    return true;
  } else {
    return false;
  }
}

bool B(float3 a, float3 b, float3 c, float3 d, float3 e, float* f) {
  float3 g = d - c;
  float3 h = e - c;
  return A(a, b, c, g, h, f);
}
bool C(

    __global float const* __restrict a, __global int const* __restrict b

    ,
    int c, float3 d, float3 e, float* __restrict f, float* __restrict g) {
  float h = 0x1.fffffep127f;
  float i = 0.f;
  int3 j = 3 * (int3)(b float3 j);
    float3 j);
    float3 j);
    float n;
    bool o = B(d, e, k, l, m, &n);
    if (o) {
      h = fmin(n, h);
      i = fmax(n, i);
    }
    for (int p = 3; p < c; ++p) {
      int q = 3 * b[p];

      qo = B(d, e, k, l, m, &n);
      if (o) {
        h = fmin(n, h);
        i = fmax(n, i);
      }
    }

    if (i != 0.f) {
      if (h == i) {
        h = 0.f;
      }
      *f = fmax(*f, h);
      *g = fmin(*g, i);

      return (*f < *g);
    } else {
      return false;
    }
}