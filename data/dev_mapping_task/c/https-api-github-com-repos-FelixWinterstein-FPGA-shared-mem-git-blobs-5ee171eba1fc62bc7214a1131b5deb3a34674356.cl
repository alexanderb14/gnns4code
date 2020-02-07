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

kdTree_t I(uint16 a) {
  kdTree_t b;

  b.count = a.s0;

  b.wgtCent.value[0] = a.s1;
  b.wgtCent.value[1] = a.s2;
  b.wgtCent.value[2] = a.s3;

  b.sum_sq = a.s4;

  b.bnd_lo.value[0] = a.s5;
  b.bnd_lo.value[1] = a.s6;
  b.bnd_lo.value[2] = a.s7;

  b.bnd_hi.value[0] = a.s8;
  b.bnd_hi.value[1] = a.s9;
  b.bnd_hi.value[2] = a.sa;

  b.left = a.sb;
  b.right = a.sc;

  return b;
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

  b.sb = a.left;
  b.sc = a.right;

  b.sd = 0;
  b.se = 0;
  b.sf = 0;

  return b;
}