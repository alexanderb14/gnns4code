__kernel void A(__global const float* __restrict const a, __global float* __restrict const b, const int c) {
  const int d = get_global_id(1);
  const int e = get_global_id(0);
  const int f = get_global_size(0);

  __global const float* const g = &a[e * c];
  __global const float* const h = &a[d * c];

  float i = 0.0f;
  for (int j = 0; j < c; ++j)
    i += g[j] * h[j];
  b[d * f + e] = i;
}
typedef char char1;
typedef uchar uchar1;
typedef short short1;
typedef ushort ushort1;
typedef int int1;
typedef uint uint1;
typedef long long1;
typedef ulong ulong1;
typedef float float1;

typedef double double1;
inline size_t B(void) {
  return get_local_id(1) * get_local_size(0) + get_local_id(0);
}
inline size_t C(void) {
  return get_global_id(1) * get_global_size(0) + get_global_id(0);
}

inline size_t D(const uint a) {
  return get_group_id(a) * get_local_size(a);
}

inline float E(const float a) {
  return a;
}
inline float F(const float2 a) {
  return a.x + a.y;
}
inline float G(const float4 a) {
  return dot(a, (float4)1.0f);
}
inline float H(const float8 a) {
  return G(a.hi + a.lo);
}
inline float I(const float16 a) {
  return H(a.hi + a.lo);
}
typedef float1 floatN;
__attribute__((vec_type_hint(floatN))) __attribute__((work_group_size_hint(8, 8, 1))) __kernel void J(__global const float* __restrict const a, __global float* __restrict const b, const int c) {
  __local float d[8][(1 * (8 * 8)) + 1];
  __local float e[8][(1 * (8 * 8)) + 1];

  const uint f = B() * 1;
  const uint g = D(0) * c + f;
  const uint h = D(1) * c + f;

  floatN i = (floatN)0.0f;
  for (uint j = 0; j < c; j += (1 * (8 * 8))) {
    for (uint k = 0, l = j; k < 8; ++k, l += c) {
      (((&d[k][f])))[((0))] = ((((((&a[l + g])))[((0))])));
      (((&e[k][f])))[((0))] = ((((((&a[l + h])))[((0))])));
    }
    barrier(1);

    for (uint k = 0; k < (1 * (8 * 8)); k += vec_step(i)) {
      const floatN m = (((&d[get_local_id(0)][k]))[(0)]);
      const floatN n = (((&e[get_local_id(1)][k]))[(0)]);
      i += m * n;
    }
    barrier(1);
  }
  b[C()] = E((i));
}

__attribute__((vec_type_hint(floatN))) __attribute__((work_group_size_hint(8, 8, 1))) __kernel void K(__global const float* __restrict const a, __global float* __restrict const b, const int c) {
  __local float d[8][(1 * (8 * 8)) + 1];
  __local float e[8][(1 * (8 * 8)) + 1];

  const uint f = B() * 1;
  const uint g = D(0) * c;
  const uint h = D(1) * c;
  const __global float* const i = &a[g];
  const __global float* const j = &a[h];

  floatN k = (floatN)0.0f;
  for (uint l = 0; l < c; l += (1 * (8 * 8))) {
    for (uint m = 0, n = l; m < 8; ++m, n += c) {
      (((&d[m][f])))[((0))] = ((((((&i[n + f])))[((0))])));
      (((&e[m][f])))[((0))] = ((((((&j[n + f])))[((0))])));
    }
    barrier(1);

    for (uint m = 0; m < (1 * (8 * 8)); m += vec_step(k)) {
      const floatN o = (((&d[get_local_id(0)][m]))[(0)]);
      const floatN p = (((&e[get_local_id(1)][m]))[(0)]);
      k += o * p;
    }
    barrier(1);
  }
  b[C()] = E((k));
}