__kernel void A(__global double* a, int b, const double c) {
  for (int d = get_global_id(0); d < b; d += get_global_size(0)) {
    a[d] *= c;
  }
}

__kernel void B(__global double* a, int b, const double c) {
  for (int d = get_global_id(0); d < b; d += get_global_size(0)) {
    a[d] -= c;
  }
}

__kernel void C(__global double* a, int b, const double c) {
  for (int d = get_global_id(0); d < b; d += get_global_size(0)) {
    a[d] = c;
  }
}

__kernel void D(__global double* a, __global double* b, __global double* c, int d, int e) {
  for (int f = get_global_id(0); f < d; f += get_global_size(0)) {
    for (int g = get_global_id(1); g < e; g += get_global_size(1)) {
      int h = f * e;
      double i = 0;
      for (int j = 0; j < e; j++) {
        i += a[h + j] * b[j * e + g];
      }

      c[f * e + g] = i;
    }
  }
}