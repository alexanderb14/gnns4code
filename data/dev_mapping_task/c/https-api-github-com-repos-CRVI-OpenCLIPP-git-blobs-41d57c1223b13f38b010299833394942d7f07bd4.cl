__attribute__((reqd_work_group_size(8, 8, 1))) kernel void A(global const uchar* a, global float* b, int c, int d, int e, int f) {
  c /= sizeof(uchar);
  d /= sizeof(float);
  const int g = get_global_id(0) * 8;
  const int h = get_global_id(1);
  const int i = get_local_id(0) * 8;
  const int j = get_local_id(1);
  const int k = i + j * 8 * 8;

  local float l[(8 * 8) * 8];
  local float m[(8 * 8) * 8];

  float n = 0;
  for (int o = 0; o < 8; o++) {
    float p = convert_float(a[h * c + g + o]);
    n += p * p;
    l[k + o] = n;
  }

  barrier(1);

  n = 0;
  for (int q = 8 - 1; q < i; q += 8)
    n += l[j * 8 * 8 + q];

  for (int o = 0; o < 8; o++) {
    float r = n + l[k + o];
    m[k + o] = r;
  }

  barrier(1);

  const int s = g + j;

  if (s >= e)
    return;

  n = 0;
  for (int o = 0; o < 8; o++) {
    int2 t = {sget_group_id(1) * 8 + o};

    n += m[o * 8 * 8 + i + j];

    if (t.y < f)
      b[(get_group_id(1) * 8 + o) * d + s] = n;
  }
}

__attribute__((reqd_work_group_size(8, 8, 1))) kernel void B(global const uchar* a, global float* b, int c, int d, int e, int f) {
  c /= sizeof(uchar);
  d /= sizeof(float);
  const int g = get_global_id(0) * 8;
  const int h = get_global_id(1);
  const int i = get_local_id(0) * 8;
  const int j = get_local_id(1);
  const int k = i + j * 8 * 8;

  local float l[(8 * 8) * 8];
  local float m[(8 * 8) * 8];

  float n = 0;
  for (int o = 0; o < 8; o++) {
    n += convert_float(a[h * c + g + o]);
    l[k + o] = n;
  }

  barrier(1);

  n = 0;
  for (int p = 8 - 1; p < i; p += 8)
    n += l[j * 8 * 8 + p];

  for (int o = 0; o < 8; o++) {
    float q = n + l[k + o];
    m[k + o] = q;
  }

  barrier(1);

  const int r = g + j;

  if (r >= e)
    return;

  n = 0;
  for (int o = 0; o < 8; o++) {
    int2 s = {rget_group_id(1) * 8 + o};

    n += m[o * 8 * 8 + i + j];

    if (s.y < f)
      b[(get_group_id(1) * 8 + o) * d + r] = n;
  }
}

kernel void C(global float* a, global float* b, int c, int d) {
  c /= sizeof(float);
  d /= sizeof(float);

  const int e = get_global_id(0);
  const int f = get_global_id(1);

  float g = 0;
  for (int h = 0; h <= e; h++) {
    float i = a[f * c + (h + 1) * 8 * 8 - 1];
    g += i;
  }

  b[f * d + e] = g;
}

kernel void D(global float* a, global float* b, global float* c, int d, int e, int f) {
  d /= sizeof(float);
  f /= sizeof(float);
  e /= sizeof(float);

  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = (get_global_id(0) / (8 * 8)) - 1;

  if (i < 0)
    return;

  float j = b[h * e + i];

  float k = a[h * d + g];

  c[h * f + g] = k + j;
}

kernel void E(global float* a, global float* b, int c, int d) {
  c /= sizeof(float);
  d /= sizeof(float);

  const int e = get_global_id(0);
  const int f = get_global_id(1);

  float g = 0;
  for (int h = 0; h <= f; h++) {
    float i = a[((h + 1) * 8 - 1) * c + e];
    g += i;
  }

  b[f * d + e] = g;
}

kernel void F(global float* a, global float* b, global float* c, int d, int e, int f) {
  d /= sizeof(float);
  f /= sizeof(float);
  e /= sizeof(float);

  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = (get_global_id(1) / 8) - 1;

  if (i < 0)
    return;

  float j = b[i * e + g];

  float k = a[h * d + g];

  c[h * f + g] = k + j;
}

__attribute__((reqd_work_group_size(8, 8, 1))) kernel void G(global const uchar* a, global double* b, int c, int d, int e, int f) {
  c /= sizeof(uchar);
  d /= sizeof(double);
  const int g = get_global_id(0) * 8;
  const int h = get_global_id(1);
  const int i = get_local_id(0) * 8;
  const int j = get_local_id(1);
  const int k = i + j * 8 * 8;

  local double l[(8 * 8) * 8];
  local double m[(8 * 8) * 8];

  double n = 0;
  for (int o = 0; o < 8; o++) {
    double p = convert_double(a[h * c + g + o]);
    n += p * p;
    l[k + o] = n;
  }

  barrier(1);

  n = 0;
  for (int q = 8 - 1; q < i; q += 8)
    n += l[j * 8 * 8 + q];

  for (int o = 0; o < 8; o++) {
    double r = n + l[k + o];
    m[k + o] = r;
  }

  barrier(1);

  const int s = g + j;

  if (s >= e)
    return;

  n = 0;
  for (int o = 0; o < 8; o++) {
    int2 t = {sget_group_id(1) * 8 + o};

    n += m[o * 8 * 8 + i + j];

    if (t.y < f)
      b[(get_group_id(1) * 8 + o) * d + s] = n;
  }
}

__attribute__((reqd_work_group_size(8, 8, 1))) kernel void H(global const uchar* a, global double* b, int c, int d, int e, int f) {
  c /= sizeof(uchar);
  d /= sizeof(double);
  const int g = get_global_id(0) * 8;
  const int h = get_global_id(1);
  const int i = get_local_id(0) * 8;
  const int j = get_local_id(1);
  const int k = i + j * 8 * 8;

  local double l[(8 * 8) * 8];
  local double m[(8 * 8) * 8];

  double n = 0;
  for (int o = 0; o < 8; o++) {
    n += convert_double(a[h * c + g + o]);
    l[k + o] = n;
  }

  barrier(1);

  n = 0;
  for (int p = 8 - 1; p < i; p += 8)
    n += l[j * 8 * 8 + p];

  for (int o = 0; o < 8; o++) {
    double q = n + l[k + o];
    m[k + o] = q;
  }

  barrier(1);

  const int r = g + j;

  if (r >= e)
    return;

  n = 0;
  for (int o = 0; o < 8; o++) {
    int2 s = {rget_group_id(1) * 8 + o};

    n += m[o * 8 * 8 + i + j];

    if (s.y < f)
      b[(get_group_id(1) * 8 + o) * d + r] = n;
  }
}

kernel void I(global double* a, global double* b, int c, int d) {
  c /= sizeof(double);
  d /= sizeof(double);

  const int e = get_global_id(0);
  const int f = get_global_id(1);

  double g = 0;
  for (int h = 0; h <= e; h++) {
    double i = a[f * c + (h + 1) * 8 * 8 - 1];
    g += i;
  }

  b[f * d + e] = g;
}

kernel void J(global double* a, global double* b, global double* c, int d, int e, int f) {
  d /= sizeof(double);
  f /= sizeof(double);
  e /= sizeof(double);

  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = (get_global_id(0) / (8 * 8)) - 1;

  if (i < 0)
    return;

  double j = b[h * e + i];

  double k = a[h * d + g];

  c[h * f + g] = k + j;
}

kernel void K(global double* a, global double* b, int c, int d) {
  c /= sizeof(double);
  d /= sizeof(double);

  const int e = get_global_id(0);
  const int f = get_global_id(1);

  double g = 0;
  for (int h = 0; h <= f; h++) {
    double i = a[((h + 1) * 8 - 1) * c + e];
    g += i;
  }

  b[f * d + e] = g;
}

kernel void L(global double* a, global double* b, global double* c, int d, int e, int f) {
  d /= sizeof(double);
  f /= sizeof(double);
  e /= sizeof(double);

  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = (get_global_id(1) / 8) - 1;

  if (i < 0)
    return;

  double j = b[i * e + g];

  double k = a[h * d + g];

  c[h * f + g] = k + j;
}