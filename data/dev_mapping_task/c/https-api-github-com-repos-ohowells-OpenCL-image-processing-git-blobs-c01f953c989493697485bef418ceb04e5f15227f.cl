kernel void A(global const float* a, global const float* b, global const float* c, global float* d, global float* e, global float* f, const int g) {
  int h = get_global_id(0);
  int i = get_global_id(1);

  global const float* j = a + (i * g) + h;
  global const float* k = b + (i * g) + h;
  global const float* l = c + (i * g) + h;

  global float* m = d + (i * g) + h;
  global float* n = e + (i * g) + h;
  global float* o = f + (i * g) + h;

  *m = 0.4124f * *j + 0.3576f * *k + 0.1805f * *l;
  *n = 0.2126f * *j + 0.7152f * *k + 0.0722f * *l;
  *o = 0.0193f * *j + 0.1192f * *k + 0.9505f * *l;
}

kernel void B(global const float* a, global const float* b, global const float* c, global float* d, global float* e, global float* f, const int g) {
  int h = get_global_id(0);
  int i = get_global_id(1);

  global const float* j = a + (i * g) + h;
  global const float* k = b + (i * g) + h;
  global const float* l = c + (i * g) + h;

  global float* m = d + (i * g) + h;
  global float* n = e + (i * g) + h;
  global float* o = f + (i * g) + h;

  *m = *j / (*j + *k + *l);
  *n = *k / (*j + *k + *l);
  *o = *k / 2;
}

kernel void C(global const float* a, global const float* b, global const float* c, global float* d, global float* e, global float* f, const int g) {
  int h = get_global_id(0);
  int i = get_global_id(1);

  global const float* j = a + (i * g) + h;
  global const float* k = b + (i * g) + h;
  global const float* l = c + (i * g) + h;

  global float* m = d + (i * g) + h;
  global float* n = e + (i * g) + h;
  global float* o = f + (i * g) + h;

  float p = *j * (*l / *k);
  float q = *l;
  float r = (1 - *j - *k) * (*l / *k);

  *m = 3.2405f * p + -1.5371f * q + -0.4985f * r;
  *n = -0.9693f * p + 1.8760f * q + 0.0416f * r;
  *o = 0.0556f * p + -0.2040f * q + 1.0572f * r;
}