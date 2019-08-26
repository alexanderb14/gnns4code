typedef float mat3x3[3][3]; typedef float mat3x3_tri[6]; typedef struct QEFData_s {
  mat3x3_tri ATA;
  float pad[2];
  float4 ATb;
  float4 masspoint;
} QEFData;
void A(float4* a, mat3x3 b, float4 c) {
  (*a).x = dot((float4)(b[0][0], b[0][1], b[0][2], 0.f), c);
  (*a).y = dot((float4)(b[1][0], b[1][1], b[1][2], 0.f), c);
  (*a).z = dot((float4)(b[2][0], b[2][1], b[2][2], 0.f), c);
  (*a).w = 0.f;
}

void B(float a, float b, float c, float* d, float* e) {
  if (b == 0.f) {
    *d = 1.f;
    *e = 0.f;
    return;
  }
  float f = (c - a) / (2.f * b);
  float g = sqrt(1.f + f * f);
  float h = 1.f / ((f >= 0.f) ? (f + g) : (f - g));
  *d = (1.f / sqrt(1.f + h * h));
  *e = h * (*d);
}

void C(float* a, float* b, float c, float d) {
  float e = *a;
  float f = *b;
  *a = c * e - d * f;
  *b = d * e + c * f;
}

void D(float* a, float* b, float* c, float d, float e) {
  float f = d * d;
  float g = e * e;
  float h = 2.0 * d * e * (*c);
  float i = *a;
  float j = *b;
  *a = f * i - h + g * j;
  *b = g * i + h + f * j;
}

void E(mat3x3 a, mat3x3 b, int c, int d) {
  if (a[c][d] == 0.0)
    return;

  float e, f;
  B(a[c][c], a[c][d], a[d][d], &e, &f);

  float g, h, i;
  g = a[c][c];
  h = a[d][d];
  i = a[c][d];
  D(&g, &h, &i, e, f);
  a[c][c] = g;
  a[d][d] = h;
  a[c][d] = i;

  g = a[0][3 - d];
  h = a[1 - c][2];
  C(&g, &h, e, f);
  a[0][3 - d] = g;
  a[1 - c][2] = h;

  a[c][d] = 0.0;

  g = b[0][c];
  h = b[0][d];
  C(&g, &h, e, f);
  b[0][c] = g;
  b[0][d] = h;

  g = b[1][c];
  h = b[1][d];
  C(&g, &h, e, f);
  b[1][c] = g;
  b[1][d] = h;

  g = b[2][c];
  h = b[2][d];
  C(&g, &h, e, f);
  b[2][c] = g;
  b[2][d] = h;
}

void F(mat3x3_tri a, float4* b, mat3x3 c) {
  mat3x3 d;
  d[0][0] = a[0];
  d[0][1] = a[1];
  d[0][2] = a[2];
  d[1][0] = 0.f;
  d[1][1] = a[3];
  d[1][2] = a[4];
  d[2][0] = 0.f;
  d[2][1] = 0.f;
  d[2][2] = a[5];

  for (int e = 0; e < (10); ++e) {
    E(d, c, 0, 1);
    E(d, c, 0, 2);
    E(d, c, 1, 2);
  }

  *b = (float4)(d[0], d[1], d[2], 0.f);
}

float G(float a, float b) {
  return (__clc_fabs(a) < b || __clc_fabs(1.0 / a) < b) ? 0.0 : (1.0 / a);
}

void H(mat3x3 a, float4 b, mat3x3 c) {
  float d = G(b.x, (0.1f));
  float e = G(b.y, (0.1f));
  float f = G(b.z, (0.1f));

  a[0][0] = c[0][0] * d * c[0][0] + c[0][1] * e * c[0][1] + c[0][2] * f * c[0][2];
  a[0][1] = c[0][0] * d * c[1][0] + c[0][1] * e * c[1][1] + c[0][2] * f * c[1][2];
  a[0][2] = c[0][0] * d * c[2][0] + c[0][1] * e * c[2][1] + c[0][2] * f * c[2][2];
  a[1][0] = c[1][0] * d * c[0][0] + c[1][1] * e * c[0][1] + c[1][2] * f * c[0][2];
  a[1][1] = c[1][0] * d * c[1][0] + c[1][1] * e * c[1][1] + c[1][2] * f * c[1][2];
  a[1][2] = c[1][0] * d * c[2][0] + c[1][1] * e * c[2][1] + c[1][2] * f * c[2][2];
  a[2][0] = c[2][0] * d * c[0][0] + c[2][1] * e * c[0][1] + c[2][2] * f * c[0][2];
  a[2][1] = c[2][0] * d * c[1][0] + c[2][1] * e * c[1][1] + c[2][2] * f * c[1][2];
  a[2][2] = c[2][0] * d * c[2][0] + c[2][1] * e * c[2][1] + c[2][2] * f * c[2][2];
}

void I(mat3x3_tri a, float4 b, float4* c) {
  mat3x3 d;
  d[0][0] = 1.f;
  d[0][1] = 0.f;
  d[0][2] = 0.f;
  d[1][0] = 0.f;
  d[1][1] = 1.f;
  d[1][2] = 0.f;
  d[2][0] = 0.f;
  d[2][1] = 0.f;
  d[2][2] = 1.f;

  float4 e = {0.f, 0.f, 0.f, 0.f};
  F(a, &e, d);

  mat3x3 f;
  H(f, e, d);
  A(c, f, b);
}

void J(float4* a, mat3x3_tri b, float4 c) {
  float4 d = {b[0], b[1], b[2], 0.f};

  (*a).x = dot(d, c);
  (*a).y = b[1] * c.x + b[3] * c.y + b[4] * c.z;
  (*a).z = b[2] * c.x + b[4] * c.y + b[5] * c.z;
}

void K(QEFData* a) {
  a->ATA[0] = 0.f;
  a->ATA[1] = 0.f;
  a->ATA[2] = 0.f;
  a->ATA[3] = 0.f;
  a->ATA[4] = 0.f;
  a->ATA[5] = 0.f;

  a->ATb = (float4)(0.f, 0.f, 0.f, 0.f);
  a->masspoint = (float4)(0.f, 0.f, 0.f, 0.f);
}

void L(QEFData* a, float4 b, float4 c) {
  a->ATA[0] += b.x * b.x;
  a->ATA[1] += b.x * b.y;
  a->ATA[2] += b.x * b.z;
  a->ATA[3] += b.y * b.y;
  a->ATA[4] += b.y * b.z;
  a->ATA[5] += b.z * b.z;

  float d = dot(c, b);
  a->ATb.x += b.x * d;
  a->ATb.y += b.y * d;
  a->ATb.z += b.z * d;

  a->masspoint.x += c.x;
  a->masspoint.y += c.y;
  a->masspoint.z += c.z;
  a->masspoint.w += 1.f;
}

void M(QEFData* a, const QEFData* b, const QEFData* c) {
  a->ATA[0] = b->ATA[0] + c->ATA[0];
  a->ATA[1] = b->ATA[1] + c->ATA[1];
  a->ATA[2] = b->ATA[2] + c->ATA[2];
  a->ATA[3] = b->ATA[3] + c->ATA[3];
  a->ATA[4] = b->ATA[4] + c->ATA[4];
  a->ATA[5] = b->ATA[5] + c->ATA[5];

  a->ATb = b->ATb + c->ATb;
  a->masspoint = b->masspoint + c->masspoint;
  a->masspoint /= a->masspoint.w;
}

float N(mat3x3_tri a, float4 b, float4 c) {
  float4 d;

  J(&d, a, b);
  d = c - d;

  return dot(d, d);
}

float O(mat3x3_tri a, float4 b, float4 c, float4* d) {
  float4 e = c / c.w;

  float4 f = {0.f, 0.f, 0.f, 0.f};
  J(&f, a, e);
  f = b - f;

  I(a, f, d);

  float g = N(a, *d, b);
  (*d) += e;

  return g;
}

float P(QEFData* a, float4* b) {
  a->masspoint /= max(a->masspoint.w, 1.f);

  float4 c = {0.f, 0.f, 0.f, 0.f};
  J(&c, a->ATA, a->masspoint);
  c = a->ATb - c;

  I(a->ATA, c, b);

  float d = N(a->ATA, *b, a->ATb);
  (*b) += a->masspoint;

  return d;
}

float4 Q(const float4* a, const float4* b, const size_t c, float* d) {
  QEFData e;
  e.ATA[0] = 0.f;
  e.ATA[1] = 0.f;
  e.ATA[2] = 0.f;
  e.ATA[3] = 0.f;
  e.ATA[4] = 0.f;
  e.ATA[5] = 0.f;
  e.ATb = (float4)(0.f, 0.f, 0.f, 0.f);
  e.masspoint = (float4)(0.f, 0.f, 0.f, 0.f);

  for (int f = 0; f < c; ++f) {
    L(&e, b[f], a[f]);
  }

  float4 g = {0.f, 0.f, 0.f, 0.f};
  *d = P(&e, &g);
  return g;
}

void R(const float4* a, const float4* b, const size_t c, QEFData* d) {
  d->ATA[0] = 0.f;
  d->ATA[1] = 0.f;
  d->ATA[2] = 0.f;
  d->ATA[3] = 0.f;
  d->ATA[4] = 0.f;
  d->ATA[5] = 0.f;
  d->ATb = (float4)(0.f, 0.f, 0.f, 0.f);
  d->masspoint = (float4)(0.f, 0.f, 0.f, 0.f);

  for (int e = 0; e < c; ++e) {
    L(d, b[e], a[e]);
  }

  d->masspoint /= d->masspoint.w;
}