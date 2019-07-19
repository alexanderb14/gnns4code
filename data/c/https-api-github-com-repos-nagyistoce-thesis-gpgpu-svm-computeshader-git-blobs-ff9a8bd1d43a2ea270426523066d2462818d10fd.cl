typedef double svm_precision; typedef struct {
  svm_precision cb_kernelParam1;
  svm_precision cb_kernelParam2;
  unsigned int cb_instanceLength;
  unsigned int cb_instanceCount;
  unsigned int cb_classIndex;
  unsigned int cb_kernel;
  svm_precision cb_param1;
  svm_precision cb_param2;
  int cb_ind1;
  int cb_ind2;
} SharedBuffer;

typedef struct {
  svm_precision s_bLow, s_bUp;
  int s_iLow, s_iUp;
} algorithmParams;

typedef struct {
  int ind1;
  int ind2;
  int ind3;
} evalStruct;

svm_precision A(svm_precision a) {
  if (a < 0) {
    return -a;
  }
  return a;
}

svm_precision B(svm_precision a, int b, int c, __global svm_precision* d, __constant SharedBuffer* e) {
  svm_precision f = -2.0 * a + d[b] + d[c];
  svm_precision g = e->cb_kernelParam1 * sqrt(f);
  return (1.0 / __clc_pow(1.0 + g * g, e->cb_kernelParam2));
}

svm_precision C(svm_precision a, int b, int c, __global svm_precision* d, __constant SharedBuffer* e) {
  return (e->cb_kernelParam1 * (2. * a - d[b] - d[c]));
}

svm_precision D(svm_precision a, int b, int c, __global svm_precision* d, __constant SharedBuffer* e) {
  if (b == c)
    return 1.0;

  if (e->cb_kernel == 0)
    return B(a, b, c, d, e);
  else if (e->cb_kernel == 1)
    return C(a, b, c, d, e);
  else
    return 1.0;
}

__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void E(__global svm_precision* a, __global unsigned int* b, __global unsigned int* c, __global svm_precision* d, __global svm_precision* e, __constant SharedBuffer* f) {
  __local evalStruct g[64];

  unsigned int h = get_global_id(0);
  unsigned int i = get_local_id(0);

  if (h >= f->cb_instanceCount)
    return;

  unsigned int j = f->cb_instanceLength;
  unsigned int k = b[h];

  g[i].ind1 = c[f->cb_ind1] * j;
  g[i].ind2 = c[f->cb_ind2] * j;
  g[i].ind3 = c[k] * j;

  svm_precision l = 0, m = 0;
  unsigned int n = 0;
  do {
    if (n != f->cb_classIndex)
      l += a[n + g[i].ind1] * a[n + g[i].ind3];
    n++;
  } while (n < j);

  n = 0;
  do {
    if (n != f->cb_classIndex)
      m += a[n + g[i].ind2] * a[n + g[i].ind3];
    n++;
  } while (n < j);

  d[h * 2] = D(l, g[i].ind1 / j, g[i].ind3 / j, e, f);
  d[(h * 2) + 1] = D(m, g[i].ind2 / j, g[i].ind3 / j, e, f);
}