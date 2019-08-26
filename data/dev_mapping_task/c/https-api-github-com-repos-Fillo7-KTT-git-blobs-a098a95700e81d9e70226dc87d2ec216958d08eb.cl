typedef struct KernelData {
  float a;
  float b;
  float result;
} KernelData;

__kernel void A(__global KernelData* a) {
  int b = get_global_id(0);
  a[b].result = a[b].a + a[b].b;
}