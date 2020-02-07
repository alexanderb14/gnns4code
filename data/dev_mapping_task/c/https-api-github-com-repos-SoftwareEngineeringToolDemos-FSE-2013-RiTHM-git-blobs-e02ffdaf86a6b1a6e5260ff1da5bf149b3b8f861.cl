typedef struct {
} program_state_struct;

typedef struct { int dummy; } used_params_struct;

typedef unsigned char fsm_state;

bool A(fsm_state a) {
  if ((a ^ 0x00) == 0 || (a ^ 0x03) == 0)
    return true;
  return false;
}

bool B(char* a, __constant char* b) {
  int c = 0;
  while (a[c] != '\0' && b[c] != '\0') {
    if (a[c] != b[c])
      return false;
    ++c;
  }
  if (a[c] != b[c])
    return false;
  return true;
}

void C(program_state_struct* a, const __global program_state_struct* b) {
  if (a == 0 || b == 0)
    return;
}

__kernel void D(__global program_state_struct const* restrict a, __global fsm_state* b, __global fsm_state* c, __global uint* d, __global uint* e, __global used_params_struct* f, uint g) {
  uint h = g;
  int i = get_global_id(0);
  int j = h / get_global_size(0);

  program_state_struct k;
  fsm_state l;
  unsigned int m = 0;

  return;
}