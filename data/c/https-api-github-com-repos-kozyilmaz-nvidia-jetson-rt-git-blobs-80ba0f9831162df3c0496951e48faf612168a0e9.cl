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

  __local FOUR_VECTOR j[100];
  __local FOUR_VECTOR k[100];
  __local float l[100];

  if (g < b.number_boxes) {
    float m = 2 * a.alpha * a.alpha;

    int n;

    int o;
    int p = 0;
    int q;
    int r = 0;

    float s;
    float t;
    float u;
    float v;
    float w;
    float x;
    float y;
    THREE_VECTOR z;
    n = c[g].offset;

    while (i < 100) {
      j[i] = d[n + i];
      i = i + 128;
    }
    i = h;

    barrier(1);

    for (p = 0; p < (1 + c[g].nn); p++) {
      if (p == 0) {
        o = g;
      } else {
        o = c[g].nei[p - 1].number;
      }

      q = c[o].offset;

      while (i < 100) {
        k[i] = d[q + i];
        l[i] = e[q + i];
        i = i + 128;
      }
      i = h;

      barrier(1);

      while (i < 100) {
        for (r = 0; r < 100; r++) {
          s = j[i].v + k[r].v - ((j[i].x) * (k[r].x) + (j[i].y) * (k[r].y) + (j[i].z) * (k[r].z));
          t = m * s;
          u = exp(-t);
          v = 2 * u;
          z.x = j[i].x - k[r].x;
          w = v * z.x;
          z.y = j[i].y - k[r].y;
          x = v * z.y;
          z.z = j[i].z - k[r].z;
          y = v * z.z;
          f[n + i].v += l[r] * u;
          f[n + i].x += l[r] * w;
          f[n + i].y += l[r] * x;
          f[n + i].z += l[r] * y;
        }

        i = i + 128;
      }

      i = h;

      barrier(1);
    }
  }
}