typedef struct _Element {
  global float* internal;
  global float* external;
  float value;
} Element;

kernel void A(global Element* a, global float* b) {
  int c = (int)get_global_id(0);

  float d = *(a[c].internal);
  float e = *(a[c].external);
  b[c] = d + e;
}