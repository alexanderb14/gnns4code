typedef unsigned char uchar; typedef unsigned short ushort; typedef unsigned int uint; typedef unsigned long ulong; typedef __typeof__(sizeof(int)) size_t; typedef __typeof__((int*)0 - (int*)0) ptrdiff_t; typedef long int intptr_t; typedef long unsigned int uintptr_t; typedef char char2 __attribute__((ext_vector_type(2))); typedef char char3 __attribute__((ext_vector_type(3))); typedef char char4 __attribute__((ext_vector_type(4))); typedef char char8 __attribute__((ext_vector_type(8))); typedef char char16 __attribute__((ext_vector_type(16))); ; typedef uchar uchar2 __attribute__((ext_vector_type(2))); typedef uchar uchar3 __attribute__((ext_vector_type(3))); typedef uchar uchar4 __attribute__((ext_vector_type(4))); typedef uchar uchar8 __attribute__((ext_vector_type(8))); typedef uchar uchar16 __attribute__((ext_vector_type(16))); ; typedef short short2 __attribute__((ext_vector_type(2))); typedef short short3 __attribute__((ext_vector_type(3))); typedef short short4 __attribute__((ext_vector_type(4))); typedef short short8 __attribute__((ext_vector_type(8))); typedef short short16 __attribute__((ext_vector_type(16))); ; typedef ushort ushort2 __attribute__((ext_vector_type(2))); typedef ushort ushort3 __attribute__((ext_vector_type(3))); typedef ushort ushort4 __attribute__((ext_vector_type(4))); typedef ushort ushort8 __attribute__((ext_vector_type(8))); typedef ushort ushort16 __attribute__((ext_vector_type(16))); ; typedef int int2 __attribute__((ext_vector_type(2))); typedef int int3 __attribute__((ext_vector_type(3))); typedef int int4 __attribute__((ext_vector_type(4))); typedef int int8 __attribute__((ext_vector_type(8))); typedef int int16 __attribute__((ext_vector_type(16))); ; typedef uint uint2 __attribute__((ext_vector_type(2))); typedef uint uint3 __attribute__((ext_vector_type(3))); typedef uint uint4 __attribute__((ext_vector_type(4))); typedef uint uint8 __attribute__((ext_vector_type(8))); typedef uint uint16 __attribute__((ext_vector_type(16))); ; typedef long long2 __attribute__((ext_vector_type(2))); typedef long long3 __attribute__((ext_vector_type(3))); typedef long long4 __attribute__((ext_vector_type(4))); typedef long long8 __attribute__((ext_vector_type(8))); typedef long long16 __attribute__((ext_vector_type(16))); ; typedef ulong ulong2 __attribute__((ext_vector_type(2))); typedef ulong ulong3 __attribute__((ext_vector_type(3))); typedef ulong ulong4 __attribute__((ext_vector_type(4))); typedef ulong ulong8 __attribute__((ext_vector_type(8))); typedef ulong ulong16 __attribute__((ext_vector_type(16))); ; typedef float float2 __attribute__((ext_vector_type(2))); typedef float float3 __attribute__((ext_vector_type(3))); typedef float float4 __attribute__((ext_vector_type(4))); typedef float float8 __attribute__((ext_vector_type(8))); typedef float float16 __attribute__((ext_vector_type(16))); ; typedef double double2 __attribute__((ext_vector_type(2))); typedef double double3 __attribute__((ext_vector_type(3))); typedef double double4 __attribute__((ext_vector_type(4))); typedef double double8 __attribute__((ext_vector_type(8))); typedef double double16 __attribute__((ext_vector_type(16))); ; typedef half half2 __attribute__((ext_vector_type(2))); typedef half half3 __attribute__((ext_vector_type(3))); typedef half half4 __attribute__((ext_vector_type(4))); typedef half half8 __attribute__((ext_vector_type(8))); typedef half half16 __attribute__((ext_vector_type(16))); ; typedef uint cl_mem_fence_flags; typedef enum { memory_order_relaxed, memory_order_acquire, memory_order_release, memory_order_acq_rel, memory_order_seq_cst } memory_order;

typedef enum {
  memory_scope_work_item,
  memory_scope_work_group,
  memory_scope_device,
  memory_scope_all_svm_devices,
  memory_scope_sub_group,
} memory_scope;
__attribute__((overloadable)) uint A(void);
__attribute__((overloadable)) size_t B(uint a);
__attribute__((overloadable)) size_t C(uint a);
__attribute__((overloadable)) size_t D(uint a);
__attribute__((overloadable)) size_t E(uint a);
__attribute__((overloadable)) size_t F(uint a);
__attribute__((overloadable)) size_t G(uint a);
__attribute__((overloadable)) size_t H(uint a);
__attribute__((overloadable)) size_t I(uint a);
__attribute__((overloadable)) size_t J(void);
__attribute__((overloadable)) size_t K(void);

__attribute__((pure)) __attribute__((const)) uint L(void);
__attribute__((overloadable)) uint A(void) {
  return L();
}

__attribute__((pure)) __attribute__((const)) unsigned int M(void);
__attribute__((pure)) __attribute__((const)) unsigned int N(void);
__attribute__((pure)) __attribute__((const)) unsigned int O(void);
__attribute__((pure)) __attribute__((const)) unsigned int P(void);
__attribute__((pure)) __attribute__((const)) unsigned int Q(void);
__attribute__((pure)) __attribute__((const)) unsigned int R(void);
__attribute__((pure)) __attribute__((const)) unsigned int S(void);
__attribute__((pure)) __attribute__((const)) unsigned int T(void);
__attribute__((pure)) __attribute__((const)) unsigned int U(void);
__attribute__((pure)) __attribute__((const)) unsigned int V(void);
__attribute__((pure)) __attribute__((const)) unsigned int W(void);
__attribute__((pure)) __attribute__((const)) unsigned int X(void);
__attribute__((pure)) __attribute__((const)) unsigned int Y(void);
__attribute__((pure)) __attribute__((const)) unsigned int Z(void);
__attribute__((pure)) __attribute__((const)) unsigned int AA(void);
__attribute__((pure)) __attribute__((const)) unsigned int AB(void);
__attribute__((pure)) __attribute__((const)) unsigned int AC(void);
__attribute__((pure)) __attribute__((const)) unsigned int AD(void);
__attribute__((pure)) __attribute__((const)) unsigned int AE(void);
__attribute__((pure)) __attribute__((const)) unsigned int AF(void);
__attribute__((pure)) __attribute__((const)) unsigned int AG(void);
__attribute__((overloadable)) size_t H(unsigned int b) {
  if (b == 0)
    return M();
  else if (b == 1)
    return N();
  else if (b == 2)
    return O();
  else
    return 0;
}
__attribute__((overloadable)) size_t F(unsigned int b) {
  if (b == 0)
    return P();
  else if (b == 1)
    return Q();
  else if (b == 2)
    return R();
  else
    return 0;
}
__attribute__((overloadable)) size_t E(unsigned int b) {
  if (b == 0)
    return S();
  else if (b == 1)
    return T();
  else if (b == 2)
    return U();
  else
    return 1;
}
__attribute__((overloadable)) size_t D(unsigned int b) {
  if (b == 0)
    return V();
  else if (b == 1)
    return W();
  else if (b == 2)
    return X();
  else
    return 1;
}
__attribute__((overloadable)) size_t B(unsigned int b) {
  if (b == 0)
    return Y();
  else if (b == 1)
    return Z();
  else if (b == 2)
    return AA();
  else
    return 1;
}
__attribute__((overloadable)) size_t I(unsigned int b) {
  if (b == 0)
    return AB();
  else if (b == 1)
    return AC();
  else if (b == 2)
    return AD();
  else
    return 0;
}
__attribute__((overloadable)) size_t G(unsigned int b) {
  if (b == 0)
    return AE();
  else if (b == 1)
    return AF();
  else if (b == 2)
    return AG();
  else
    return 1;
}

__attribute__((overloadable)) size_t C(uint b) {
  return F(b) + E(b) * H(b) + I(b);
}

__attribute__((overloadable)) size_t J(void) {
  uint a = L();
  if (a == 1)
    return C(0) - I(0);
  else if (a == 2)
    return (C(1) - I(1)) * B(0) + C(0) - I(0);
  else if (a == 3)
    return ((C(2) - I(2)) * B(1) * B(0)) + ((C(1) - I(1)) * B(0)) + (C(0) - I(0));
  else
    return 0;
}

__attribute__((overloadable)) size_t K(void) {
  uint a = L();
  if (a == 1)
    return F(0);
  else if (a == 2)
    return F(1) * E(0) + F(0);
  else if (a == 3)
    return (F(2) * E(1) * D(0)) + (F(1) * E(0)) + F(0);
  else
    return 0;
}