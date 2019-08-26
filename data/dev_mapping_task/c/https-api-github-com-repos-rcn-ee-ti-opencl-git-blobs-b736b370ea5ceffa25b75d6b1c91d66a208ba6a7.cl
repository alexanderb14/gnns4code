float A(const global float* a, const local float* b, int c); kernel void B(const global float* a, const global float* b, global float* c, local float* d, int e, int f) {
  int g = get_global_id(0);
  int h = get_global_size(0);
  int i = e;
  int j = h;
  int k = f;
  int l = f;
  int m = e;
  int n, o;

  event_t p = async_work_group_strided_copy(d, &b[g], m, j, 0);
  wait_group_events(1, &p);

  for (o = 0; o < l; ++o) {
    prefetch(&a[o * i], i);
    c[o * h + g] = A(&a[o * i], d, i);
  }
}