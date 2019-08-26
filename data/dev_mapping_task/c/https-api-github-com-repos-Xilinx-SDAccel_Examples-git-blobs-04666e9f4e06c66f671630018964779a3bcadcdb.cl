typedef float16 bus_t; typedef union {
  bus_t b;
  float f[(1 << ((4)))];
} bus_to_float_t;

__attribute__((always_inline)) bus_t A(float* a) {
  bus_to_float_t b;

  for (uint c = 0; c < (1 << ((4))); c++) {
    b.f[c] = a[c];
  }

  return b.b;
}

__attribute__((always_inline)) void B(bus_t a, float* b) {
  bus_to_float_t c;

  c.b = a;

  for (uint d = 0; d < (1 << ((4))); d++) {
    b[d] = c.f[d];
  }
}

__attribute__((always_inline)) bus_t C(float* a, bus_t b[((1 << 8) / ((1 << ((4))))) + 1], uint c) {
  float d[(((1 << 8) / ((1 << ((4))))) + 1) * (1 << ((4)))] __attribute__((xcl_array_partition(complete, 0)));

  for (uint e = 0; e < ((1 << 8) / ((1 << ((4))))) + 1; e++) {
    bus_t f;
    if (((1 << 8) / ((1 << ((4))))) - e > c)
      f = 0.0f;
    else
      f = b[e];

    B(f, &d[(1 << ((4))) * e]);
  }
  for (uint g = 0; g < 8; g++) {
    uint h = 1 << g;
    uint i = 1 << (g + 1);

    for (uint j = 1; j <= (1 << (8 - 1 - g)); j++) {
      d[j * i - 1] = d[j * i - 1] + d[j * i - h - 1];
    }
  }

  for (uint g = 0; g < (4); g++) {
    uint k = (1 << ((4))) * ((1 << 8) / ((1 << ((4)))));
    uint h = 1 << g;
    uint i = 1 << (g + 1);

    for (uint j = 1; j <= (1 << ((4) - 1 - g)); j++) {
      for (uint e = 0; e < (1 << g); e++) {
        d[k + j * i - e - 1] = d[k + j * i - e - 1] + d[k + j * i - h - 1];
      }
    }
  }

  *a += d[((1 << 8) / ((1 << ((4))))) * (1 << ((4))) - 1];

  for (uint e = 0; e < (1 << ((4))); e++) {
    d[(1 << ((4))) * ((1 << 8) / ((1 << ((4))))) + e] += *a;
  }
  return A(&d[(1 << ((4))) * ((1 << 8) / ((1 << ((4)))))]);
}

__kernel void __attribute__((reqd_work_group_size(1, 1, 1))) D(__global bus_t* a, __global bus_t* b, uint c) {
  float d[((1 << 8) / ((1 << ((4)))))];
  bus_t e[((1 << 8) / ((1 << ((4))))) + 1] __attribute__((xcl_array_partition(complete, 0)));

  uint f = (((c)-1) / ((1 << ((4)))) + 1);

  __attribute__((xcl_pipeline_loop)) for (uint g = 0; g < f; g++) {
    float h;

    if (g < ((1 << 8) / ((1 << ((4))))) + 1) {
      h = 0.0f;
    } else {
      h = d[g % (((1 << 8) / ((1 << ((4))))))];
    }

    for (uint i = 0; i < ((1 << 8) / ((1 << ((4))))); i++) {
      e[i] = e[i + 1];
    }
    e[((1 << 8) / ((1 << ((4)))))] = a[g];

    b[g] = C(&h, e, g);

    d[g % (((1 << 8) / ((1 << ((4))))))] = h;
  }
}