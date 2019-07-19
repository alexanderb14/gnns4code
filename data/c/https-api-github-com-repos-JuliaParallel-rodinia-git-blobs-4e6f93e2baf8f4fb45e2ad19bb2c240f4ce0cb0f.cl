typedef struct { float x, y, z; } THREE_VECTOR;

typedef struct { float v, x, y, z; } FOUR_VECTOR;

typedef struct nei_str {
  int x, y, z;
  int number;
  long offset;

} nei_str;

typedef struct box_str {
  int x, y, z;
  int number;
  long offset;

  int nn;
  nei_str nei[26];

} box_str;

typedef struct par_str { float alpha; } par_str;

typedef struct dim_str {
  int cur_arg;
  int arch_arg;
  int cores_arg;
  int boxes1d_arg;

  long number_boxes;
  long box_mem;
  long space_elem;
  long space_mem;
  long space_mem2;

} dim_str;

__kernel void A(par_str a, dim_str b, __global box_str* c, __global FOUR_VECTOR* d, __global float* e, __global FOUR_VECTOR* f) {
  int g = get_group_id(0);
  int h = get_local_id(0);
  int i = h;

  if (g < b.number_boxes) {
    float j = 2 * a.alpha * a.alpha;

    int k;

    __local FOUR_VECTOR l[100];

    int m;
    int n = 0;
    int o;
    int p = 0;

    __local FOUR_VECTOR q[100];
    __local float r[100];

    float s;
    float t;
    float u;
    float v;
    float w;
    float x;
    float y;
    THREE_VECTOR z;
    k = c[g].offset;

    while (i < 100) {
      l[i] = d[k + i];
      i = i + 128;
    }
    i = h;

    barrier(1);

    for (n = 0; n < (1 + c[g].nn); n++) {
      if (n == 0) {
        m = g;
      } else {
        m = c[g].nei[n - 1].number;
      }

      o = c[m].offset;

      while (i < 100) {
        q[i] = d[o + i];
        r[i] = e[o + i];
        i = i + 128;
      }
      i = h;

      barrier(1);

      while (i < 100) {
        for (p = 0; p < 100; p++) {
          s = l[i].v + q[p].v - ((l[i].x) * (q[p].x) + (l[i].y) * (q[p].y) + (l[i].z) * (q[p].z));
          t = j * s;
          u = exp(-t);
          v = 2 * u;
          z.x = l[i].x - q[p].x;
          w = v * z.x;
          z.y = l[i].y - q[p].y;
          x = v * z.y;
          z.z = l[i].z - q[p].z;
          y = v * z.z;
          f[k + i].v += r[p] * u;
          f[k + i].x += r[p] * w;
          f[k + i].y += r[p] * x;
          f[k + i].z += r[p] * y;
        }

        i = i + 128;
      }

      i = h;

      barrier(1);
    }
  }
}