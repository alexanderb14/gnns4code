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

center_set_pointer_t G(center_set_pointer_t* a, center_set_pointer_t* b) {
  center_set_pointer_t c = *b;
  *b = a[(center_set_pointer_t)c];

  return c;
}

void H(center_set_pointer_t* a, center_set_pointer_t* b, center_set_pointer_t c) {
  a[(center_set_pointer_t)c] = *b;
  *b = c;
}

void I(center_set_pointer_t* a, center_set_pointer_t* b, const center_set_pointer_t c) {
  for (center_set_pointer_t d = 0; d < c; d++) {
    a[(center_set_pointer_t)d] = d + 1;
  }
  *b = 1;
}

center_set_pointer_t J(center_set_pointer_t* a, center_set_pointer_t* b, center_set_pointer_t c, bool d, bool e, center_set_pointer_t f) {
  center_set_pointer_t g;
  if (d) {
    a[(center_set_pointer_t)c] = *b;
    if (!e) {
      g = c;
    } else {
      *b = c;
      g = f;
    }
  } else {
    if (!e) {
      g = *b;
      *b = a[(center_set_pointer_t)g];
    } else {
      g = f;
    }
  }
  return g;
}