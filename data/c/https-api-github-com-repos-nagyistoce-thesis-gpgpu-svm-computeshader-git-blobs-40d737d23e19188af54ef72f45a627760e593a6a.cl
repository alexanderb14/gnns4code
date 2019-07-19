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

__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void E(__global svm_precision* a, __global svm_precision* b, __global unsigned int* c, __global unsigned int* d, __global unsigned int* e, __global svm_precision* f, __global svm_precision* g, __global svm_precision* h, __constant SharedBuffer* i) {
  __local evalStruct j[64];
  unsigned int k = get_global_id(0);
  unsigned int l = get_local_id(0);

  if (k >= i->cb_instanceCount)
    return;

  unsigned int m = e[k];

  j[l].ind1 = c[i->cb_ind1] * i->cb_instanceLength;
  j[l].ind2 = d[m] * i->cb_instanceLength;

  svm_precision n = 0;
  unsigned int o = 0;
  do {
    if (o != i->cb_classIndex)
      n += b[o + j[l].ind1] * b[o + j[l].ind2];
    o++;
  } while (o < i->cb_instanceLength);

  a[k] = D(n, j[l].ind1 / i->cb_instanceLength, j[l].ind2 / i->cb_instanceLength, h, i) * f[m] * g[m];
}