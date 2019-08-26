struct class_Eigen__array {
  int f0[1];
};
struct Eigen__Tuple {
  int f0;
  float f1;
};
struct Eigen__DSizes {
  struct class_Eigen__array f0;
};
struct Eigen__TensorEvaluator_0 {
  global int* f0;
  struct Eigen__DSizes f1;
  global struct Eigen__GpuDevice* f2;
  global struct class_Eigen__TensorMap* f3;
};
struct Eigen__GpuDevice {
  global struct class_Eigen__StreamInterface* f0;
  int f1;
  char f2[4];
};
struct class_Eigen__TensorMap {
  global int* f0;
  struct Eigen__DSizes f1;
  char f2[4];
};
struct class_Eigen__StreamInterface {};
struct Eigen__TensorEvaluator_4 {
  global float* f0;
  struct Eigen__DSizes f1;
  global struct Eigen__GpuDevice* f2;
  global struct class_Eigen__TensorMap_5* f3;
};
struct class_Eigen__TensorMap_5 {
  global float* f0;
  struct Eigen__DSizes f1;
  char f2[4];
};
struct class_Eigen__array_nopointers {
  int f0[1];
};
struct Eigen__DSizes_nopointers {
  struct class_Eigen__array_nopointers f0;
};
struct Eigen__TensorEvaluator_0_nopointers {
  struct Eigen__DSizes_nopointers f0;
};
struct Eigen__TensorEvaluator_3 {
  struct Eigen__TensorEvaluator_4 f0;
};
struct class_Eigen__array_10 {
  char f0[1];
};
struct Eigen__Sizes {
  char f0;
};
struct Eigen__TensorEvaluator_4_nopointers {
  struct Eigen__DSizes_nopointers f0;
};
struct Eigen__TensorEvaluator_3_nopointers {
  struct Eigen__TensorEvaluator_4_nopointers f0;
};
struct class_Eigen__array_11 {
  int f0;
};
struct Eigen__internal__ArgMaxTupleReducer {
  char f0;
};
struct class_Eigen__array_10_nopointers {
  char f0[1];
};
struct Eigen__TensorEvaluator_9 {
  struct class_Eigen__array_10 f0;
  struct Eigen__Sizes f1;
  struct class_Eigen__array_11 f2;
  struct class_Eigen__array f3;
  struct class_Eigen__array f4;
  struct class_Eigen__array f5;
  struct Eigen__TensorEvaluator_3 f6;
  struct Eigen__internal__ArgMaxTupleReducer f7;
  global struct Eigen__Tuple* f8;
  global struct Eigen__GpuDevice* f9;
};
struct Eigen__Sizes_nopointers {
  char f0;
};
struct Eigen__TensorEvaluator_2 {
  struct Eigen__TensorEvaluator_3 f0;
  struct Eigen__TensorEvaluator_9 f1;
  int f2;
  struct class_Eigen__array f3;
  int f4;
  int f5;
};
struct class_Eigen__array_11_nopointers {
  int f0;
};
struct Eigen__TensorEvaluator {
  struct Eigen__TensorEvaluator_0 f0;
  struct Eigen__TensorEvaluator_2 f1;
};
struct Eigen__internal__ArgMaxTupleReducer_nopointers {
  char f0;
};
struct Eigen__TensorEvaluator_9_nopointers {
  struct class_Eigen__array_10_nopointers f0;
  struct Eigen__Sizes_nopointers f1;
  struct class_Eigen__array_11_nopointers f2;
  struct class_Eigen__array_nopointers f3;
  struct class_Eigen__array_nopointers f4;
  struct class_Eigen__array_nopointers f5;
  struct Eigen__TensorEvaluator_3_nopointers f6;
  struct Eigen__internal__ArgMaxTupleReducer_nopointers f7;
};
struct Eigen__TensorEvaluator_2_nopointers {
  struct Eigen__TensorEvaluator_3_nopointers f0;
  struct Eigen__TensorEvaluator_9_nopointers f1;
  int f2;
  struct class_Eigen__array_nopointers f3;
  int f4;
  int f5;
};
struct Eigen__TensorEvaluator_nopointers {
  struct Eigen__TensorEvaluator_0_nopointers f0;
  struct Eigen__TensorEvaluator_2_nopointers f1;
};

kernel void A(global struct Eigen__TensorEvaluator_nopointers* a, global int* b, uint c, global float* d, uint e, global float* f, uint g, int h, local int* i);

kernel void A(global struct Eigen__TensorEvaluator_nopointers* a, global int* b, uint c, global float* d, uint e, global float* f, uint g, int h, local int* i) {
  f += g;
  d += e;
  b += c;
  struct Eigen__TensorEvaluator j[1];
  j[0].f0.f1.f0.f0[0] = a[0].f0.f0.f0.f0[0];
  j[0].f1.f0.f0.f1.f0.f0[0] = a[0].f1.f0.f0.f0.f0.f0[0];
  j[0].f1.f1.f0.f0[0] = a[0].f1.f1.f0.f0[0];
  j[0].f1.f1.f1.f0 = a[0].f1.f1.f1.f0;
  j[0].f1.f1.f2.f0 = a[0].f1.f1.f2.f0;
  j[0].f1.f1.f3.f0[0] = a[0].f1.f1.f3.f0[0];

  j[0].f1.f1.f4.f0[0] = a[0].f1.f1.f4.f0[0];
  j[0].f1.f1.f5.f0[0] = a[0].f1.f1.f5.f0[0];
  j[0].f1.f1.f6.f0.f1.f0.f0[0] = a[0].f1.f1.f6.f0.f0.f0.f0[0];
  j[0].f1.f1.f7.f0 = a[0].f1.f1.f7.f0;
  j[0].f1.f2 = a[0].f1.f2;
  j[0].f1.f3.f0[0] = a[0].f1.f3.f0[0];
  j[0].f1.f4 = a[0].f1.f4;
  j[0].f1.f5 = a[0].f1.f5;
  j[0].f0.f0 = b;
  j[0].f1.f0.f0.f0 = d;
  j[0].f1.f1.f6.f0.f0 = f;

  bool k;
  bool l;
  bool m;
  bool n;
  bool o;
  float p;
  float q;
  float r;
  float s;
  float t;
  float u;
  float v;
  float w;
  float x;
  float y;
  float z;
  float aa;
  float ab;
  global float* ac;
  global int* ad;
  global int* ae;
  global struct Eigen__Tuple* af;
  int ag;
  int ah;
  int ai;
  int aj;
  int ak;
  int al;
  int am;
  int an;
  int ao;
  int ap;
  int aq;
  int ar;
  int as;
  int at;
  int au;
  int av;
  int aw;
  int ax;
  int ay;
  int az;
  int ba;
  int bb;
  int bc;
  int bd;
  int be;
  int bf;
  int bg;
  int bh;
  int bi;
  int bj;
  int bk;
  int bl;
  int bm;
  int bn;
  int* bo;
  long bp;

  ;
  am = get_group_id(0);
  ;
  an = get_local_size(0);
  ;
  ;
  ao = get_local_id(0);
  ;
  ap = (an * am) + ao;
  ;
  aq = get_num_groups(0);
  ;
  ;

  if (ap >= h) {
    goto exit;
  }

  ;
  ;
  ;
  ;
  ;
  ;
  bo = &j[0].f1.f4;
  ;
  ;
  af = j[0].f1.f1.f8;
  ;
  ;
  ar = j[0].f1.f1.f3.f0[0];
  ;
  ;
  ac = f;
  ;
  as = j[0].f1.f2;
  ;
  ;
  ae = b;
  ;
  ;
  at = ar & 3;
  ;
  ;

  au = ap;

block3:;

  if (af == 0) {
    goto block5;
  }

  ;
  ;
  ;

  aw = af[au].f0;

  goto block15;
block5:;
  ;
  ax = ar * au;

  if (ar <= 0) {
    aw = 0;
    goto block15;
  }

  if (at == 0) {
    ay = 0;

    t = -__builtin_inff();

    az = 0;
    goto block10;
  }

  ba = 0;

  u = -__builtin_inff();

  bb = 0;

  bc = at;

block8:;
  ;
  bd = ba + ax;
  ;
  ;
  ;

  ;

  ;
  be = ac[bd] <= u ? bb : bd;
  ;
  w = ac[bd] <= u ? u : ac[bd];
  ;
  bf = ba + 1;
  ;
  bg = bc - 1;
  ;

  if (bg != 0) {
    ba = bf;

    u = w;

    bb = be;

    bc = bg;
    goto block8;
  }

  bh = be;

  ay = bf;

  t = w;

  az = be;

block10:;

  if (ar < 4) {
    bi = bh;
    goto block14;
  }

  bj = ay;

  x = t;

  bk = az;

block12:;
  ;
  bl = bj + ax;
  ;
  ;
  ;
  y = (&(ac[bl]))[0];
  ;
  n = y <= x;
  ;
  ;
  z = n ? x : y;
  ;
  ;
  bm = (bj + 1) + ax;
  ;
  ;
  ;
  aa = (&(ac[bm]))[0];
  ;
  o = aa <= z;
  ;
  ;
  ab = o ? z : aa;
  ;
  ;
  bn = (bj + 2) + ax;
  ;
  ;
  ;
  p = (&(ac[bn]))[0];
  ;
  k = p <= ab;
  ;
  ;
  q = k ? ab : p;
  ;
  ;
  ag = (bj + 3) + ax;
  ;
  ;
  ;
  r = (&(ac[ag]))[0];
  ;
  l = r <= q;
  ;
  ah = l ? (k ? (o ? (n ? bk : bl) : bm) : bn) : ag;
  ;
  s = l ? q : r;
  ;
  ai = bj + 4;
  ;

  if (ai != ar) {
    bj = ai;

    x = s;

    bk = ah;
    goto block12;
  }

  bi = ah;

block14:;

  aw = bi;

block15:;

  if (as < 0) {
    ae[0] = 12344;
    return;
    aj = aw;
    goto block17;
  }

  ;
  bp = ((long*)bo)[0];
  ;
  ;
  ;
  ;
  ;
  ak = (aw % (int)bp) / (int)(bp >> 32);

  aj = ak;

block17:;
  ;
  ;

  ;
  ae[au] = aj;
  ;
  au += (aq * an);
  ;

  if (au < h) {
    goto block3;
  }
v18:;
exit:;
  return;
}