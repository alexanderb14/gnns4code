__kernel void A(__global float* a, __private unsigned int b, __private float c) {
  size_t d = get_global_id(0);

  if (d < b) {
    a[d] = a[d] * c;

    if (a[d] < 0 || !isfinite(a[d]) || isnan(a[d]))
      a[d] = 0;
  }
}