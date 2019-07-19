__kernel void A(__global uchar* a, __global uchar* b) {
  int c = get_global_id(0);
  int d = get_global_id(1);
  int e = get_global_size(0);
  int f = get_global_size(1);
  int g, h;

  float i = 0.7;
  int j = 7;

  int k = 0;
  int l = 0;

  for (g = (d - (j - 1) / 2 > 0) ? (d - (j - 1) / 2) : 0; g < d + (j - 1) / 2 && g < f; g++) {
    for (h = (c - (j - 1) / 2 > 0) ? c - (j - 1) / 2 : 0; h < c + (j - 1) / 2 && h < e; h++) {
      l++;
      k += (convert_int(a[g * e + h]) == 255) ? 255 : 0;
    }
  }

  if (convert_float(k / l) > i * 255.0) {
    b[d * e + c] = convert_uchar(255);
  } else {
    b[d * e + c] = convert_uchar(0);
  }
}