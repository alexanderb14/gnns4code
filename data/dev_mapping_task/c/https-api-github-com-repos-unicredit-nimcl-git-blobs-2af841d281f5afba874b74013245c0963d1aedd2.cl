typedef struct {
  float x;
  float y;
  int cluster;
} Point;

typedef struct {
  float x;
  float y;
} Centroid;

typedef struct {
  float x_sum;
  float y_sum;
  int num_points;
} Accum;

float A(__global Point* a, __global Centroid* b) {
  float c = a->x - b->x;
  float d = a->y - b->y;
  return c * c + d * d;
}

__kernel void B(__global Point* a, __global Centroid* b, int c, int d) {
  int e = get_global_id(0);
  int f = 0;
  float g = -1.0;

  if (e < c) {
    for (f = 0; f < d; f++) {
      float h = A(a + e, b + f);

      if (g > h || g == -1.0) {
        g = h;
        a[e].cluster = f;
      }
    }
  }
}

__kernel void C(__global Point* a, __global Accum* b, __local Accum* c, int d, int e) {
  int f = get_local_id(0);
  int g = get_global_id(0);
  int h = get_group_id(0);
  int i = f * e;
  int j;
  int k;

  for (j = i; j < i + e; j++) {
    c[j].x_sum = 0.0;
    c[j].y_sum = 0.0;
    c[j].num_points = 0;
  }

  if (g < d) {
    int l = a[g].cluster;
    c[i + l].x_sum = a[g].x;
    c[i + l].y_sum = a[g].y;
    c[i + l].num_points = 1;
  }
  barrier(1);

  for (j = get_local_size(0) / 2; j > 0; j = j / 2) {
    if (f < j) {
      for (k = 0; k < e; k++) {
        int m = i + k;
        int n = i + k + j * e;
        c[m].x_sum += c[n].x_sum;
        c[m].y_sum += c[n].y_sum;
        c[m].num_points += c[n].num_points;
      }
    }
    barrier(1);
  }

  if (f == 0) {
    for (k = 0; k < e; k++) {
      int o = h * e + k;
      b[o].x_sum = c[i + k].x_sum;
      b[o].y_sum = c[i + k].y_sum;
      b[o].num_points = c[i + k].num_points;
    }
  }
}

__kernel void D(__global Accum* a, __global Centroid* b, int c, int d) {
  int e = get_global_id(0);
  float f = 0.0;
  float g = 0.0;
  int h = 0;
  int i;

  if (e < d) {
    for (i = 0; i < c; i++) {
      int j = i * d + e;
      f += a[j].x_sum;
      g += a[j].y_sum;
      h += a[j].num_points;
    }
    if (h > 0) {
      b[e].x = f / h;
      b[e].y = g / h;
    }
  }
}