__attribute__((reqd_work_group_size(256, 1, 1))) void __kernel A(const unsigned int a, __global const unsigned int* restrict b, __global const unsigned int* restrict c, __global const float* restrict d, __constant float* restrict e, __global float* restrict f) {
  __private size_t g = get_global_id(0);

  if (g < a) {
    __private float h = f[g];

    __private const unsigned int i = b[g];
    __private const unsigned int j = b[g + 1];

    __private size_t k, l, m;
    __private float n[16];
    __private unsigned int o[16];
    for (k = i; k < j; k = k + 16) {
      if (k + 16 - 1 < j) {
        for (l = 0; l < 16; l++)
          n[l] = d[k + l];

        for (l = 0; l < 16; l++)
          o[l] = c[k + l];

        h = ((((((h) + (n[0] * e[o[0]])) + ((n[1] * e[o[1]]) + (n[2] * e[o[2]]))) + (((n[3] * e[o[3]]) + (n[4] * e[o[4]])) + ((n[5] * e[o[5]]) + (n[6] * e[o[6]])))) + ((((n[7] * e[o[7]]) + (n[8] * e[o[8]])) + ((n[9] * e[o[9]]) + (n[10] * e[o[10]]))) + (((n[11] * e[o[11]]) + (n[12] * e[o[12]])) + ((n[13] * e[o[13]]) + (n[14] * e[o[14]]))))) + (n[15] * e[o[15]]));
      } else {
        for (m = k; m < j; m++)
          h += d[m] * e[c[m]];
      }
    }
    f[g] = h;
  }
}