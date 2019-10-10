typedef struct latLong {
  float lat;
  float lng;
} LatLong;
__attribute__((reqd_work_group_size(64, 1, 1))) __attribute__((num_simd_work_items(16))) __attribute__((num_compute_units(4))) __kernel void A(__global LatLong* a, __global float* b, const int c, const float d, const float e) {
  int f = get_global_id(0);

  if (f < c) {
    __global LatLong* g = a + f;
    __global float* h = b + f;
    *h = (float)sqrt((d - g->lat) * (d - g->lat) + (e - g->lng) * (e - g->lng));
  }
}