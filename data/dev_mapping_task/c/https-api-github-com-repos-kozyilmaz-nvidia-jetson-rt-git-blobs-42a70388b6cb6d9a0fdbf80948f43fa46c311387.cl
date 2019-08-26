typedef struct latLong {
  float lat;
  float lng;
} LatLong;

__kernel void A(__global LatLong* a, __global float* b, const int c, const float d, const float e) {
  int f = get_global_id(0);

  if (f < c) {
    __global LatLong* g = a + f;

    __global float* h = b + f;
    *h = (float)sqrt((d - g->lat) * (d - g->lat) + (e - g->lng) * (e - g->lng));
  }
}