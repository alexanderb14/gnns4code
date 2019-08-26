float4 A(float4 a) {
  a = clamp(a, 0.0f, 1.0f);

  float b = fmin(fmin(a.x, a.y), a.z);
  float c = fmax(fmax(a.x, a.y), a.z);
  float d, e;

  float f = c - b;

  if (c < 0.001f || f < 0.001f) {
    return (float4)(0.0f, 0.0f, a);
  } else {
    e = ((f) / (c));
    if (__clc_fabs(a.x - c) < 0.0001f)
      d = (((a.y - a.z)) / (f));
    else if (__clc_fabs(a.y - c) < 0.0001f)
      d = 2.0f + (((a.z - a.x)) / (f));
    else
      d = 4.0f + (((a.x - a.y)) / (f));
    d /= 6.0f;

    if (d < 0.0)
      d += 1.0f;

    return (float4)(d, e, a);
  }
}

float4 B(float4 a) {
  if (a.y == 0.0f && a.x == 0.0f) {
    return (float4)(a, a, a, a);
  } else {
    float4 b = (float4)(0.0f, 0.0f, 0.0f, a);
    a.x = 6.0f * (a.x - __clc_floor(a.x));
    float c = a.x - __clc_floor(a.x);
    int d = __clc_floor(a.x);
    float4 e = (float4)(1.0f, 1.0f - a, 1.0f - a * c, 1.0f - a * (1.0f - c));
    if (d == 0)
      b = (float4)(e e e 0.0f);
    else if (d == 1)
      b = (float4)(e e e 0.0f);
    else if (d == 2)
      b = (float4)(e e e 0.0f);
    else if (d == 3)
      b = (float4)(e e e 0.0f);
    else if (d == 4)
      b = (float4)(e e e 0.0f);
    else
      b = (float4)(e e e 0.0f);
    b = a.z * b;
    b.w = a.w;
    return b;
  }
}

float4 C(float4 a) {
  float b = a.x;
  float c = a.y;
  float d = a.z;

  if (c == 0.0f)
    return (float4)((d + 1.0f) / 2.0f, (d + 1.0f) / 2.0f, (d + 1.0f) / 2.0f, a);

  float e = ((c) / (sqrt(1.0f - d * d)));

  if (d > 0)
    e *= (2.0f - d - 1.0f);
  else
    e *= (d + 1.0f);

  float f = (d + 1.0f + e) / 2.0f;
  float g = f - e;
  c = 1.0f - ((g) / (f));

  return B((float4)(b, c, f, a));
}

float4 D(float4 a) {
  float b = sqrt(a.x * a.x + a.y * a.y);
  float c;

  if (b == 0.0f) {
    c = 0.0f;
  } else {
    c = atan2(a.y, a.x);
  }

  if (c <= 0.0f)
    c += 2.0f * 3.14159f;
  c /= (2.0f * 3.14159f);

  a.x = c;
  a.y = b;

  return C(a);
}

float4 E(float4 a) {
  float b, c, d;
  float e = fmin(fmin(a.x, a.y), a.z);
  float f = fmax(fmax(a.x, a.y), a.z);

  float g = f - e;

  d = (f + e) - 1.0f;

  c = g * sqrt(1.0f - d * d);

  if (d == -1.0f || d == 1.0f)
    c = 0.0f;
  else if (d > 0)
    c = ((c) / ((2.0f - d - 1.0f)));
  else if (d <= 0)
    c = ((c) / ((d + 1.0f)));

  if (c == 0.0f) {
    b = 0.0f;
  } else {
    if (a.x == f)
      b = (((a.y - a.z)) / (g));
    else if (a.y == f)
      b = 2.0f + (((a.z - a.x)) / (g));
    else
      b = 4.0f + (((a.x - a.y)) / (g));
    b *= 3.14 / 3.0f;
  }

  float4 h = (float4)(c * cos(b), c * sin(b), 0.999999f * d, a);

  return h;
}