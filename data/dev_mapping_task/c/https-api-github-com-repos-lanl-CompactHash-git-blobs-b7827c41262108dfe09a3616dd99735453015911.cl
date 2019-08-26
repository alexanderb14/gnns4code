int A(__global char* a, int b, int c); int B(__global char* a, int b, int c); int C(__global char* a, int b, int c); int D(__global char* a, unsigned int b, __global int* c, __global int* d); int E(__global char* a, int b, __global int* c); int F(__global char* a, unsigned int b, __global int* c, __global int* d); int G(__global char* a, int b, int c); int H(__global char* a, unsigned int b, __global int* c, __global int* d); int I(__global char* a, int b, __global int* c); int I(__global char* a, int b, __global int* c); int J(__global char* a, size_t b, __global int* c, __global int* d); int K(__global char* a, size_t b, __global int* c, __global int* d); int L(__global char* a, int b, int c); int M(__global char* a, size_t b, __global int* c, __global int* d); int N(__global char* a, unsigned int b, __global int* c, __global int* d); int O(__global char* a, int b, __global int* c); int P(__global char* a, unsigned int b, __global int* c, __global int* d); int Q(__global char* a, int b, int c); int R(__global char* a, unsigned int b, __global int* c, __global int* d); int S(__global char* a, int b, int c); int T(__global char* a, int b, __global int* c); int U(__global char* a, size_t b, __global int* c, __global int* d); int V(__global char* a, int b, int c); int W(__global char* a, size_t b, __global int* c, __global int* d); int X(__global char* a, int b, int c); int Y(__global char* a, size_t b, __global int* c, __global int* d); int Z(__global char* a, int b, __global int* c); int AA(__global char* a, int b, __global int* c); int AB(__global char* a, size_t b, __global int* c, __global int* d); int AC(__global char* a, int b, int c); int AD(__global char* a, size_t b, __global int* c, __global int* d); int AE(__global char* a, int b, int c); int AF(__global char* a, size_t b, __global int* c, __global int* d); int AG(__global char* a, unsigned int b, __global int* c, __global int* d); int AH(__global char* a, unsigned int b, __global int* c, __global int* d); int AI(__global char* a, int b, int c); int AJ(__global char* a, int b, int c); int AK(__global char* a, unsigned int b, __global int* c, __global int* d); int AL(__global char* a, int b, __global int* c); int AM(__global char* a, unsigned int b, __global int* c, __global int* d); int AN(__global char* a, int b, int c); int AO(__global char* a, unsigned int b, __global int* c, __global int* d); int AP(__global char* a, int b, int c); int AQ(__global char* a, unsigned int b, __global int* c, __global int* d); int AR(__global char* a, int b, __global int* c); int AS(__global char* a, size_t b, __global int* c, __global int* d); int AT(__global char* a, int b, int c); int AU(__global char* a, size_t b, __global int* c, __global int* d); int AV(__global char* a, int b, int c); int AW(__global char* a, size_t b, __global int* c, __global int* d); int AX(__global char* a, unsigned int b, __global int* c, __global int* d); int AY(__global char* a, int b, __global int* c); int AZ(__global char* a, unsigned int b, __global int* c, __global int* d); int BA(__global char* a, unsigned int b, __global int* c, __global int* d); int BB(__global char* a, int b, int c); inline unsigned int BC(char a, int b) {
  return b;
}

typedef struct intintHash_CompressLCGData {
  long unsigned int a;
  long unsigned int c;
  unsigned int m;
  unsigned int n;
} intintHash_CompressLCGData;
inline unsigned int BD(intintHash_CompressLCGData a, int b) {
  return ((a.a * b + a.c) % a.m) % a.n;
}

typedef struct intintIdentityPerfectCLHash_TableData {
  int hashID;
  unsigned int numBuckets;
  char compressFuncData;
} intintIdentityPerfectCLHash_TableData;
typedef struct intintIdentityPerfectCLHash_Bucket {
  int key;
  int value;
} intintIdentityPerfectCLHash_Bucket;
int E(__global char* a, int b, __global int* c) {
  __global intintIdentityPerfectCLHash_Bucket* d = (__global intintIdentityPerfectCLHash_Bucket*)&a[sizeof(intintIdentityPerfectCLHash_TableData)];
  int e;
  int f;
  e = BC(((__global intintIdentityPerfectCLHash_TableData*)a)->compressFuncData, b);
  if ((d[e].key) != -1) {
    if (b == d[e].key) {
      f = 0;
    } else {
      f = 1;
    }
  } else {
    f = 2;
  }
  switch (f) {
    case 0:
      *c = d[e].value;
      return -1;
    case 1:
    case 2:
      return -4;
    default:
      return f;
  }
}
int D(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintIdentityPerfectCLHash_Bucket* e = (__global intintIdentityPerfectCLHash_Bucket*)&a[sizeof(intintIdentityPerfectCLHash_TableData)];
  int f;
  __global int* g;
  int h;
  int i;
  uint j;
  int k = -1;
  for (j = 0; j < b; j++) {
    f = c[j];
    g = &d[j];
    h = BC(((__global intintIdentityPerfectCLHash_TableData*)a)->compressFuncData, f);
    if ((e[h].key) != -1) {
      if (f == e[h].key) {
        i = 0;
      } else {
        i = 1;
      }
    } else {
      i = 2;
    }
    switch (i) {
      case 0:
        *g = e[h].value;
        break;
      case 1:
      case 2:
        k = -4;
        break;
      default:
        return i;
    }
  }
  return k;
}
int B(__global char* a, int b, int c) {
  __global intintIdentityPerfectCLHash_Bucket* d = (__global intintIdentityPerfectCLHash_Bucket*)&a[sizeof(intintIdentityPerfectCLHash_TableData)];
  int e;
  int f;
  e = BC(((__global intintIdentityPerfectCLHash_TableData*)a)->compressFuncData, b);
  if (((d[e].key == -1) ? (d[e].key = b, -1) : d[e].key) != -1) {
    if (b == d[e].key) {
      f = 0;
    } else {
      f = 1;
    }
  } else {
    f = 2;
  }
  switch (f) {
    case 0:
    case 1:
      d[e].value = c;
      return -3;
    case 2:
      d[e].value = c;
      return -1;
    default:
      return f;
  }
}
int F(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintIdentityPerfectCLHash_Bucket* e = (__global intintIdentityPerfectCLHash_Bucket*)&a[sizeof(intintIdentityPerfectCLHash_TableData)];
  int f = -1;
  int g;
  int h;
  int i;
  uint j;
  ;
  for (j = 0; j < b; j++) {
    g = c[j];
    h = BC(((__global intintIdentityPerfectCLHash_TableData*)a)->compressFuncData, g);
    if (((e[h].key == -1) ? (e[h].key = g, -1) : e[h].key) != -1) {
      if (g == e[h].key) {
        i = 0;
      } else {
        i = 1;
      }
    } else {
      i = 2;
    }
    switch (i) {
      case 0:
      case 1:
        f = -3;
      case 2:
        e[h].value = d[j];
        break;
      default:
        f = i;
    }
  }
  return f;
}
int G(__global char* a, int b, int c) {
  __global intintIdentityPerfectCLHash_Bucket* d = (__global intintIdentityPerfectCLHash_Bucket*)&a[sizeof(intintIdentityPerfectCLHash_TableData)];
  int e;
  int f;
  e = BC(((__global intintIdentityPerfectCLHash_TableData*)a)->compressFuncData, b);
  if (((d[e].key == -1) ? (d[e].key = b, -1) : d[e].key) != -1) {
    if (b == d[e].key) {
      f = 0;
    } else {
      f = 1;
    }
  } else {
    f = 2;
  }
  switch (f) {
    case 0:
    case 1:
      return -3;
    case 2:
      d[e].value = c;
      return -1;
    default:
      return f;
  }
}
int H(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintIdentityPerfectCLHash_Bucket* e = (__global intintIdentityPerfectCLHash_Bucket*)&a[sizeof(intintIdentityPerfectCLHash_TableData)];
  int f = -1;
  int g;
  int h;
  int i;
  uint j;
  ;
  for (j = 0; j < b; j++) {
    g = c[j];
    h = BC(((__global intintIdentityPerfectCLHash_TableData*)a)->compressFuncData, g);
    if (((e[h].key == -1) ? (e[h].key = g, -1) : e[h].key) != -1) {
      if (g == e[h].key) {
        i = 0;
      } else {
        i = 1;
      }
    } else {
      i = 2;
    }
    switch (i) {
      case 0:
      case 1:
        f = -3;
        break;
      case 2:
        e[h].value = d[j];
        break;
      default:
        f = i;
    }
  }
  return f;
}
int I(__global char* a, int b, __global int* c) {
  return E(a, b, c);
}
int J(__global char* a, size_t b, __global int* c, __global int* d) {
  return D(a, b, c, d);
}
int A(__global char* a, int b, int c) {
  return B(a, b, c);
}
int K(__global char* a, size_t b, __global int* c, __global int* d) {
  return F(a, b, c, d);
}
int L(__global char* a, int b, int c) {
  return G(a, b, c);
}
int M(__global char* a, size_t b, __global int* c, __global int* d) {
  return H(a, b, c, d);
}
__kernel void BE(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  E(a, c[e], d + e);
}
__kernel void BF(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  D(a, c, d + (f * c), e + (f * c));
}
__kernel void BG(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  B(a, c[e], d[e]);
}
__kernel void BH(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  F(a, c, d + (f * c), e + (f * c));
}
__kernel void BI(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  G(a, c[e], d[e]);
}
__kernel void BJ(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  H(a, c, d + (f * c), e + (f * c));
}

typedef struct intintIdentitySentinelPerfectCLHash_TableData {
  int hashID;
  unsigned int numBuckets;
  char compressFuncData;
  int emptyValue;
} intintIdentitySentinelPerfectCLHash_TableData;
typedef struct intintIdentitySentinelPerfectCLHash_Bucket { int value; } intintIdentitySentinelPerfectCLHash_Bucket;
int O(__global char* a, int b, __global int* c) {
  __global intintIdentitySentinelPerfectCLHash_Bucket* d = (__global intintIdentitySentinelPerfectCLHash_Bucket*)&a[sizeof(intintIdentitySentinelPerfectCLHash_TableData)];
  int e;
  int f;
  e = BC(((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->compressFuncData, b);
  if (d[e].value != ((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->emptyValue) {
    f = 0;
  } else {
    f = 2;
  }
  switch (f) {
    case 0:
      *c = d[e].value;
      return -1;
    case 1:
    case 2:
      return -4;
    default:
      return f;
  }
}
int P(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintIdentitySentinelPerfectCLHash_Bucket* e = (__global intintIdentitySentinelPerfectCLHash_Bucket*)&a[sizeof(intintIdentitySentinelPerfectCLHash_TableData)];
  int f;
  __global int* g;
  int h;
  int i;
  uint j;
  int k = -1;
  for (j = 0; j < b; j++) {
    f = c[j];
    g = &d[j];
    h = BC(((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->compressFuncData, f);
    if (e[h].value != ((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->emptyValue) {
      i = 0;
    } else {
      i = 2;
    }
    switch (i) {
      case 0:
        *g = e[h].value;
        break;
      case 1:
      case 2:
        k = -4;
        break;
      default:
        return i;
    }
  }
  return k;
}
int Q(__global char* a, int b, int c) {
  __global intintIdentitySentinelPerfectCLHash_Bucket* d = (__global intintIdentitySentinelPerfectCLHash_Bucket*)&a[sizeof(intintIdentitySentinelPerfectCLHash_TableData)];
  int e;
  int f;
  e = BC(((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->compressFuncData, b);
  if (d[e].value != ((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->emptyValue) {
    f = 0;
  } else {
    f = 2;
  }
  switch (f) {
    case 0:
    case 1:
      d[e].value = c;
      return -3;
    case 2:
      d[e].value = c;
      return -1;
    default:
      return f;
  }
}
int R(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintIdentitySentinelPerfectCLHash_Bucket* e = (__global intintIdentitySentinelPerfectCLHash_Bucket*)&a[sizeof(intintIdentitySentinelPerfectCLHash_TableData)];
  int f = -1;
  int g;
  int h;
  int i;
  uint j;
  ;
  for (j = 0; j < b; j++) {
    g = c[j];
    h = BC(((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->compressFuncData, g);
    if (e[h].value != ((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->emptyValue) {
      i = 0;
    } else {
      i = 2;
    }
    switch (i) {
      case 0:
      case 1:
        f = -3;
      case 2:
        e[h].value = d[j];
        break;
      default:
        f = i;
    }
  }
  return f;
}
int S(__global char* a, int b, int c) {
  __global intintIdentitySentinelPerfectCLHash_Bucket* d = (__global intintIdentitySentinelPerfectCLHash_Bucket*)&a[sizeof(intintIdentitySentinelPerfectCLHash_TableData)];
  int e;
  int f;
  e = BC(((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->compressFuncData, b);
  if (d[e].value != ((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->emptyValue) {
    f = 0;
  } else {
    f = 2;
  }
  switch (f) {
    case 0:
    case 1:
      return -3;
    case 2:
      d[e].value = c;
      return -1;
    default:
      return f;
  }
}
int N(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintIdentitySentinelPerfectCLHash_Bucket* e = (__global intintIdentitySentinelPerfectCLHash_Bucket*)&a[sizeof(intintIdentitySentinelPerfectCLHash_TableData)];
  int f = -1;
  int g;
  int h;
  int i;
  uint j;
  ;
  for (j = 0; j < b; j++) {
    g = c[j];
    h = BC(((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->compressFuncData, g);
    if (e[h].value != ((__global intintIdentitySentinelPerfectCLHash_TableData*)a)->emptyValue) {
      i = 0;
    } else {
      i = 2;
    }
    switch (i) {
      case 0:
      case 1:
        f = -3;
        break;
      case 2:
        e[h].value = d[j];
        break;
      default:
        f = i;
    }
  }
  return f;
}
int T(__global char* a, int b, __global int* c) {
  return O(a, b, c);
}
int U(__global char* a, size_t b, __global int* c, __global int* d) {
  return P(a, b, c, d);
}
int V(__global char* a, int b, int c) {
  return Q(a, b, c);
}
int W(__global char* a, size_t b, __global int* c, __global int* d) {
  return R(a, b, c, d);
}
int X(__global char* a, int b, int c) {
  return S(a, b, c);
}
int Y(__global char* a, size_t b, __global int* c, __global int* d) {
  return N(a, b, c, d);
}
__kernel void BK(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  O(a, c[e], d + e);
}
__kernel void BL(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  P(a, c, d + (f * c), e + (f * c));
}
__kernel void BM(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  Q(a, c[e], d[e]);
}
__kernel void BN(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  R(a, c, d + (f * c), e + (f * c));
}
__kernel void BO(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  S(a, c[e], d[e]);
}
__kernel void BP(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  N(a, c, d + (f * c), e + (f * c));
}

typedef struct intintLCGLinearOpenCompactCLHash_TableData {
  int hashID;
  unsigned int numBuckets;
  intintHash_CompressLCGData compressFuncData;
} intintLCGLinearOpenCompactCLHash_TableData;
typedef struct intintLCGLinearOpenCompactCLHash_Bucket {
  int key;
  int value;
} intintLCGLinearOpenCompactCLHash_Bucket;
int Z(__global char* a, int b, __global int* c) {
  __global intintLCGLinearOpenCompactCLHash_Bucket* d = (__global intintLCGLinearOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGLinearOpenCompactCLHash_TableData)];
  int e;
  int f;
  __global intintLCGLinearOpenCompactCLHash_TableData* g = (__global intintLCGLinearOpenCompactCLHash_TableData*)a;
  intintHash_CompressLCGData h = g->compressFuncData;
  unsigned int i = BD(h, b);
  unsigned long int j = 0;
  for (;;) {
    e = ((1 * j + i) % ((__global intintLCGLinearOpenCompactCLHash_TableData*)a)->numBuckets);
    if ((d[e].key) == -1) {
      f = 2;
      break;
    } else if (b == d[e].key) {
      f = 0;
      break;
    } else if ((e == i && j > 0)) {
      f = -5;
      break;
    }
    j++;
  }
  switch (f) {
    case 0:
      *c = d[e].value;
      return -1;
    case 1:
    case 2:
      return -4;
    default:
      return f;
  }
}
int AG(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintLCGLinearOpenCompactCLHash_Bucket* e = (__global intintLCGLinearOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGLinearOpenCompactCLHash_TableData)];
  int f;
  __global int* g;
  int h;
  int i;
  uint j;
  int k = -1;
  for (j = 0; j < b; j++) {
    f = c[j];
    g = &d[j];
    __global intintLCGLinearOpenCompactCLHash_TableData* l = (__global intintLCGLinearOpenCompactCLHash_TableData*)a;
    intintHash_CompressLCGData m = l->compressFuncData;
    unsigned int n = BD(m, f);
    unsigned long int o = 0;
    for (;;) {
      h = ((1 * o + n) % ((__global intintLCGLinearOpenCompactCLHash_TableData*)a)->numBuckets);
      if ((e[h].key) == -1) {
        i = 2;
        break;
      } else if (f == e[h].key) {
        i = 0;
        break;
      } else if ((h == n && o > 0)) {
        i = -5;
        break;
      }
      o++;
    }
    switch (i) {
      case 0:
        *g = e[h].value;
        break;
      case 1:
      case 2:
        k = -4;
        break;
      default:
        return i;
    }
  }
  return k;
}
int AI(__global char* a, int b, int c) {
  __global intintLCGLinearOpenCompactCLHash_Bucket* d = (__global intintLCGLinearOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGLinearOpenCompactCLHash_TableData)];
  int e;
  int f;
  __global intintLCGLinearOpenCompactCLHash_TableData* g = (__global intintLCGLinearOpenCompactCLHash_TableData*)a;
  intintHash_CompressLCGData h = g->compressFuncData;
  unsigned int i = BD(h, b);
  unsigned long int j = 0;
  for (;;) {
    e = ((1 * j + i) % ((__global intintLCGLinearOpenCompactCLHash_TableData*)a)->numBuckets);
    if ((atomic_cmpxchg(&(d[e].key), -1, b)) == -1) {
      f = 2;
      break;
    } else if (b == d[e].key) {
      f = 0;
      break;
    } else if ((e == i && j > 0)) {
      f = -5;
      break;
    }
    j++;
  }
  switch (f) {
    case 0:
    case 1:
      d[e].value = c;
      return -3;
    case 2:
      d[e].value = c;
      return -1;
    default:
      return f;
  }
}
int AK(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintLCGLinearOpenCompactCLHash_Bucket* e = (__global intintLCGLinearOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGLinearOpenCompactCLHash_TableData)];
  int f = -1;
  int g;
  int h;
  int i;
  uint j;
  ;
  for (j = 0; j < b; j++) {
    g = c[j];
    __global intintLCGLinearOpenCompactCLHash_TableData* k = (__global intintLCGLinearOpenCompactCLHash_TableData*)a;
    intintHash_CompressLCGData l = k->compressFuncData;
    unsigned int m = BD(l, g);
    unsigned long int n = 0;
    for (;;) {
      h = ((1 * n + m) % ((__global intintLCGLinearOpenCompactCLHash_TableData*)a)->numBuckets);
      if ((atomic_cmpxchg(&(e[h].key), -1, g)) == -1) {
        i = 2;
        break;
      } else if (g == e[h].key) {
        i = 0;
        break;
      } else if ((h == m && n > 0)) {
        i = -5;
        break;
      }
      n++;
    }
    switch (i) {
      case 0:
      case 1:
        f = -3;
      case 2:
        e[h].value = d[j];
        break;
      default:
        f = i;
    }
  }
  return f;
}
int AJ(__global char* a, int b, int c) {
  __global intintLCGLinearOpenCompactCLHash_Bucket* d = (__global intintLCGLinearOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGLinearOpenCompactCLHash_TableData)];
  int e;
  int f;
  __global intintLCGLinearOpenCompactCLHash_TableData* g = (__global intintLCGLinearOpenCompactCLHash_TableData*)a;
  intintHash_CompressLCGData h = g->compressFuncData;
  unsigned int i = BD(h, b);
  unsigned long int j = 0;
  for (;;) {
    e = ((1 * j + i) % ((__global intintLCGLinearOpenCompactCLHash_TableData*)a)->numBuckets);
    if ((atomic_cmpxchg(&(d[e].key), -1, b)) == -1) {
      f = 2;
      break;
    } else if (b == d[e].key) {
      f = 0;
      break;
    } else if ((e == i && j > 0)) {
      f = -5;
      break;
    }
    j++;
  }
  switch (f) {
    case 0:
    case 1:
      return -3;
    case 2:
      d[e].value = c;
      return -1;
    default:
      return f;
  }
}
int AH(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintLCGLinearOpenCompactCLHash_Bucket* e = (__global intintLCGLinearOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGLinearOpenCompactCLHash_TableData)];
  int f = -1;
  int g;
  int h;
  int i;
  uint j;
  ;
  for (j = 0; j < b; j++) {
    g = c[j];
    __global intintLCGLinearOpenCompactCLHash_TableData* k = (__global intintLCGLinearOpenCompactCLHash_TableData*)a;
    intintHash_CompressLCGData l = k->compressFuncData;
    unsigned int m = BD(l, g);
    unsigned long int n = 0;
    for (;;) {
      h = ((1 * n + m) % ((__global intintLCGLinearOpenCompactCLHash_TableData*)a)->numBuckets);
      if ((atomic_cmpxchg(&(e[h].key), -1, g)) == -1) {
        i = 2;
        break;
      } else if (g == e[h].key) {
        i = 0;
        break;
      } else if ((h == m && n > 0)) {
        i = -5;
        break;
      }
      n++;
    }
    switch (i) {
      case 0:
      case 1:
        f = -3;
        break;
      case 2:
        e[h].value = d[j];
        break;
      default:
        f = i;
    }
  }
  return f;
}
int AA(__global char* a, int b, __global int* c) {
  return Z(a, b, c);
}
int AB(__global char* a, size_t b, __global int* c, __global int* d) {
  return AG(a, b, c, d);
}
int AC(__global char* a, int b, int c) {
  return AI(a, b, c);
}
int AD(__global char* a, size_t b, __global int* c, __global int* d) {
  return AK(a, b, c, d);
}
int AE(__global char* a, int b, int c) {
  return AJ(a, b, c);
}
int AF(__global char* a, size_t b, __global int* c, __global int* d) {
  return AH(a, b, c, d);
}
__kernel void BQ(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  Z(a, c[e], d + e);
}
__kernel void BR(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  AG(a, c, d + (f * c), e + (f * c));
}
__kernel void BS(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  AI(a, c[e], d[e]);
}
__kernel void BT(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  AK(a, c, d + (f * c), e + (f * c));
}
__kernel void BU(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  AJ(a, c[e], d[e]);
}
__kernel void BV(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  AH(a, c, d + (f * c), e + (f * c));
}

typedef struct intintLCGQuadraticOpenCompactCLHash_TableData {
  int hashID;
  unsigned int numBuckets;
  intintHash_CompressLCGData compressFuncData;
} intintLCGQuadraticOpenCompactCLHash_TableData;
typedef struct intintLCGQuadraticOpenCompactCLHash_Bucket {
  int key;
  int value;
} intintLCGQuadraticOpenCompactCLHash_Bucket;
int AL(__global char* a, int b, __global int* c) {
  __global intintLCGQuadraticOpenCompactCLHash_Bucket* d = (__global intintLCGQuadraticOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGQuadraticOpenCompactCLHash_TableData)];
  int e;
  int f;
  __global intintLCGQuadraticOpenCompactCLHash_TableData* g = (__global intintLCGQuadraticOpenCompactCLHash_TableData*)a;
  intintHash_CompressLCGData h = g->compressFuncData;
  unsigned int i = BD(h, b);
  unsigned long int j = 0;
  for (;;) {
    e = ((1 * j * j + 0 * j + i) % ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets);
    if ((d[e].key) == -1) {
      f = 2;
      break;
    } else if (b == d[e].key) {
      f = 0;
      break;
    } else if ((j > ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets)) {
      f = -5;
      break;
    }
    j++;
  }
  switch (f) {
    case 0:
      *c = d[e].value;
      return -1;
    case 1:
    case 2:
      return -4;
    default:
      return f;
  }
}
int AM(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintLCGQuadraticOpenCompactCLHash_Bucket* e = (__global intintLCGQuadraticOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGQuadraticOpenCompactCLHash_TableData)];
  int f;
  __global int* g;
  int h;
  int i;
  uint j;
  int k = -1;
  for (j = 0; j < b; j++) {
    f = c[j];
    g = &d[j];
    __global intintLCGQuadraticOpenCompactCLHash_TableData* l = (__global intintLCGQuadraticOpenCompactCLHash_TableData*)a;
    intintHash_CompressLCGData m = l->compressFuncData;
    unsigned int n = BD(m, f);
    unsigned long int o = 0;
    for (;;) {
      h = ((1 * o * o + 0 * o + n) % ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets);
      if ((e[h].key) == -1) {
        i = 2;
        break;
      } else if (f == e[h].key) {
        i = 0;
        break;
      } else if ((o > ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets)) {
        i = -5;
        break;
      }
      o++;
    }
    switch (i) {
      case 0:
        *g = e[h].value;
        break;
      case 1:
      case 2:
        k = -4;
        break;
      default:
        return i;
    }
  }
  return k;
}
int AN(__global char* a, int b, int c) {
  __global intintLCGQuadraticOpenCompactCLHash_Bucket* d = (__global intintLCGQuadraticOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGQuadraticOpenCompactCLHash_TableData)];
  int e;
  int f;
  __global intintLCGQuadraticOpenCompactCLHash_TableData* g = (__global intintLCGQuadraticOpenCompactCLHash_TableData*)a;
  intintHash_CompressLCGData h = g->compressFuncData;
  unsigned int i = BD(h, b);
  unsigned long int j = 0;
  for (;;) {
    e = ((1 * j * j + 0 * j + i) % ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets);
    if ((atomic_cmpxchg(&(d[e].key), -1, b)) == -1) {
      f = 2;
      break;
    } else if (b == d[e].key) {
      f = 0;
      break;
    } else if ((j > ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets)) {
      f = -5;
      break;
    }
    j++;
  }
  switch (f) {
    case 0:
    case 1:
      d[e].value = c;
      return -3;
    case 2:
      d[e].value = c;
      return -1;
    default:
      return f;
  }
}
int AO(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintLCGQuadraticOpenCompactCLHash_Bucket* e = (__global intintLCGQuadraticOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGQuadraticOpenCompactCLHash_TableData)];
  int f = -1;
  int g;
  int h;
  int i;
  uint j;
  ;
  for (j = 0; j < b; j++) {
    g = c[j];
    __global intintLCGQuadraticOpenCompactCLHash_TableData* k = (__global intintLCGQuadraticOpenCompactCLHash_TableData*)a;
    intintHash_CompressLCGData l = k->compressFuncData;
    unsigned int m = BD(l, g);
    unsigned long int n = 0;
    for (;;) {
      h = ((1 * n * n + 0 * n + m) % ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets);
      if ((atomic_cmpxchg(&(e[h].key), -1, g)) == -1) {
        i = 2;
        break;
      } else if (g == e[h].key) {
        i = 0;
        break;
      } else if ((n > ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets)) {
        i = -5;
        break;
      }
      n++;
    }
    switch (i) {
      case 0:
      case 1:
        f = -3;
      case 2:
        e[h].value = d[j];
        break;
      default:
        f = i;
    }
  }
  return f;
}
int AP(__global char* a, int b, int c) {
  __global intintLCGQuadraticOpenCompactCLHash_Bucket* d = (__global intintLCGQuadraticOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGQuadraticOpenCompactCLHash_TableData)];
  int e;
  int f;
  __global intintLCGQuadraticOpenCompactCLHash_TableData* g = (__global intintLCGQuadraticOpenCompactCLHash_TableData*)a;
  intintHash_CompressLCGData h = g->compressFuncData;
  unsigned int i = BD(h, b);
  unsigned long int j = 0;
  for (;;) {
    e = ((1 * j * j + 0 * j + i) % ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets);
    if ((atomic_cmpxchg(&(d[e].key), -1, b)) == -1) {
      f = 2;
      break;
    } else if (b == d[e].key) {
      f = 0;
      break;
    } else if ((j > ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets)) {
      f = -5;
      break;
    }
    j++;
  }
  switch (f) {
    case 0:
    case 1:
      return -3;
    case 2:
      d[e].value = c;
      return -1;
    default:
      return f;
  }
}
int AQ(__global char* a, unsigned int b, __global int* c, __global int* d) {
  __global intintLCGQuadraticOpenCompactCLHash_Bucket* e = (__global intintLCGQuadraticOpenCompactCLHash_Bucket*)&a[sizeof(intintLCGQuadraticOpenCompactCLHash_TableData)];
  int f = -1;
  int g;
  int h;
  int i;
  uint j;
  ;
  for (j = 0; j < b; j++) {
    g = c[j];
    __global intintLCGQuadraticOpenCompactCLHash_TableData* k = (__global intintLCGQuadraticOpenCompactCLHash_TableData*)a;
    intintHash_CompressLCGData l = k->compressFuncData;
    unsigned int m = BD(l, g);
    unsigned long int n = 0;
    for (;;) {
      h = ((1 * n * n + 0 * n + m) % ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets);
      if ((atomic_cmpxchg(&(e[h].key), -1, g)) == -1) {
        i = 2;
        break;
      } else if (g == e[h].key) {
        i = 0;
        break;
      } else if ((n > ((__global intintLCGQuadraticOpenCompactCLHash_TableData*)a)->numBuckets)) {
        i = -5;
        break;
      }
      n++;
    }
    switch (i) {
      case 0:
      case 1:
        f = -3;
        break;
      case 2:
        e[h].value = d[j];
        break;
      default:
        f = i;
    }
  }
  return f;
}
int AR(__global char* a, int b, __global int* c) {
  return AL(a, b, c);
}
int AS(__global char* a, size_t b, __global int* c, __global int* d) {
  return AM(a, b, c, d);
}
int AT(__global char* a, int b, int c) {
  return AN(a, b, c);
}
int AU(__global char* a, size_t b, __global int* c, __global int* d) {
  return AO(a, b, c, d);
}
int AV(__global char* a, int b, int c) {
  return AP(a, b, c);
}
int AW(__global char* a, size_t b, __global int* c, __global int* d) {
  return AQ(a, b, c, d);
}
__kernel void BW(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  AL(a, c[e], d + e);
}
__kernel void BX(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  AM(a, c, d + (f * c), e + (f * c));
}
__kernel void BY(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  AN(a, c[e], d[e]);
}
__kernel void BZ(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  AO(a, c, d + (f * c), e + (f * c));
}
__kernel void CA(__global char* a, unsigned int b, __global int* c, __global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  AP(a, c[e], d[e]);
}
__kernel void CB(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  uint f = get_global_id(0);
  if (f >= b) {
    return;
  }
  AQ(a, c, d + (f * c), e + (f * c));
}
__kernel void CC(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  switch (((__global int*)a)[0]) {
    case 16:
      return BF(a, b, c, d, e);
    case 32:
      return BL(a, b, c, d, e);
    case 64:
      return BR(a, b, c, d, e);
    case 128:
      return BX(a, b, c, d, e);
  }
}
__kernel void CD(__global char* a, unsigned int b, __global int* c, __global int* d) {
  switch (((__global int*)a)[0]) {
    case 16:
      return BE(a, b, c, d);
    case 32:
      return BK(a, b, c, d);
    case 64:
      return BQ(a, b, c, d);
    case 128:
      return BW(a, b, c, d);
  }
}
__kernel void CE(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  switch (((__global int*)a)[0]) {
    case 16:
      return BH(a, b, c, d, e);
    case 32:
      return BN(a, b, c, d, e);
    case 64:
      return BT(a, b, c, d, e);
    case 128:
      return BZ(a, b, c, d, e);
  }
}
__kernel void CF(__global char* a, unsigned int b, __global int* c, __global int* d) {
  switch (((__global int*)a)[0]) {
    case 16:
      return BG(a, b, c, d);
    case 32:
      return BM(a, b, c, d);
    case 64:
      return BS(a, b, c, d);
    case 128:
      return BY(a, b, c, d);
  }
}
__kernel void CG(__global char* a, unsigned int b, unsigned int c, __global int* d, __global int* e) {
  switch (((__global int*)a)[0]) {
    case 16:
      return BJ(a, b, c, d, e);
    case 32:
      return BP(a, b, c, d, e);
    case 64:
      return BV(a, b, c, d, e);
    case 128:
      return CB(a, b, c, d, e);
  }
}
__kernel void CH(__global char* a, unsigned int b, __global int* c, __global int* d) {
  switch (((__global int*)a)[0]) {
    case 16:
      return BI(a, b, c, d);
    case 32:
      return BO(a, b, c, d);
    case 64:
      return BU(a, b, c, d);
    case 128:
      return CA(a, b, c, d);
  }
}
int AX(__global char* a, unsigned int b, __global int* c, __global int* d) {
  switch (((__global int*)a)[0]) {
    case 16:
      return J(a, b, c, d);
    case 32:
      return U(a, b, c, d);
    case 64:
      return AB(a, b, c, d);
    case 128:
      return AS(a, b, c, d);
  }
  return -2;
}
int AY(__global char* a, int b, __global int* c) {
  switch (((__global int*)a)[0]) {
    case 16:
      return I(a, b, c);
    case 32:
      return T(a, b, c);
    case 64:
      return AA(a, b, c);
    case 128:
      return AR(a, b, c);
  }
  return -2;
}
int AZ(__global char* a, unsigned int b, __global int* c, __global int* d) {
  switch (((__global int*)a)[0]) {
    case 16:
      return K(a, b, c, d);
    case 32:
      return W(a, b, c, d);
    case 64:
      return AD(a, b, c, d);
    case 128:
      return AU(a, b, c, d);
  }
  return -2;
}
int C(__global char* a, int b, int c) {
  switch (((__global int*)a)[0]) {
    case 16:
      return A(a, b, c);
    case 32:
      return V(a, b, c);
    case 64:
      return AC(a, b, c);
    case 128:
      return AT(a, b, c);
  }
  return -2;
}
int BA(__global char* a, unsigned int b, __global int* c, __global int* d) {
  switch (((__global int*)a)[0]) {
    case 16:
      return M(a, b, c, d);
    case 32:
      return Y(a, b, c, d);
    case 64:
      return AF(a, b, c, d);
    case 128:
      return AW(a, b, c, d);
  }
  return -2;
}
int BB(__global char* a, int b, int c) {
  switch (((__global int*)a)[0]) {
    case 16:
      return L(a, b, c);
    case 32:
      return X(a, b, c);
    case 64:
      return AE(a, b, c);
    case 128:
      return AV(a, b, c);
  }
  return -2;
}