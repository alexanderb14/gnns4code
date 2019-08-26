typedef unsigned char uchar; typedef unsigned short ushort; typedef unsigned int uint; typedef unsigned long ulong; typedef __typeof__(sizeof(int)) size_t; typedef __typeof__((int*)0 - (int*)0) ptrdiff_t; typedef long int intptr_t; typedef long unsigned int uintptr_t; typedef char char2 __attribute__((ext_vector_type(2))); typedef char char3 __attribute__((ext_vector_type(3))); typedef char char4 __attribute__((ext_vector_type(4))); typedef char char8 __attribute__((ext_vector_type(8))); typedef char char16 __attribute__((ext_vector_type(16))); ; typedef uchar uchar2 __attribute__((ext_vector_type(2))); typedef uchar uchar3 __attribute__((ext_vector_type(3))); typedef uchar uchar4 __attribute__((ext_vector_type(4))); typedef uchar uchar8 __attribute__((ext_vector_type(8))); typedef uchar uchar16 __attribute__((ext_vector_type(16))); ; typedef short short2 __attribute__((ext_vector_type(2))); typedef short short3 __attribute__((ext_vector_type(3))); typedef short short4 __attribute__((ext_vector_type(4))); typedef short short8 __attribute__((ext_vector_type(8))); typedef short short16 __attribute__((ext_vector_type(16))); ; typedef ushort ushort2 __attribute__((ext_vector_type(2))); typedef ushort ushort3 __attribute__((ext_vector_type(3))); typedef ushort ushort4 __attribute__((ext_vector_type(4))); typedef ushort ushort8 __attribute__((ext_vector_type(8))); typedef ushort ushort16 __attribute__((ext_vector_type(16))); ; typedef int int2 __attribute__((ext_vector_type(2))); typedef int int3 __attribute__((ext_vector_type(3))); typedef int int4 __attribute__((ext_vector_type(4))); typedef int int8 __attribute__((ext_vector_type(8))); typedef int int16 __attribute__((ext_vector_type(16))); ; typedef uint uint2 __attribute__((ext_vector_type(2))); typedef uint uint3 __attribute__((ext_vector_type(3))); typedef uint uint4 __attribute__((ext_vector_type(4))); typedef uint uint8 __attribute__((ext_vector_type(8))); typedef uint uint16 __attribute__((ext_vector_type(16))); ; typedef long long2 __attribute__((ext_vector_type(2))); typedef long long3 __attribute__((ext_vector_type(3))); typedef long long4 __attribute__((ext_vector_type(4))); typedef long long8 __attribute__((ext_vector_type(8))); typedef long long16 __attribute__((ext_vector_type(16))); ; typedef ulong ulong2 __attribute__((ext_vector_type(2))); typedef ulong ulong3 __attribute__((ext_vector_type(3))); typedef ulong ulong4 __attribute__((ext_vector_type(4))); typedef ulong ulong8 __attribute__((ext_vector_type(8))); typedef ulong ulong16 __attribute__((ext_vector_type(16))); ; typedef float float2 __attribute__((ext_vector_type(2))); typedef float float3 __attribute__((ext_vector_type(3))); typedef float float4 __attribute__((ext_vector_type(4))); typedef float float8 __attribute__((ext_vector_type(8))); typedef float float16 __attribute__((ext_vector_type(16))); ; typedef double double2 __attribute__((ext_vector_type(2))); typedef double double3 __attribute__((ext_vector_type(3))); typedef double double4 __attribute__((ext_vector_type(4))); typedef double double8 __attribute__((ext_vector_type(8))); typedef double double16 __attribute__((ext_vector_type(16))); ; typedef half half2 __attribute__((ext_vector_type(2))); typedef half half3 __attribute__((ext_vector_type(3))); typedef half half4 __attribute__((ext_vector_type(4))); typedef half half8 __attribute__((ext_vector_type(8))); typedef half half16 __attribute__((ext_vector_type(16))); ; typedef uint cl_mem_fence_flags; typedef enum { memory_order_relaxed, memory_order_acquire, memory_order_release, memory_order_acq_rel, memory_order_seq_cst } memory_order;

typedef enum {
  memory_scope_work_item,
  memory_scope_work_group,
  memory_scope_device,
  memory_scope_all_svm_devices,
  memory_scope_sub_group,
} memory_scope;
int A(int a);
int B(int a);

__attribute__((overloadable)) int C(int a, size_t b);
__attribute__((overloadable)) uint C(uint a, size_t b);
__attribute__((overloadable)) long C(long a, size_t b);
__attribute__((overloadable)) ulong C(ulong a, size_t b);
__attribute__((overloadable)) float C(float a, size_t b);
__attribute__((overloadable)) double C(double a, size_t b);

__attribute__((overloadable)) int C(int a, size_t c, size_t d);
__attribute__((overloadable)) uint C(uint a, size_t c, size_t d);
__attribute__((overloadable)) long C(long a, size_t c, size_t d);
__attribute__((overloadable)) ulong C(ulong a, size_t c, size_t d);
__attribute__((overloadable)) float C(float a, size_t c, size_t d);
__attribute__((overloadable)) double C(double a, size_t c, size_t d);

__attribute__((overloadable)) int C(int a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) uint C(uint a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) long C(long a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) ulong C(ulong a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) float C(float a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) double C(double a, size_t c, size_t d, size_t e);

__attribute__((overloadable)) int D(int a);
__attribute__((overloadable)) uint D(uint a);
__attribute__((overloadable)) long D(long a);
__attribute__((overloadable)) ulong D(ulong a);
__attribute__((overloadable)) float D(float a);
__attribute__((overloadable)) double D(double a);

__attribute__((overloadable)) int E(int a);
__attribute__((overloadable)) uint E(uint a);
__attribute__((overloadable)) long E(long a);
__attribute__((overloadable)) ulong E(ulong a);
__attribute__((overloadable)) float E(float a);
__attribute__((overloadable)) double E(double a);

__attribute__((overloadable)) int F(int a);
__attribute__((overloadable)) uint F(uint a);
__attribute__((overloadable)) long F(long a);
__attribute__((overloadable)) ulong F(ulong a);
__attribute__((overloadable)) float F(float a);
__attribute__((overloadable)) double F(double a);

__attribute__((overloadable)) int G(int a);
__attribute__((overloadable)) uint G(uint a);
__attribute__((overloadable)) long G(long a);
__attribute__((overloadable)) ulong G(ulong a);
__attribute__((overloadable)) float G(float a);
__attribute__((overloadable)) double G(double a);

__attribute__((overloadable)) int H(int a);
__attribute__((overloadable)) uint H(uint a);
__attribute__((overloadable)) long H(long a);
__attribute__((overloadable)) ulong H(ulong a);
__attribute__((overloadable)) float H(float a);
__attribute__((overloadable)) double H(double a);

__attribute__((overloadable)) int I(int a);
__attribute__((overloadable)) uint I(uint a);
__attribute__((overloadable)) long I(long a);
__attribute__((overloadable)) ulong I(ulong a);
__attribute__((overloadable)) float I(float a);
__attribute__((overloadable)) double I(double a);

__attribute__((overloadable)) int J(int a);
__attribute__((overloadable)) uint J(uint a);
__attribute__((overloadable)) long J(long a);
__attribute__((overloadable)) ulong J(ulong a);
__attribute__((overloadable)) float J(float a);
__attribute__((overloadable)) double J(double a);

__attribute__((overloadable)) int K(int a);
__attribute__((overloadable)) uint K(uint a);
__attribute__((overloadable)) long K(long a);
__attribute__((overloadable)) ulong K(ulong a);
__attribute__((overloadable)) float K(float a);
__attribute__((overloadable)) double K(double a);

__attribute__((overloadable)) int L(int a);
__attribute__((overloadable)) uint L(uint a);
__attribute__((overloadable)) long L(long a);
__attribute__((overloadable)) ulong L(ulong a);
__attribute__((overloadable)) float L(float a);
__attribute__((overloadable)) double L(double a);

int M(int);
int A(int a) {
  return M(a);
}

int N(int);
int B(int a) {
  return N(a);
}
__attribute__((overloadable)) int O(int a, size_t b);
__attribute__((overloadable)) int C(int a, size_t b) {
  return O(a, b);
}
__attribute__((overloadable)) int O(int a, size_t c, size_t d);
__attribute__((overloadable)) int C(int a, size_t c, size_t d) {
  return O(a, c, d);
}
__attribute__((overloadable)) int O(int a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) int C(int a, size_t c, size_t d, size_t e) {
  return O(a, c, d, e);
}
__attribute__((overloadable)) uint O(uint a, size_t b);
__attribute__((overloadable)) uint C(uint a, size_t b) {
  return O(a, b);
}
__attribute__((overloadable)) uint O(uint a, size_t c, size_t d);
__attribute__((overloadable)) uint C(uint a, size_t c, size_t d) {
  return O(a, c, d);
}
__attribute__((overloadable)) uint O(uint a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) uint C(uint a, size_t c, size_t d, size_t e) {
  return O(a, c, d, e);
}
__attribute__((overloadable)) long O(long a, size_t b);
__attribute__((overloadable)) long C(long a, size_t b) {
  return O(a, b);
}
__attribute__((overloadable)) long O(long a, size_t c, size_t d);
__attribute__((overloadable)) long C(long a, size_t c, size_t d) {
  return O(a, c, d);
}
__attribute__((overloadable)) long O(long a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) long C(long a, size_t c, size_t d, size_t e) {
  return O(a, c, d, e);
}
__attribute__((overloadable)) ulong O(ulong a, size_t b);
__attribute__((overloadable)) ulong C(ulong a, size_t b) {
  return O(a, b);
}
__attribute__((overloadable)) ulong O(ulong a, size_t c, size_t d);
__attribute__((overloadable)) ulong C(ulong a, size_t c, size_t d) {
  return O(a, c, d);
}
__attribute__((overloadable)) ulong O(ulong a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) ulong C(ulong a, size_t c, size_t d, size_t e) {
  return O(a, c, d, e);
}
__attribute__((overloadable)) float O(float a, size_t b);
__attribute__((overloadable)) float C(float a, size_t b) {
  return O(a, b);
}
__attribute__((overloadable)) float O(float a, size_t c, size_t d);
__attribute__((overloadable)) float C(float a, size_t c, size_t d) {
  return O(a, c, d);
}
__attribute__((overloadable)) float O(float a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) float C(float a, size_t c, size_t d, size_t e) {
  return O(a, c, d, e);
}
__attribute__((overloadable)) double O(double a, size_t b);
__attribute__((overloadable)) double C(double a, size_t b) {
  return O(a, b);
}
__attribute__((overloadable)) double O(double a, size_t c, size_t d);
__attribute__((overloadable)) double C(double a, size_t c, size_t d) {
  return O(a, c, d);
}
__attribute__((overloadable)) double O(double a, size_t c, size_t d, size_t e);
__attribute__((overloadable)) double C(double a, size_t c, size_t d, size_t e) {
  return O(a, c, d, e);
}
__attribute__((overloadable)) int P(bool a, int b);
__attribute__((overloadable)) int D(int a) {
  return P(true, a);
}
__attribute__((overloadable)) uint P(bool a, uint b);
__attribute__((overloadable)) uint D(uint a) {
  return P(false, a);
}
__attribute__((overloadable)) long P(bool a, long b);
__attribute__((overloadable)) long D(long a) {
  return P(true, a);
}
__attribute__((overloadable)) ulong P(bool a, ulong b);
__attribute__((overloadable)) ulong D(ulong a) {
  return P(false, a);
}
__attribute__((overloadable)) float P(bool a, float b);
__attribute__((overloadable)) float D(float a) {
  return P(true, a);
}
__attribute__((overloadable)) double P(bool a, double b);
__attribute__((overloadable)) double D(double a) {
  return P(true, a);
}

__attribute__((overloadable)) int Q(bool a, int b);
__attribute__((overloadable)) int E(int a) {
  return Q(true, a);
}
__attribute__((overloadable)) uint Q(bool a, uint b);
__attribute__((overloadable)) uint E(uint a) {
  return Q(false, a);
}
__attribute__((overloadable)) long Q(bool a, long b);
__attribute__((overloadable)) long E(long a) {
  return Q(true, a);
}
__attribute__((overloadable)) ulong Q(bool a, ulong b);
__attribute__((overloadable)) ulong E(ulong a) {
  return Q(false, a);
}
__attribute__((overloadable)) float Q(bool a, float b);
__attribute__((overloadable)) float E(float a) {
  return Q(true, a);
}
__attribute__((overloadable)) double Q(bool a, double b);
__attribute__((overloadable)) double E(double a) {
  return Q(true, a);
}

__attribute__((overloadable)) int R(bool a, int b);
__attribute__((overloadable)) int F(int a) {
  return R(true, a);
}
__attribute__((overloadable)) uint R(bool a, uint b);
__attribute__((overloadable)) uint F(uint a) {
  return R(false, a);
}
__attribute__((overloadable)) long R(bool a, long b);
__attribute__((overloadable)) long F(long a) {
  return R(true, a);
}
__attribute__((overloadable)) ulong R(bool a, ulong b);
__attribute__((overloadable)) ulong F(ulong a) {
  return R(false, a);
}
__attribute__((overloadable)) float R(bool a, float b);
__attribute__((overloadable)) float F(float a) {
  return R(true, a);
}
__attribute__((overloadable)) double R(bool a, double b);
__attribute__((overloadable)) double F(double a) {
  return R(true, a);
}

__attribute__((overloadable)) int S(bool a, int b);
__attribute__((overloadable)) int G(int a) {
  return S(true, a);
}
__attribute__((overloadable)) uint S(bool a, uint b);
__attribute__((overloadable)) uint G(uint a) {
  return S(false, a);
}
__attribute__((overloadable)) long S(bool a, long b);
__attribute__((overloadable)) long G(long a) {
  return S(true, a);
}
__attribute__((overloadable)) ulong S(bool a, ulong b);
__attribute__((overloadable)) ulong G(ulong a) {
  return S(false, a);
}
__attribute__((overloadable)) float S(bool a, float b);
__attribute__((overloadable)) float G(float a) {
  return S(true, a);
}
__attribute__((overloadable)) double S(bool a, double b);
__attribute__((overloadable)) double G(double a) {
  return S(true, a);
}

__attribute__((overloadable)) int T(bool a, int b);
__attribute__((overloadable)) int H(int a) {
  return T(true, a);
}
__attribute__((overloadable)) uint T(bool a, uint b);
__attribute__((overloadable)) uint H(uint a) {
  return T(false, a);
}
__attribute__((overloadable)) long T(bool a, long b);
__attribute__((overloadable)) long H(long a) {
  return T(true, a);
}
__attribute__((overloadable)) ulong T(bool a, ulong b);
__attribute__((overloadable)) ulong H(ulong a) {
  return T(false, a);
}
__attribute__((overloadable)) float T(bool a, float b);
__attribute__((overloadable)) float H(float a) {
  return T(true, a);
}
__attribute__((overloadable)) double T(bool a, double b);
__attribute__((overloadable)) double H(double a) {
  return T(true, a);
}

__attribute__((overloadable)) int U(bool a, int b);
__attribute__((overloadable)) int I(int a) {
  return U(true, a);
}
__attribute__((overloadable)) uint U(bool a, uint b);
__attribute__((overloadable)) uint I(uint a) {
  return U(false, a);
}
__attribute__((overloadable)) long U(bool a, long b);
__attribute__((overloadable)) long I(long a) {
  return U(true, a);
}
__attribute__((overloadable)) ulong U(bool a, ulong b);
__attribute__((overloadable)) ulong I(ulong a) {
  return U(false, a);
}
__attribute__((overloadable)) float U(bool a, float b);
__attribute__((overloadable)) float I(float a) {
  return U(true, a);
}
__attribute__((overloadable)) double U(bool a, double b);
__attribute__((overloadable)) double I(double a) {
  return U(true, a);
}

__attribute__((overloadable)) int V(bool a, int b);
__attribute__((overloadable)) int J(int a) {
  return V(true, a);
}
__attribute__((overloadable)) uint V(bool a, uint b);
__attribute__((overloadable)) uint J(uint a) {
  return V(false, a);
}
__attribute__((overloadable)) long V(bool a, long b);
__attribute__((overloadable)) long J(long a) {
  return V(true, a);
}
__attribute__((overloadable)) ulong V(bool a, ulong b);
__attribute__((overloadable)) ulong J(ulong a) {
  return V(false, a);
}
__attribute__((overloadable)) float V(bool a, float b);
__attribute__((overloadable)) float J(float a) {
  return V(true, a);
}
__attribute__((overloadable)) double V(bool a, double b);
__attribute__((overloadable)) double J(double a) {
  return V(true, a);
}

__attribute__((overloadable)) int W(bool a, int b);
__attribute__((overloadable)) int K(int a) {
  return W(true, a);
}
__attribute__((overloadable)) uint W(bool a, uint b);
__attribute__((overloadable)) uint K(uint a) {
  return W(false, a);
}
__attribute__((overloadable)) long W(bool a, long b);
__attribute__((overloadable)) long K(long a) {
  return W(true, a);
}
__attribute__((overloadable)) ulong W(bool a, ulong b);
__attribute__((overloadable)) ulong K(ulong a) {
  return W(false, a);
}
__attribute__((overloadable)) float W(bool a, float b);
__attribute__((overloadable)) float K(float a) {
  return W(true, a);
}
__attribute__((overloadable)) double W(bool a, double b);
__attribute__((overloadable)) double K(double a) {
  return W(true, a);
}

__attribute__((overloadable)) int X(bool a, int b);
__attribute__((overloadable)) int L(int a) {
  return X(true, a);
}
__attribute__((overloadable)) uint X(bool a, uint b);
__attribute__((overloadable)) uint L(uint a) {
  return X(false, a);
}
__attribute__((overloadable)) long X(bool a, long b);
__attribute__((overloadable)) long L(long a) {
  return X(true, a);
}
__attribute__((overloadable)) ulong X(bool a, ulong b);
__attribute__((overloadable)) ulong L(ulong a) {
  return X(false, a);
}
__attribute__((overloadable)) float X(bool a, float b);
__attribute__((overloadable)) float L(float a) {
  return X(true, a);
}
__attribute__((overloadable)) double X(bool a, double b);
__attribute__((overloadable)) double L(double a) {
  return X(true, a);
}