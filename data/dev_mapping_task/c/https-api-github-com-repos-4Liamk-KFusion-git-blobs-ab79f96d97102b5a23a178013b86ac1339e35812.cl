void A(__local double* a) {
  for (unsigned int b = get_local_size(0) / 2; b > 0; b /= 2) {
    barrier(1);
    if (get_local_id(0) < b)
      a[get_local_id(0)] += a[get_local_id(0) + b];
  }
}

void B(__local double* a, int b) {
  for (unsigned int c = b / 2; c > 0; c /= 2) {
    barrier(1);
    if (get_local_id(0) < c)
      a[get_local_id(0)] += a[get_local_id(0) + c];
  }
}

__kernel void C(__global double* a, __global double* b, const int c) {
  __local double d[256];
  d[get_local_id(0)] = (get_local_id(0) < c) ? a[get_local_id(0)] : 0;
  A(d);
  if (get_local_id(0) == 0)
    b[0] = d[0];
}

__kernel void D(__global double* a, const double b, __global double* c, const double d, __global double* e) {
  int f = get_global_id(0);

  double g = c[f];

  double h = e[f];
  double i;

  i = g * h;

  a[f] = i;
}

__kernel void E(__global double* a, __global double* b) {
  int c = get_global_id(0);

  double d = b[c];

  double e;

  e = sqrt(d);

  a[c] = e;
}

__kernel void F(__global double* a, const double b, __global double* c, const double d, __global double* e) {
  int f = get_global_id(0);

  double g = c[f];

  double h = e[f];

  double i;

  i = b * g + d * h;

  a[f] = i;
}

__kernel void G(__global double* a, __global double* b, __global double* c, const int d) {
  __local double e;

  int f = get_global_id(0);

  int g = get_global_size(0);

  double h = c[0] * b[f];

  for (int i = 1; i < d; i++) {
    e = c[i];
    h += e * b[i * g + f];
  }

  a[f] = h;
}
__kernel void H(__global double* a, __global double* b, __global double* c) {
  __local double d[256];
  int e = get_global_id(0);
  int f = get_local_id(0);
  int g = get_group_id(0);
  double h = a[e];
  double i = b[e];
  d[f] = h * i;

  A(d);
  barrier(1);

  if (f == 0)
    c[g] = d[0];
}

__kernel void I(__global int* a, __global double* b, __global int* c, __global double* d, __global double* e) {
  __local int f[256 + 1];

  event_t g = async_work_group_copy(f, &c[get_group_id(0) * get_local_size(0)], get_local_size(0) + 1, 0);

  int h = get_global_id(0);
  int i = get_local_id(0);

  double j = 0;
  wait_group_events(1, &g);

  for (int k = f[i]; k < f[i + 1]; k++) {
    j += b[k] * d[a[k]];
  }
  e[h] = j;
}