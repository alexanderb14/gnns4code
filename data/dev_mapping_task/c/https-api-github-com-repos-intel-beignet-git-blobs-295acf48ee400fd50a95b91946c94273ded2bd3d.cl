typedef struct {
  int offset;
  int threshold0;
  int threshold1;
} hop;

__kernel void A(__global int* a, hop b) {
  int c = get_global_id(0);
  int d = 0;
  if (c == 0) {
    d = b.threshold0;
  } else {
    d = b.threshold1;
  }
  a[c] = d;
}