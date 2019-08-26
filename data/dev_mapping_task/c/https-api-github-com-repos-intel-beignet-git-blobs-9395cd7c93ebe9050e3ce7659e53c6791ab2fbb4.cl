struct sfloat8 {
  float a;
  float b;
  float c;
  float d;
  float e;
  float f;
  float g;
  float h;
};

__kernel void A(struct sfloat8 a, __global struct sfloat8* b) {
  b[0].a = a.a;
  b[0].b = 12.0f;
  b[0].c = 12.0f;
  b[0].d = 12.0f;
  b[0].e = 12.0f;
  b[0].f = 12.0f;
  b[0].g = 12.0f;
  b[0].h = a.a + a.h;

  b[1].a = a.a;
  b[1].b = 12.0f;
  b[1].c = 12.0f;
  b[1].d = 12.0f;
  b[1].e = 12.0f;
  b[1].f = 12.0f;
  b[1].g = 12.0f;
  b[1].h = a.a + a.h;

  b[2].a = a.a;
  b[2].b = 12.0f;
  b[2].c = 12.0f;
  b[2].d = 12.0f;
  b[2].e = 12.0f;
  b[2].f = 12.0f;
  b[2].g = 12.0f;
  b[2].h = a.a + a.h;

  b[3].a = a.a;
  b[3].b = 12.0f;
  b[3].c = 12.0f;
  b[3].d = 12.0f;
  b[3].e = 12.0f;
  b[3].f = 12.0f;
  b[3].g = 12.0f;
  b[3].h = a.a + a.h;

  b[4].a = a.a;
  b[4].b = 12.0f;
  b[4].c = 12.0f;
  b[4].d = 12.0f;
  b[4].e = 12.0f;
  b[4].f = 12.0f;
  b[4].g = 12.0f;
  b[4].h = a.a + a.h;

  b[5].a = a.a;
  b[5].b = 12.0f;
  b[5].c = 12.0f;
  b[5].d = 12.0f;
  b[5].e = 12.0f;
  b[5].f = 12.0f;
  b[5].g = 12.0f;
  b[5].h = a.a + a.h;

  b[6] = b[0];
}