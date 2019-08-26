typedef struct {
  double x;
  double y;
  double vx;
  double vy;
  double ax;
  double ay;
} particle_t;

void A(__global particle_t* a, __global particle_t* b) {
  double c = b->x - a->x;
  double d = b->y - a->y;
  double e = c * c + d * d;
  if (e > 0.01 * 0.01)
    return;
  e = (e > (0.01 / 100) * (0.01 / 100)) ? e : (0.01 / 100) * (0.01 / 100);
  double f = sqrt(e);

  double g = (1 - 0.01 / f) / e / 0.01;
  a->ax += g * c;
  a->ay += g * d;
}

__kernel void B(__global particle_t* a, int b) {
  int c = get_global_id(0);
  if (c >= b)
    return;

  a[c].ax = a[c].ay = 0;
  for (int d = 0; d < b; d++)
    A(&a[c], &a[d]);
}

__kernel void C(__global particle_t* a, int b, double c) {
  int d = get_global_id(0);

  if (d >= b)
    return;

  a[d].vx += a[d].ax * 0.0005;
  a[d].vy += a[d].ay * 0.0005;
  a[d].x += a[d].vx * 0.0005;
  a[d].y += a[d].vy * 0.0005;

  while (a[d].x < 0 || a[d].x > c) {
    a[d].x = a[d].x < 0 ? -(a[d].x) : 2 * c - a[d].x;
    a[d].vx = -(a[d].vx);
  }
  while (a[d].y < 0 || a[d].y > c) {
    a[d].y = a[d].y < 0 ? -(a[d].y) : 2 * c - a[d].y;
    a[d].vy = -(a[d].vy);
  }
}