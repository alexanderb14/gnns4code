__kernel void A(__global int* a) {
  int b = get_global_id(0);
  while (b < *a) {
    if (a[b] < 0) {
      if (0 >= *a)
        return;
    } else {
      if (!*a) {
        *a = 0;
      }
      for (int c = 0; c < 31; c++)
        a[c] = c;
    }
    b++;
  }
}