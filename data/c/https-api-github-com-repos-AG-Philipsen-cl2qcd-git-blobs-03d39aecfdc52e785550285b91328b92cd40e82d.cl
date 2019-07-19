typedef struct {
  float4 s01to04;
  float4 s05to08;
  float4 s09to12;
  float4 s13to16;
  float4 s17to20;
  float4 s21to24;
  float4 carryin24stepnr;
} ranluxcl_state_t;
void A(ranluxcl_state_t* a, __global float4* b) {
  (*a).s01to04 = b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 0 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  (*a).s05to08 = b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 1 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  (*a).s09to12 = b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 2 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  (*a).s13to16 = b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 3 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  (*a).s17to20 = b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 4 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  (*a).s21to24 = b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 5 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  (*a).carryin24stepnr = b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 6 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
}

void B(ranluxcl_state_t* a, __global float4* b) {
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 0 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = (*a).s01to04;
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 1 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = (*a).s05to08;
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 2 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = (*a).s09to12;
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 3 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = (*a).s13to16;
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 4 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = (*a).s17to20;
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 5 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = (*a).s21to24;
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 6 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = (*a).carryin24stepnr;
}

float C(float4* a, float4* b, float4* c) {
  float d, e;
  d = (*a).y - (*b).w - (*c).x;
  if (d < 0.0f) {
    d += 1.0f;
    (*c).x = 0.000000059604644775f;
  } else
    (*c).x = 0.0f;
  e = ((*b).w = d);

  if (d < 0.000244140625f)
    e += 0.000000059604644775f * (*a).y;

  if (e == 0.0f)
    e = 0.000000059604644775f * 0.000000059604644775f;
  return e;
}

float D(float4* a, float4* b, float4* c) {
  float d, e;
  d = (*a).x - (*b).z - (*c).x;
  if (d < 0.0f) {
    d += 1.0f;
    (*c).x = 0.000000059604644775f;
  } else
    (*c).x = 0.0f;
  e = ((*b).z = d);

  if (d < 0.000244140625f)
    e += 0.000000059604644775f * (*a).x;

  if (e == 0.0f)
    e = 0.000000059604644775f * 0.000000059604644775f;
  return e;
}

float E(float4* a, float4* b, float4* c) {
  float d, e;
  d = (*a).w - (*b).y - (*c).x;
  if (d < 0.0f) {
    d += 1.0f;
    (*c).x = 0.000000059604644775f;
  } else
    (*c).x = 0.0f;
  e = ((*b).y = d);

  if (d < 0.000244140625f)
    e += 0.000000059604644775f * (*a).w;

  if (e == 0.0f)
    e = 0.000000059604644775f * 0.000000059604644775f;
  return e;
}

float F(float4* a, float4* b, float4* c) {
  float d, e;
  d = (*a).z - (*b).x - (*c).x;
  if (d < 0.0f) {
    d += 1.0f;
    (*c).x = 0.000000059604644775f;
  } else
    (*c).x = 0.0f;
  e = ((*b).x = d);

  if (d < 0.000244140625f)
    e += 0.000000059604644775f * (*a).z;

  if (e == 0.0f)
    e = 0.000000059604644775f * 0.000000059604644775f;
  return e;
}

float4 G(ranluxcl_state_t* a) {
  float4 b;

  if ((*a).carryin24stepnr.z == 0.0f) {
    b.x = C(&((*a).s09to12), &((*a).s21to24), &((*a).carryin24stepnr));
    b.y = D(&((*a).s09to12), &((*a).s21to24), &((*a).carryin24stepnr));
    b.z = E(&((*a).s05to08), &((*a).s21to24), &((*a).carryin24stepnr));
    b.w = F(&((*a).s05to08), &((*a).s21to24), &((*a).carryin24stepnr));
    (*a).carryin24stepnr.z += 4.0f;
  }

  else if ((*a).carryin24stepnr.z == 4.0f) {
    b.x = C(&((*a).s05to08), &((*a).s17to20), &((*a).carryin24stepnr));
    b.y = D(&((*a).s05to08), &((*a).s17to20), &((*a).carryin24stepnr));
    b.z = E(&((*a).s01to04), &((*a).s17to20), &((*a).carryin24stepnr));
    b.w = F(&((*a).s01to04), &((*a).s17to20), &((*a).carryin24stepnr));
    (*a).carryin24stepnr.z += 4.0f;
  }

  else if ((*a).carryin24stepnr.z == 8.0f) {
    b.x = C(&((*a).s01to04), &((*a).s13to16), &((*a).carryin24stepnr));
    b.y = D(&((*a).s01to04), &((*a).s13to16), &((*a).carryin24stepnr));
    b.z = E(&((*a).s21to24), &((*a).s13to16), &((*a).carryin24stepnr));
    b.w = F(&((*a).s21to24), &((*a).s13to16), &((*a).carryin24stepnr));
    (*a).carryin24stepnr.z += 4.0f;
  }

  else if ((*a).carryin24stepnr.z == 12.0f) {
    b.x = C(&((*a).s21to24), &((*a).s09to12), &((*a).carryin24stepnr));
    b.y = D(&((*a).s21to24), &((*a).s09to12), &((*a).carryin24stepnr));
    b.z = E(&((*a).s17to20), &((*a).s09to12), &((*a).carryin24stepnr));
    b.w = F(&((*a).s17to20), &((*a).s09to12), &((*a).carryin24stepnr));
    (*a).carryin24stepnr.z += 4.0f;
  }

  else if ((*a).carryin24stepnr.z == 16.0f) {
    b.x = C(&((*a).s17to20), &((*a).s05to08), &((*a).carryin24stepnr));
    b.y = D(&((*a).s17to20), &((*a).s05to08), &((*a).carryin24stepnr));
    b.z = E(&((*a).s13to16), &((*a).s05to08), &((*a).carryin24stepnr));
    b.w = F(&((*a).s13to16), &((*a).s05to08), &((*a).carryin24stepnr));
    (*a).carryin24stepnr.z += 4.0f;
  }

  else if ((*a).carryin24stepnr.z == 20.0f) {
    b.x = C(&((*a).s13to16), &((*a).s01to04), &((*a).carryin24stepnr));
    b.y = D(&((*a).s13to16), &((*a).s01to04), &((*a).carryin24stepnr));
    b.z = E(&((*a).s09to12), &((*a).s01to04), &((*a).carryin24stepnr));
    b.w = F(&((*a).s09to12), &((*a).s01to04), &((*a).carryin24stepnr));
    (*a).carryin24stepnr.z = 0.0f;
  }

  (*&((*a).carryin24stepnr)).y += 4.0f;
  if ((*&((*a).carryin24stepnr)).y == 24.0f) {
    (*&((*a).carryin24stepnr)).y = 0.0f;

    int c = (int)((*a).carryin24stepnr.z) ? (24 - (int)((*a).carryin24stepnr.z)) : 0;
    int d = ((380 - c) / 24) * 24;
    int e = 380 - c - d;

    switch (c) {
      case (20):
        C(&((*a).s05to08), &((*a).s17to20), &((*a).carryin24stepnr));
        D(&((*a).s05to08), &((*a).s17to20), &((*a).carryin24stepnr));
        E(&((*a).s01to04), &((*a).s17to20), &((*a).carryin24stepnr));
        F(&((*a).s01to04), &((*a).s17to20), &((*a).carryin24stepnr));
      case (16):
        C(&((*a).s01to04), &((*a).s13to16), &((*a).carryin24stepnr));
        D(&((*a).s01to04), &((*a).s13to16), &((*a).carryin24stepnr));
        E(&((*a).s21to24), &((*a).s13to16), &((*a).carryin24stepnr));
        F(&((*a).s21to24), &((*a).s13to16), &((*a).carryin24stepnr));
      case (12):
        C(&((*a).s21to24), &((*a).s09to12), &((*a).carryin24stepnr));
        D(&((*a).s21to24), &((*a).s09to12), &((*a).carryin24stepnr));
        E(&((*a).s17to20), &((*a).s09to12), &((*a).carryin24stepnr));
        F(&((*a).s17to20), &((*a).s09to12), &((*a).carryin24stepnr));
      case (8):
        C(&((*a).s17to20), &((*a).s05to08), &((*a).carryin24stepnr));
        D(&((*a).s17to20), &((*a).s05to08), &((*a).carryin24stepnr));
        E(&((*a).s13to16), &((*a).s05to08), &((*a).carryin24stepnr));
        F(&((*a).s13to16), &((*a).s05to08), &((*a).carryin24stepnr));
      case (4):
        C(&((*a).s13to16), &((*a).s01to04), &((*a).carryin24stepnr));
        D(&((*a).s13to16), &((*a).s01to04), &((*a).carryin24stepnr));
        E(&((*a).s09to12), &((*a).s01to04), &((*a).carryin24stepnr));
        F(&((*a).s09to12), &((*a).s01to04), &((*a).carryin24stepnr));
    }

    for (int f = 0; f < d / 24; f++) {
      C(&((*a).s09to12), &((*a).s21to24), &((*a).carryin24stepnr));
      D(&((*a).s09to12), &((*a).s21to24), &((*a).carryin24stepnr));
      E(&((*a).s05to08), &((*a).s21to24), &((*a).carryin24stepnr));
      F(&((*a).s05to08), &((*a).s21to24), &((*a).carryin24stepnr));
      C(&((*a).s05to08), &((*a).s17to20), &((*a).carryin24stepnr));
      D(&((*a).s05to08), &((*a).s17to20), &((*a).carryin24stepnr));
      E(&((*a).s01to04), &((*a).s17to20), &((*a).carryin24stepnr));
      F(&((*a).s01to04), &((*a).s17to20), &((*a).carryin24stepnr));
      C(&((*a).s01to04), &((*a).s13to16), &((*a).carryin24stepnr));
      D(&((*a).s01to04), &((*a).s13to16), &((*a).carryin24stepnr));
      E(&((*a).s21to24), &((*a).s13to16), &((*a).carryin24stepnr));
      F(&((*a).s21to24), &((*a).s13to16), &((*a).carryin24stepnr));
      C(&((*a).s21to24), &((*a).s09to12), &((*a).carryin24stepnr));
      D(&((*a).s21to24), &((*a).s09to12), &((*a).carryin24stepnr));
      E(&((*a).s17to20), &((*a).s09to12), &((*a).carryin24stepnr));
      F(&((*a).s17to20), &((*a).s09to12), &((*a).carryin24stepnr));
      C(&((*a).s17to20), &((*a).s05to08), &((*a).carryin24stepnr));
      D(&((*a).s17to20), &((*a).s05to08), &((*a).carryin24stepnr));
      E(&((*a).s13to16), &((*a).s05to08), &((*a).carryin24stepnr));
      F(&((*a).s13to16), &((*a).s05to08), &((*a).carryin24stepnr));
      C(&((*a).s13to16), &((*a).s01to04), &((*a).carryin24stepnr));
      D(&((*a).s13to16), &((*a).s01to04), &((*a).carryin24stepnr));
      E(&((*a).s09to12), &((*a).s01to04), &((*a).carryin24stepnr));
      F(&((*a).s09to12), &((*a).s01to04), &((*a).carryin24stepnr));
    }

    if (e) {
      C(&((*a).s09to12), &((*a).s21to24), &((*a).carryin24stepnr));
      D(&((*a).s09to12), &((*a).s21to24), &((*a).carryin24stepnr));
      E(&((*a).s05to08), &((*a).s21to24), &((*a).carryin24stepnr));
      F(&((*a).s05to08), &((*a).s21to24), &((*a).carryin24stepnr));

      if (e > 4) {
        C(&((*a).s05to08), &((*a).s17to20), &((*a).carryin24stepnr));
        D(&((*a).s05to08), &((*a).s17to20), &((*a).carryin24stepnr));
        E(&((*a).s01to04), &((*a).s17to20), &((*a).carryin24stepnr));
        F(&((*a).s01to04), &((*a).s17to20), &((*a).carryin24stepnr));
      }

      if (e > 8) {
        C(&((*a).s01to04), &((*a).s13to16), &((*a).carryin24stepnr));
        D(&((*a).s01to04), &((*a).s13to16), &((*a).carryin24stepnr));
        E(&((*a).s21to24), &((*a).s13to16), &((*a).carryin24stepnr));
        F(&((*a).s21to24), &((*a).s13to16), &((*a).carryin24stepnr));
      }

      if (e > 12) {
        C(&((*a).s21to24), &((*a).s09to12), &((*a).carryin24stepnr));
        D(&((*a).s21to24), &((*a).s09to12), &((*a).carryin24stepnr));
        E(&((*a).s17to20), &((*a).s09to12), &((*a).carryin24stepnr));
        F(&((*a).s17to20), &((*a).s09to12), &((*a).carryin24stepnr));
      }

      if (e > 16) {
        C(&((*a).s17to20), &((*a).s05to08), &((*a).carryin24stepnr));
        D(&((*a).s17to20), &((*a).s05to08), &((*a).carryin24stepnr));
        E(&((*a).s13to16), &((*a).s05to08), &((*a).carryin24stepnr));
        F(&((*a).s13to16), &((*a).s05to08), &((*a).carryin24stepnr));
      }
    }

    (*a).carryin24stepnr.z = (float)e;
  }

  return b;
}

void H(ranluxcl_state_t* a) {
  if ((*a).carryin24stepnr.z == 4.0f)
    G(a);
  if ((*a).carryin24stepnr.z == 8.0f)
    G(a);
  if ((*a).carryin24stepnr.z == 12.0f)
    G(a);
  if ((*a).carryin24stepnr.z == 16.0f)
    G(a);
  if ((*a).carryin24stepnr.z == 20.0f)
    G(a);
}

void I(int a, global float4* b) {
  int c, d, e;

  ranluxcl_state_t f;

  if (a < 0)
    a = 0;

  e = (get_global_size(0) * get_global_size(1) * get_global_size(2));

  c = a * e + 1;

  int g = c + (get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1));

  if (g < 1)
    g = 1;

  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s01to04.x = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s01to04.y = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s01to04.z = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s01to04.w = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s05to08.x = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s05to08.y = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s05to08.z = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s05to08.w = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s09to12.x = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s09to12.y = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s09to12.z = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s09to12.w = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s13to16.x = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s13to16.y = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s13to16.z = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s13to16.w = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s17to20.x = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s17to20.y = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s17to20.z = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s17to20.w = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s21to24.x = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s21to24.y = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s21to24.z = (g % 16777216) * 0.000000059604644775f;
  d = g / 53668;
  g = 40014 * (g - d * 53668) - d * 12211;
  if (g < 0)
    g = g + 2147483563;
  f.s21to24.w = (g % 16777216) * 0.000000059604644775f;

  f.carryin24stepnr.x = 0.0f;
  if (f.s21to24.w == 0.0f)
    f.carryin24stepnr.x = 0.000000059604644775f;

  f.carryin24stepnr.y = 0.0f;
  f.carryin24stepnr.z = 0.0f;

  for (int h = 0; h < 16; h++) {
    C(&(f.s09to12), &(f.s21to24), &(f.carryin24stepnr));
    D(&(f.s09to12), &(f.s21to24), &(f.carryin24stepnr));
    E(&(f.s05to08), &(f.s21to24), &(f.carryin24stepnr));
    F(&(f.s05to08), &(f.s21to24), &(f.carryin24stepnr));
    C(&(f.s05to08), &(f.s17to20), &(f.carryin24stepnr));
    D(&(f.s05to08), &(f.s17to20), &(f.carryin24stepnr));
    E(&(f.s01to04), &(f.s17to20), &(f.carryin24stepnr));
    F(&(f.s01to04), &(f.s17to20), &(f.carryin24stepnr));
    C(&(f.s01to04), &(f.s13to16), &(f.carryin24stepnr));
    D(&(f.s01to04), &(f.s13to16), &(f.carryin24stepnr));
    E(&(f.s21to24), &(f.s13to16), &(f.carryin24stepnr));
    F(&(f.s21to24), &(f.s13to16), &(f.carryin24stepnr));
    C(&(f.s21to24), &(f.s09to12), &(f.carryin24stepnr));
    D(&(f.s21to24), &(f.s09to12), &(f.carryin24stepnr));
    E(&(f.s17to20), &(f.s09to12), &(f.carryin24stepnr));
    F(&(f.s17to20), &(f.s09to12), &(f.carryin24stepnr));
    C(&(f.s17to20), &(f.s05to08), &(f.carryin24stepnr));
    D(&(f.s17to20), &(f.s05to08), &(f.carryin24stepnr));
    E(&(f.s13to16), &(f.s05to08), &(f.carryin24stepnr));
    F(&(f.s13to16), &(f.s05to08), &(f.carryin24stepnr));
    C(&(f.s13to16), &(f.s01to04), &(f.carryin24stepnr));
    D(&(f.s13to16), &(f.s01to04), &(f.carryin24stepnr));
    E(&(f.s09to12), &(f.s01to04), &(f.carryin24stepnr));
    F(&(f.s09to12), &(f.s01to04), &(f.carryin24stepnr));
  }

  B(&f, b);
}
__kernel void J(private int a, global float4* b) {
  I(a, b);
}

__kernel void K(private int a, global float4* b, global float* c) {
  ranluxcl_state_t d;
  A(&d, b);

  float4 e;

  for (int f = 0; f < a; f += 4)
    e = G(&d);

  c[get_global_id(0)] = e.w;

  B(&d, b);
}