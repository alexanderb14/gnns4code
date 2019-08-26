typedef struct RGBcolor_struct {
  unsigned char r;
  unsigned char g;
  unsigned char b;
  unsigned char pad;
} RGBcolor;

typedef struct HSVcolor_struct {
  unsigned char h;
  unsigned char s;
  unsigned char v;
  unsigned char pad;
} HSVcolor;
kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(const __global RGBcolor* a, __global HSVcolor* b, uint c) {
  RGBcolor d;
  HSVcolor e;

  __attribute__((xcl_pipeline_loop)) rgb2hsv_loop : for (uint f = 0; f < c; f++) {
    uchar g, h, i;

    d = a[f];

    g = (((d.r) < (((((d.g) < (d.b)) ? (d.g) : (d.b))))) ? (d.r) : (((((d.g) < (d.b)) ? (d.g) : (d.b)))));
    h = (((d.r) > (((((d.g) > (d.b)) ? (d.g) : (d.b))))) ? (d.r) : (((((d.g) > (d.b)) ? (d.g) : (d.b)))));

    i = 255 * ((uint)(h - g)) / h;

    if (h == 0) {
      e.h = 0;
      e.s = 0;
      e.v = 0;
    } else if (i == 0) {
      e.h = 0;
      e.s = 0;
      e.v = h;
    } else if (h == d.r) {
      e.h = 0 + 43 * (d.g - d.b) / (h - g);
      e.s = i;
      e.v = h;
    } else if (h == d.g) {
      e.h = 85 + 43 * (d.b - d.r) / (h - g);
      e.s = i;
      e.v = h;
    } else {
      e.h = 171 + 43 * (d.r - d.g) / (h - g);
      e.s = i;
      e.v = h;
    }

    b[f] = e;
  }
}