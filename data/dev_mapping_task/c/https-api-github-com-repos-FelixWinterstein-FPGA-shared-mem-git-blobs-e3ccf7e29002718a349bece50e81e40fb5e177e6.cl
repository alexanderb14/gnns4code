typedef struct __attribute__((packed)) _svm_ret_type_uint2 {
  uint2 retval;
  uint2 status;
} svm_ret_type_uint2;

typedef struct __attribute__((packed)) _svm_ret_type_uint4 {
  uint4 retval;
  uint2 status;
} svm_ret_type_uint4;

typedef uint svm_pointer_t;

uint4 A(__global int* a, svm_pointer_t b, svm_pointer_t c);
uint4 B(__global int* a, svm_pointer_t b, svm_pointer_t c, uint d);

ulong16 C(__global int* a, svm_pointer_t b, svm_pointer_t c);

uint D(__global int* a, svm_pointer_t b, svm_pointer_t c, svm_pointer_t d, uint e);

uint E(__global int* a, uint b);
uint F(__global int* a, uint b, uint c);
typedef uchar center_index_t;

typedef uint center_set_pointer_t;

typedef int coord_type;
typedef int distance_type;

typedef struct _data_type { coord_type value[3]; } data_type;

typedef struct _kdTree_t {
  uint count;
  data_type wgtCent;
  distance_type sum_sq;
  data_type bnd_lo;
  data_type bnd_hi;
  svm_pointer_t idx;
  svm_pointer_t left;
  svm_pointer_t right;
} kdTree_t;

typedef struct _stack_t {
  svm_pointer_t u;
  center_set_pointer_t c;
  bool d;
  center_index_t k;
} stack_t;

typedef struct _centroid_t {
  data_type wgtCent;
  distance_type sum_sq;
  uint count;
} centroid_t;

data_type G(int4 a) {
  data_type b;

  b.value[0] = a.s0;
  b.value[1] = a.s1;
  b.value[2] = a.s2;

  return b;
}

int4 H(data_type a) {
  int4 b;

  b.s0 = a.value[0];
  b.s1 = a.value[1];
  b.s2 = a.value[2];
  b.s3 = 0;

  return b;
}

void I(ulong16 a, kdTree_t* b, uint16* c) {
  b->count = (a.s0 >> 0) & 0xFFFFFFFF;

  b->wgtCent.value[0] = (a.s0 >> 32) & 0xFFFFFFFF;
  b->wgtCent.value[1] = (a.s1 >> 0) & 0xFFFFFFFF;
  b->wgtCent.value[2] = (a.s1 >> 32) & 0xFFFFFFFF;

  b->sum_sq = (a.s2 >> 0) & 0xFFFFFFFF;

  b->bnd_lo.value[0] = (a.s2 >> 32) & 0xFFFFFFFF;
  b->bnd_lo.value[1] = (a.s3 >> 0) & 0xFFFFFFFF;
  b->bnd_lo.value[2] = (a.s3 >> 32) & 0xFFFFFFFF;

  b->bnd_hi.value[0] = (a.s4 >> 0) & 0xFFFFFFFF;
  b->bnd_hi.value[1] = (a.s4 >> 32) & 0xFFFFFFFF;
  b->bnd_hi.value[2] = (a.s5 >> 0) & 0xFFFFFFFF;

  b->idx = (a.s5 >> 32) & 0xFFFFFFFF;

  b->left = (a.s6 >> 0) & 0xFFFFFFFF;
  b->right = (a.s6 >> 32) & 0xFFFFFFFF;

  c->s0 = (a.s8 >> 0) & 0xFFFFFFFF;
  c->s1 = (a.s8 >> 32) & 0xFFFFFFFF;
  c->s2 = (a.s9 >> 0) & 0xFFFFFFFF;
  c->s3 = (a.s9 >> 32) & 0xFFFFFFFF;
  c->s4 = (a.sa >> 0) & 0xFFFFFFFF;
  c->s5 = (a.sa >> 32) & 0xFFFFFFFF;
  c->s6 = (a.sb >> 0) & 0xFFFFFFFF;
  c->s7 = (a.sb >> 32) & 0xFFFFFFFF;
  c->s8 = (a.sc >> 0) & 0xFFFFFFFF;
  c->s9 = (a.sc >> 32) & 0xFFFFFFFF;
  c->sa = (a.sd >> 0) & 0xFFFFFFFF;
  c->sb = (a.sd >> 32) & 0xFFFFFFFF;
  c->sc = (a.se >> 0) & 0xFFFFFFFF;
  c->sd = (a.se >> 32) & 0xFFFFFFFF;
  c->se = (a.sf >> 0) & 0xFFFFFFFF;
  c->sf = (a.sf >> 32) & 0xFFFFFFFF;
}

uint16 J(kdTree_t a) {
  uint16 b;

  b.s0 = a.count;

  b.s1 = a.wgtCent.value[0];
  b.s2 = a.wgtCent.value[1];
  b.s3 = a.wgtCent.value[2];

  b.s4 = a.sum_sq;

  b.s5 = a.bnd_lo.value[0];
  b.s6 = a.bnd_lo.value[1];
  b.s7 = a.bnd_lo.value[2];

  b.s8 = a.bnd_hi.value[0];
  b.s9 = a.bnd_hi.value[1];
  b.sa = a.bnd_hi.value[2];

  b.sb = a.idx;

  b.sc = a.left;
  b.sd = a.right;

  b.se = 0;
  b.sf = 0;

  return b;
}

kdTree_t K(__global int* a, svm_pointer_t b, svm_pointer_t c, uint16* d) {
  kdTree_t e;
  ulong16 f;
  f = C(a, b, c);

  I(f, &e, d);

  return e;
}

void L(__global int* a, svm_pointer_t b, svm_pointer_t c, kdTree_t d) {
}