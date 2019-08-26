typedef struct MyStruct {
  int anint;
  float afloat;
  int threeints[3];
} MyStruct;

kernel void A(global int* a, global float* b, global MyStruct* c) {
  if (get_global_id(0) != 0) {
    return;
  }
  b[0] = c[0].afloat;
  a[0] = c[0].anint;
  c[0].threeints[0] = c[0].threeints[1] + c[0].threeints[2];
}