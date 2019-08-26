typedef struct {
  double fitness;
  double parameters[500];
} Creature;

__kernel void A(__global Creature* a, __global double* b, uint c, uint d) {
  uint e = get_global_id(0);
  if (e >= c)
    return;

  double f = 0;
  for (int g = 0; g < d; g++) {
    double h = 1;
    for (int i = 0; i < g + 1; i++) {
      h *= a[e].parameters[g];
    }
    f += h * b[g];
  }
  a[e].fitness = f;
}

__kernel void B(__global Creature* a, uint b, uint c) {
  uint d = get_global_id(0);

  if (d >= b)
    return;

  if (d % 7 != 0)
    return;
  a[d].parameters[d % c] *= 0.5;
}