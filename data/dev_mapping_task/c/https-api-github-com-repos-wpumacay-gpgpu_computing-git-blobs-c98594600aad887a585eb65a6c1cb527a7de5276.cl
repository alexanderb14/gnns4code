typedef struct {
  float x;
  float y;
  float t;

  float d1;
  float d2;
  float d3;

  float wz;
  float rayZ[20];
} ClParticle;

typedef struct {
  float p1x;
  float p1y;
  float p2x;
  float p2y;

} ClLine;

__kernel void A(__global ClParticle* a, int b, float c, float d, float e) {
  int f = get_local_id(0) + get_local_size(0) * get_group_id(0);

  if (f >= b) {
    return;
  }

  float g = d + a[f].d1;

  float h = e + a[f].d2;

  float i = a[f].d3;

  float j = a[f].x;
  float k = a[f].y;
  float l = a[f].t;

  if (h < 0.001f && h > -0.001f) {
    j += g * c * cos(l);
    k += g * c * sin(l);
  } else {
    j += (g / h) * (sin(l + h * c) - sin(l));
    k += (g / h) * (-cos(l + h * c) + cos(l));
    l += h * c + i * c;
  }

  a[f].x = j;
  a[f].y = k;
  a[f].t = l;
}

__kernel void B(__global ClParticle* a, int b, __global ClLine* c, int d, __global float* e, __global float* f, int g, int h, int i) {
  int j = get_local_id(0) + get_local_size(0) * get_group_id(0);

  if (j >= b) {
    return;
  }

  float k = a[j].x;
  float l = a[j].y;

  float m = c[h].p1x;
  float n = c[h].p1y;

  float o = c[h].p2x - m;
  float p = c[h].p2y - n;
  float q = sqrt(o * o + p * p);

  float r = o / q;
  float s = p / q;

  float t = cos(a[j].t + f[i]);
  float u = sin(a[j].t + f[i]);

  float v = t * s - u * r;

  float w = k - m;
  float x = l - n;

  float y = (-u * w + t * x) / v;
  float z = (-s * w + r * x) / v;

  if (y > 0 && y < q) {
    if (a[j].rayZ[i] > z && z > 0) {
      a[j].rayZ[i] = z;
    }
  }
}

__kernel void C(__global ClParticle* a, int b, __global float* c, int d) {
  int e = get_local_id(0) + get_local_size(0) * get_group_id(0);

  if (e >= b) {
    return;
  }

  for (int f = 0; f < d; f++) {
    float g = a[e].rayZ[f] - c[f];
    float h = (1.0f / sqrt(2 * 3.1415926 * 10.0 * 10.0)) * exp(-0.5 * g * g / (10.0 * 10.0));

    a[e].wz *= h;
  }
}