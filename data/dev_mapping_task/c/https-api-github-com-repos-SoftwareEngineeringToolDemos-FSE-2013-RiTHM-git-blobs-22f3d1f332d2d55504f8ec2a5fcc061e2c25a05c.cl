typedef struct {
  int low;
  int up;
} program_state_struct;

typedef unsigned char fsm_state;

void A(program_state_struct* a, const __global program_state_struct* b) {
  if (a == 0 || b == 0)
    return;

  a->low = b->low;
  a->up = b->up;
}

__kernel void B(__global program_state_struct const* restrict a, __global fsm_state* b, uint c) {
  uint d = c;
  int e = get_global_id(0);
  int f = d / get_global_size(0);

  program_state_struct g;

  for (int h = (e * f); h < ((e + 1) * f); ++h) {
    A(&g, &a[h]);
  }

  return;
}