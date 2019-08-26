typedef struct {
  float s01, s02, s03, s04, s05, s06, s07, s08, s09, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24;
  float carry;
  float dummy;
  int in24;
  int stepnr;
} ranluxcl_state_t;

void A(ranluxcl_state_t*, global ranluxcl_state_t*);
void B(ranluxcl_state_t*, global ranluxcl_state_t*);
float C(float, float, float*, float*);
float4 D(ranluxcl_state_t*);
void E(ranluxcl_state_t*);
void F(uint, global ranluxcl_state_t*);
float4 G(ranluxcl_state_t*);
void A(ranluxcl_state_t* a, global ranluxcl_state_t* b) {
  (*a) = b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1))];
}

void B(ranluxcl_state_t* a, global ranluxcl_state_t* b) {
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1))] = (*a);
}

float C(float a, float b, float* c, float* d) {
  float e, f;
  e = b - (*c) - (*d);
  if (e < 0.0f) {
    e += 1.0f;
    (*d) = 0.000000059604644775f;
  } else
    (*d) = 0.0f;
  f = ((*c) = e);

  if (e < 0.000244140625f) {
    f += 0.000000059604644775f * a;
    if (f == 0.0f)
      f = 0.000000059604644775f * 0.000000059604644775f;
  }
  return f;
}

float4 D(ranluxcl_state_t* a) {
  float4 b;

  if (a->stepnr == 0) {
    b.x = C(a->s09, a->s10, &(a->s24), &(a->carry));
    b.y = C(a->s08, a->s09, &(a->s23), &(a->carry));
    b.z = C(a->s07, a->s08, &(a->s22), &(a->carry));
    b.w = C(a->s06, a->s07, &(a->s21), &(a->carry));
    a->stepnr += 4;
  }

  else if (a->stepnr == 4) {
    b.x = C(a->s05, a->s06, &(a->s20), &(a->carry));
    b.y = C(a->s04, a->s05, &(a->s19), &(a->carry));
    b.z = C(a->s03, a->s04, &(a->s18), &(a->carry));
    b.w = C(a->s02, a->s03, &(a->s17), &(a->carry));
    a->stepnr += 4;
  }

  else if (a->stepnr == 8) {
    b.x = C(a->s01, a->s02, &(a->s16), &(a->carry));
    b.y = C(a->s24, a->s01, &(a->s15), &(a->carry));
    b.z = C(a->s23, a->s24, &(a->s14), &(a->carry));
    b.w = C(a->s22, a->s23, &(a->s13), &(a->carry));
    a->stepnr += 4;
  }

  else if (a->stepnr == 12) {
    b.x = C(a->s21, a->s22, &(a->s12), &(a->carry));
    b.y = C(a->s20, a->s21, &(a->s11), &(a->carry));
    b.z = C(a->s19, a->s20, &(a->s10), &(a->carry));
    b.w = C(a->s18, a->s19, &(a->s09), &(a->carry));
    a->stepnr += 4;
  }

  else if (a->stepnr == 16) {
    b.x = C(a->s17, a->s18, &(a->s08), &(a->carry));
    b.y = C(a->s16, a->s17, &(a->s07), &(a->carry));
    b.z = C(a->s15, a->s16, &(a->s06), &(a->carry));
    b.w = C(a->s14, a->s15, &(a->s05), &(a->carry));
    a->stepnr += 4;
  }

  else if (a->stepnr == 20) {
    b.x = C(a->s13, a->s14, &(a->s04), &(a->carry));
    b.y = C(a->s12, a->s13, &(a->s03), &(a->carry));
    b.z = C(a->s11, a->s12, &(a->s02), &(a->carry));
    b.w = C(a->s10, a->s11, &(a->s01), &(a->carry));
    a->stepnr = 0;
  }

  (*&(a->in24)) += 4;
  if ((*&(a->in24)) == 24) {
    (*&(a->in24)) = 0;

    int c = (a->stepnr) ? (24 - a->stepnr) : 0;
    int d = ((380 - c) / 24) * 24;
    int e = 380 - c - d;

    switch (c) {
      case (20):
        C(a->s05, a->s06, &(a->s20), &(a->carry));
        C(a->s04, a->s05, &(a->s19), &(a->carry));
        C(a->s03, a->s04, &(a->s18), &(a->carry));
        C(a->s02, a->s03, &(a->s17), &(a->carry));
      case (16):
        C(a->s01, a->s02, &(a->s16), &(a->carry));
        C(a->s24, a->s01, &(a->s15), &(a->carry));
        C(a->s23, a->s24, &(a->s14), &(a->carry));
        C(a->s22, a->s23, &(a->s13), &(a->carry));
      case (12):
        C(a->s21, a->s22, &(a->s12), &(a->carry));
        C(a->s20, a->s21, &(a->s11), &(a->carry));
        C(a->s19, a->s20, &(a->s10), &(a->carry));
        C(a->s18, a->s19, &(a->s09), &(a->carry));
      case (8):
        C(a->s17, a->s18, &(a->s08), &(a->carry));
        C(a->s16, a->s17, &(a->s07), &(a->carry));
        C(a->s15, a->s16, &(a->s06), &(a->carry));
        C(a->s14, a->s15, &(a->s05), &(a->carry));
      case (4):
        C(a->s13, a->s14, &(a->s04), &(a->carry));
        C(a->s12, a->s13, &(a->s03), &(a->carry));
        C(a->s11, a->s12, &(a->s02), &(a->carry));
        C(a->s10, a->s11, &(a->s01), &(a->carry));
    }

    for (int f = 0; f < d / 24; f++) {
      C(a->s09, a->s10, &(a->s24), &(a->carry));
      C(a->s08, a->s09, &(a->s23), &(a->carry));
      C(a->s07, a->s08, &(a->s22), &(a->carry));
      C(a->s06, a->s07, &(a->s21), &(a->carry));
      C(a->s05, a->s06, &(a->s20), &(a->carry));
      C(a->s04, a->s05, &(a->s19), &(a->carry));
      C(a->s03, a->s04, &(a->s18), &(a->carry));
      C(a->s02, a->s03, &(a->s17), &(a->carry));
      C(a->s01, a->s02, &(a->s16), &(a->carry));
      C(a->s24, a->s01, &(a->s15), &(a->carry));
      C(a->s23, a->s24, &(a->s14), &(a->carry));
      C(a->s22, a->s23, &(a->s13), &(a->carry));
      C(a->s21, a->s22, &(a->s12), &(a->carry));
      C(a->s20, a->s21, &(a->s11), &(a->carry));
      C(a->s19, a->s20, &(a->s10), &(a->carry));
      C(a->s18, a->s19, &(a->s09), &(a->carry));
      C(a->s17, a->s18, &(a->s08), &(a->carry));
      C(a->s16, a->s17, &(a->s07), &(a->carry));
      C(a->s15, a->s16, &(a->s06), &(a->carry));
      C(a->s14, a->s15, &(a->s05), &(a->carry));
      C(a->s13, a->s14, &(a->s04), &(a->carry));
      C(a->s12, a->s13, &(a->s03), &(a->carry));
      C(a->s11, a->s12, &(a->s02), &(a->carry));
      C(a->s10, a->s11, &(a->s01), &(a->carry));
    }

    if (e) {
      C(a->s09, a->s10, &(a->s24), &(a->carry));
      C(a->s08, a->s09, &(a->s23), &(a->carry));
      C(a->s07, a->s08, &(a->s22), &(a->carry));
      C(a->s06, a->s07, &(a->s21), &(a->carry));

      if (e > 4) {
        C(a->s05, a->s06, &(a->s20), &(a->carry));
        C(a->s04, a->s05, &(a->s19), &(a->carry));
        C(a->s03, a->s04, &(a->s18), &(a->carry));
        C(a->s02, a->s03, &(a->s17), &(a->carry));
      }

      if (e > 8) {
        C(a->s01, a->s02, &(a->s16), &(a->carry));
        C(a->s24, a->s01, &(a->s15), &(a->carry));
        C(a->s23, a->s24, &(a->s14), &(a->carry));
        C(a->s22, a->s23, &(a->s13), &(a->carry));
      }

      if (e > 12) {
        C(a->s21, a->s22, &(a->s12), &(a->carry));
        C(a->s20, a->s21, &(a->s11), &(a->carry));
        C(a->s19, a->s20, &(a->s10), &(a->carry));
        C(a->s18, a->s19, &(a->s09), &(a->carry));
      }

      if (e > 16) {
        C(a->s17, a->s18, &(a->s08), &(a->carry));
        C(a->s16, a->s17, &(a->s07), &(a->carry));
        C(a->s15, a->s16, &(a->s06), &(a->carry));
        C(a->s14, a->s15, &(a->s05), &(a->carry));
      }
    }

    a->stepnr = e;
  }

  return b;
}
void E(ranluxcl_state_t* a) {
  if (a->stepnr == 4)
    D(a);
  if (a->stepnr == 8)
    D(a);
  if (a->stepnr == 12)
    D(a);
  if (a->stepnr == 16)
    D(a);
  if (a->stepnr == 20)
    D(a);
}
void H(ulong a, global ranluxcl_state_t* b) {
  ranluxcl_state_t c;
  ulong d, e, f;

  a ^= (a << 13);
  a ^= (a >> 7);
  a ^= (a << 17);
  d = a;
  a ^= (a << 13);
  a ^= (a >> 7);
  a ^= (a << 17);
  e = a;
  a ^= (a << 13);
  a ^= (a >> 7);
  a ^= (a << 17);
  f = a;
  c.s01 = (float)(d >> 40) / (float)16777216;
  c.s02 = (float)((d & 0x000000FFFFFFFFFF) >> 16) / (float)16777216;
  c.s03 = (float)(((d & 0x000000000000FFFF) << 8) + (e >> 56)) / (float)16777216;
  c.s04 = (float)((e & 0x00FFFFFFFFFFFFFF) >> 32) / (float)16777216;
  c.s05 = (float)((e & 0x00000000FFFFFFFF) >> 8) / (float)16777216;
  c.s06 = (float)(((e & 0x00000000000000FF) << 16) + (f >> 48)) / (float)16777216;
  c.s07 = (float)((f & 0x0000FFFFFFFFFFFF) >> 24) / (float)16777216;
  c.s08 = (float)(f & 0x0000000000FFFFFF) / (float)16777216;

  a ^= (a << 13);
  a ^= (a >> 7);
  a ^= (a << 17);
  d = a;
  a ^= (a << 13);
  a ^= (a >> 7);
  a ^= (a << 17);
  e = a;
  a ^= (a << 13);
  a ^= (a >> 7);
  a ^= (a << 17);
  f = a;
  c.s09 = (float)(d >> 40) / (float)16777216;
  c.s10 = (float)((d & 0x000000FFFFFFFFFF) >> 16) / (float)16777216;
  c.s11 = (float)(((d & 0x000000000000FFFF) << 8) + (e >> 56)) / (float)16777216;
  c.s12 = (float)((e & 0x00FFFFFFFFFFFFFF) >> 32) / (float)16777216;
  c.s13 = (float)((e & 0x00000000FFFFFFFF) >> 8) / (float)16777216;
  c.s14 = (float)(((e & 0x00000000000000FF) << 16) + (f >> 48)) / (float)16777216;
  c.s15 = (float)((f & 0x0000FFFFFFFFFFFF) >> 24) / (float)16777216;
  c.s16 = (float)(f & 0x0000000000FFFFFF) / (float)16777216;

  a ^= (a << 13);
  a ^= (a >> 7);
  a ^= (a << 17);
  d = a;
  a ^= (a << 13);
  a ^= (a >> 7);
  a ^= (a << 17);
  e = a;
  a ^= (a << 13);
  a ^= (a >> 7);
  a ^= (a << 17);
  f = a;
  c.s17 = (float)(d >> 40) / (float)16777216;
  c.s18 = (float)((d & 0x000000FFFFFFFFFF) >> 16) / (float)16777216;
  c.s19 = (float)(((d & 0x000000000000FFFF) << 8) + (e >> 56)) / (float)16777216;
  c.s20 = (float)((e & 0x00FFFFFFFFFFFFFF) >> 32) / (float)16777216;
  c.s21 = (float)((e & 0x00000000FFFFFFFF) >> 8) / (float)16777216;
  c.s22 = (float)(((e & 0x00000000000000FF) << 16) + (f >> 48)) / (float)16777216;
  c.s23 = (float)((f & 0x0000FFFFFFFFFFFF) >> 24) / (float)16777216;
  c.s24 = (float)(f & 0x0000000000FFFFFF) / (float)16777216;
  c.in24 = 0;
  c.stepnr = 0;
  c.carry = 0.0f;
  if (c.s24 == 0.0f)
    c.carry = 0.000000059604644775f;

  for (int g = 0; g < 16 * 2; g++) {
    C(c.s09, c.s10, &(c.s24), &(c.carry));
    C(c.s08, c.s09, &(c.s23), &(c.carry));
    C(c.s07, c.s08, &(c.s22), &(c.carry));
    C(c.s06, c.s07, &(c.s21), &(c.carry));
    C(c.s05, c.s06, &(c.s20), &(c.carry));
    C(c.s04, c.s05, &(c.s19), &(c.carry));
    C(c.s03, c.s04, &(c.s18), &(c.carry));
    C(c.s02, c.s03, &(c.s17), &(c.carry));
    C(c.s01, c.s02, &(c.s16), &(c.carry));
    C(c.s24, c.s01, &(c.s15), &(c.carry));
    C(c.s23, c.s24, &(c.s14), &(c.carry));
    C(c.s22, c.s23, &(c.s13), &(c.carry));
    C(c.s21, c.s22, &(c.s12), &(c.carry));
    C(c.s20, c.s21, &(c.s11), &(c.carry));
    C(c.s19, c.s20, &(c.s10), &(c.carry));
    C(c.s18, c.s19, &(c.s09), &(c.carry));
    C(c.s17, c.s18, &(c.s08), &(c.carry));
    C(c.s16, c.s17, &(c.s07), &(c.carry));
    C(c.s15, c.s16, &(c.s06), &(c.carry));
    C(c.s14, c.s15, &(c.s05), &(c.carry));
    C(c.s13, c.s14, &(c.s04), &(c.carry));
    C(c.s12, c.s13, &(c.s03), &(c.carry));
    C(c.s11, c.s12, &(c.s02), &(c.carry));
    C(c.s10, c.s11, &(c.s01), &(c.carry));
  }

  *b = c;
}

void I(uint a, global ranluxcl_state_t* b) {
  int c, d;
  ranluxcl_state_t e;

  d = (get_global_size(0) * get_global_size(1) * get_global_size(2));

  int f = a * d + 1;

  int g = f + (get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1));

  if (g < 1)
    g = 1;

  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s01 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s02 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s03 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s04 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s05 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s06 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s07 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s08 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s09 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s10 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s11 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s12 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s13 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s14 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s15 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s16 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s17 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s18 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s19 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s20 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s21 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s22 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s23 = (g % 16777216) * 0.000000059604644775f;
  c = g / 53668;
  g = 40014 * (g - c * 53668) - c * 12211;
  if (g < 0)
    g = g + 2147483563;
  e.s24 = (g % 16777216) * 0.000000059604644775f;

  e.in24 = 0;
  e.stepnr = 0;
  e.carry = 0.0f;
  if (e.s24 == 0.0f)
    e.carry = 0.000000059604644775f;

  for (int h = 0; h < 16; h++) {
    C(e.s09, e.s10, &(e.s24), &(e.carry));
    C(e.s08, e.s09, &(e.s23), &(e.carry));
    C(e.s07, e.s08, &(e.s22), &(e.carry));
    C(e.s06, e.s07, &(e.s21), &(e.carry));
    C(e.s05, e.s06, &(e.s20), &(e.carry));
    C(e.s04, e.s05, &(e.s19), &(e.carry));
    C(e.s03, e.s04, &(e.s18), &(e.carry));
    C(e.s02, e.s03, &(e.s17), &(e.carry));
    C(e.s01, e.s02, &(e.s16), &(e.carry));
    C(e.s24, e.s01, &(e.s15), &(e.carry));
    C(e.s23, e.s24, &(e.s14), &(e.carry));
    C(e.s22, e.s23, &(e.s13), &(e.carry));
    C(e.s21, e.s22, &(e.s12), &(e.carry));
    C(e.s20, e.s21, &(e.s11), &(e.carry));
    C(e.s19, e.s20, &(e.s10), &(e.carry));
    C(e.s18, e.s19, &(e.s09), &(e.carry));
    C(e.s17, e.s18, &(e.s08), &(e.carry));
    C(e.s16, e.s17, &(e.s07), &(e.carry));
    C(e.s15, e.s16, &(e.s06), &(e.carry));
    C(e.s14, e.s15, &(e.s05), &(e.carry));
    C(e.s13, e.s14, &(e.s04), &(e.carry));
    C(e.s12, e.s13, &(e.s03), &(e.carry));
    C(e.s11, e.s12, &(e.s02), &(e.carry));
    C(e.s10, e.s11, &(e.s01), &(e.carry));
  }

  B(&e, b);
}

void F(uint a, global ranluxcl_state_t* b) {
  ulong c = (ulong)(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (ulong)a * ((ulong)0xffffffff + 1);
  H(c, b + (get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)));
}

float4 G(ranluxcl_state_t* a) {
  float4 b = D(a);

  float4 c;
  float d, e;

  d = sqrt(-2 * log(b.x));
  e = 2 * 3.1415926535f * b.y;
  c.x = d * cos(e);
  c.y = d * sin(e);

  d = sqrt(-2 * log(b.z));
  e = 2 * 3.1415926535f * b.w;
  c.z = d * cos(e);
  c.w = d * sin(e);

  return c;
}