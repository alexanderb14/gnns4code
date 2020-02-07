typedef struct latLong {
  float lat;
  float lng;
} LatLong;

__kernel void A(__global LatLong* a, __global float* b, const int c, const float d, const float e) {
  int f;

  for (f = 0; f < c; f++) {
    b[f] = (float)sqrt((d - a[f].lat) * (d - a[f].lat) + (e - a[f].lng) * (e - a[f].lng));
  }
}