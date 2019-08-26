typedef unsigned char uchar; typedef unsigned short ushort; typedef unsigned int uint; typedef unsigned long ulong; typedef __typeof__(sizeof(int)) size_t; typedef __typeof__((int*)0 - (int*)0) ptrdiff_t; typedef long int intptr_t; typedef long unsigned int uintptr_t; typedef char char2 __attribute__((ext_vector_type(2))); typedef char char3 __attribute__((ext_vector_type(3))); typedef char char4 __attribute__((ext_vector_type(4))); typedef char char8 __attribute__((ext_vector_type(8))); typedef char char16 __attribute__((ext_vector_type(16))); ; typedef uchar uchar2 __attribute__((ext_vector_type(2))); typedef uchar uchar3 __attribute__((ext_vector_type(3))); typedef uchar uchar4 __attribute__((ext_vector_type(4))); typedef uchar uchar8 __attribute__((ext_vector_type(8))); typedef uchar uchar16 __attribute__((ext_vector_type(16))); ; typedef short short2 __attribute__((ext_vector_type(2))); typedef short short3 __attribute__((ext_vector_type(3))); typedef short short4 __attribute__((ext_vector_type(4))); typedef short short8 __attribute__((ext_vector_type(8))); typedef short short16 __attribute__((ext_vector_type(16))); ; typedef ushort ushort2 __attribute__((ext_vector_type(2))); typedef ushort ushort3 __attribute__((ext_vector_type(3))); typedef ushort ushort4 __attribute__((ext_vector_type(4))); typedef ushort ushort8 __attribute__((ext_vector_type(8))); typedef ushort ushort16 __attribute__((ext_vector_type(16))); ; typedef int int2 __attribute__((ext_vector_type(2))); typedef int int3 __attribute__((ext_vector_type(3))); typedef int int4 __attribute__((ext_vector_type(4))); typedef int int8 __attribute__((ext_vector_type(8))); typedef int int16 __attribute__((ext_vector_type(16))); ; typedef uint uint2 __attribute__((ext_vector_type(2))); typedef uint uint3 __attribute__((ext_vector_type(3))); typedef uint uint4 __attribute__((ext_vector_type(4))); typedef uint uint8 __attribute__((ext_vector_type(8))); typedef uint uint16 __attribute__((ext_vector_type(16))); ; typedef long long2 __attribute__((ext_vector_type(2))); typedef long long3 __attribute__((ext_vector_type(3))); typedef long long4 __attribute__((ext_vector_type(4))); typedef long long8 __attribute__((ext_vector_type(8))); typedef long long16 __attribute__((ext_vector_type(16))); ; typedef ulong ulong2 __attribute__((ext_vector_type(2))); typedef ulong ulong3 __attribute__((ext_vector_type(3))); typedef ulong ulong4 __attribute__((ext_vector_type(4))); typedef ulong ulong8 __attribute__((ext_vector_type(8))); typedef ulong ulong16 __attribute__((ext_vector_type(16))); ; typedef float float2 __attribute__((ext_vector_type(2))); typedef float float3 __attribute__((ext_vector_type(3))); typedef float float4 __attribute__((ext_vector_type(4))); typedef float float8 __attribute__((ext_vector_type(8))); typedef float float16 __attribute__((ext_vector_type(16))); ; typedef double double2 __attribute__((ext_vector_type(2))); typedef double double3 __attribute__((ext_vector_type(3))); typedef double double4 __attribute__((ext_vector_type(4))); typedef double double8 __attribute__((ext_vector_type(8))); typedef double double16 __attribute__((ext_vector_type(16))); ; typedef half half2 __attribute__((ext_vector_type(2))); typedef half half3 __attribute__((ext_vector_type(3))); typedef half half4 __attribute__((ext_vector_type(4))); typedef half half8 __attribute__((ext_vector_type(8))); typedef half half16 __attribute__((ext_vector_type(16))); ; typedef uint cl_mem_fence_flags; typedef enum { memory_order_relaxed, memory_order_acquire, memory_order_release, memory_order_acq_rel, memory_order_seq_cst } memory_order;

typedef enum {
  memory_scope_work_item,
  memory_scope_work_group,
  memory_scope_device,
  memory_scope_all_svm_devices,
  memory_scope_sub_group,
} memory_scope;
__attribute__((overloadable)) int4 A(read_only image1d_t a, int b);
__attribute__((overloadable)) uint4 B(read_only image1d_t a, int b);
__attribute__((overloadable)) float4 C(read_only image1d_t a, int b);
__attribute__((overloadable)) int4 A(read_only image1d_t a, const sampler_t c, int b);
__attribute__((overloadable)) int4 A(read_only image1d_t a, const sampler_t c, float b);
__attribute__((overloadable)) uint4 B(read_only image1d_t a, const sampler_t c, int b);
__attribute__((overloadable)) uint4 B(read_only image1d_t a, const sampler_t c, float b);
__attribute__((overloadable)) float4 C(read_only image1d_t a, const sampler_t c, int b);
__attribute__((overloadable)) float4 C(read_only image1d_t a, const sampler_t c, float b);
__attribute__((overloadable)) void D(write_only image1d_t a, int b, int4 c);
__attribute__((overloadable)) void E(write_only image1d_t a, int b, uint4 c);
__attribute__((overloadable)) void F(write_only image1d_t a, int b, float4 c);
__attribute__((overloadable)) int4 A(read_only image2d_t a, int2 b);
__attribute__((overloadable)) uint4 B(read_only image2d_t a, int2 b);
__attribute__((overloadable)) float4 C(read_only image2d_t a, int2 b);
__attribute__((overloadable)) int4 A(read_only image2d_t a, const sampler_t c, int2 b);
__attribute__((overloadable)) int4 A(read_only image2d_t a, const sampler_t c, float2 b);
__attribute__((overloadable)) uint4 B(read_only image2d_t a, const sampler_t c, int2 b);
__attribute__((overloadable)) uint4 B(read_only image2d_t a, const sampler_t c, float2 b);
__attribute__((overloadable)) float4 C(read_only image2d_t a, const sampler_t c, int2 b);
__attribute__((overloadable)) float4 C(read_only image2d_t a, const sampler_t c, float2 b);
__attribute__((overloadable)) void D(write_only image2d_t a, int2 b, int4 c);
__attribute__((overloadable)) void E(write_only image2d_t a, int2 b, uint4 c);
__attribute__((overloadable)) void F(write_only image2d_t a, int2 b, float4 c);
__attribute__((overloadable)) int4 A(read_only image1d_array_t a, int2 b);
__attribute__((overloadable)) uint4 B(read_only image1d_array_t a, int2 b);
__attribute__((overloadable)) float4 C(read_only image1d_array_t a, int2 b);
__attribute__((overloadable)) int4 A(read_only image1d_array_t a, const sampler_t c, int2 b);
__attribute__((overloadable)) int4 A(read_only image1d_array_t a, const sampler_t c, float2 b);
__attribute__((overloadable)) uint4 B(read_only image1d_array_t a, const sampler_t c, int2 b);
__attribute__((overloadable)) uint4 B(read_only image1d_array_t a, const sampler_t c, float2 b);
__attribute__((overloadable)) float4 C(read_only image1d_array_t a, const sampler_t c, int2 b);
__attribute__((overloadable)) float4 C(read_only image1d_array_t a, const sampler_t c, float2 b);
__attribute__((overloadable)) void D(write_only image1d_array_t a, int2 b, int4 c);
__attribute__((overloadable)) void E(write_only image1d_array_t a, int2 b, uint4 c);
__attribute__((overloadable)) void F(write_only image1d_array_t a, int2 b, float4 c);
__attribute__((overloadable)) int4 A(read_only image3d_t a, int3 b);
__attribute__((overloadable)) uint4 B(read_only image3d_t a, int3 b);
__attribute__((overloadable)) float4 C(read_only image3d_t a, int3 b);
__attribute__((overloadable)) int4 A(read_only image3d_t a, const sampler_t c, int3 b);
__attribute__((overloadable)) int4 A(read_only image3d_t a, const sampler_t c, float3 b);
__attribute__((overloadable)) uint4 B(read_only image3d_t a, const sampler_t c, int3 b);
__attribute__((overloadable)) uint4 B(read_only image3d_t a, const sampler_t c, float3 b);
__attribute__((overloadable)) float4 C(read_only image3d_t a, const sampler_t c, int3 b);
__attribute__((overloadable)) float4 C(read_only image3d_t a, const sampler_t c, float3 b);
__attribute__((overloadable)) void D(write_only image3d_t a, int3 b, int4 c);
__attribute__((overloadable)) void E(write_only image3d_t a, int3 b, uint4 c);
__attribute__((overloadable)) void F(write_only image3d_t a, int3 b, float4 c);
__attribute__((overloadable)) int4 A(read_only image3d_t a, int4 b);
__attribute__((overloadable)) uint4 B(read_only image3d_t a, int4 b);
__attribute__((overloadable)) float4 C(read_only image3d_t a, int4 b);
__attribute__((overloadable)) int4 A(read_only image3d_t a, const sampler_t c, int4 b);
__attribute__((overloadable)) int4 A(read_only image3d_t a, const sampler_t c, float4 b);
__attribute__((overloadable)) uint4 B(read_only image3d_t a, const sampler_t c, int4 b);
__attribute__((overloadable)) uint4 B(read_only image3d_t a, const sampler_t c, float4 b);
__attribute__((overloadable)) float4 C(read_only image3d_t a, const sampler_t c, int4 b);
__attribute__((overloadable)) float4 C(read_only image3d_t a, const sampler_t c, float4 b);
__attribute__((overloadable)) void D(write_only image3d_t a, int4 b, int4 c);
__attribute__((overloadable)) void E(write_only image3d_t a, int4 b, uint4 c);
__attribute__((overloadable)) void F(write_only image3d_t a, int4 b, float4 c);
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, int3 b);
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, int3 b);
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, int3 b);
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, const sampler_t c, int3 b);
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, const sampler_t c, float3 b);
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, const sampler_t c, int3 b);
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, const sampler_t c, float3 b);
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, const sampler_t c, int3 b);
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, const sampler_t c, float3 b);
__attribute__((overloadable)) void D(write_only image2d_array_t a, int3 b, int4 c);
__attribute__((overloadable)) void E(write_only image2d_array_t a, int3 b, uint4 c);
__attribute__((overloadable)) void F(write_only image2d_array_t a, int3 b, float4 c);
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, int4 b);
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, int4 b);
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, int4 b);
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, const sampler_t c, int4 b);
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, const sampler_t c, float4 b);
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, const sampler_t c, int4 b);
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, const sampler_t c, float4 b);
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, const sampler_t c, int4 b);
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, const sampler_t c, float4 b);
__attribute__((overloadable)) void D(write_only image2d_array_t a, int4 b, int4 c);
__attribute__((overloadable)) void E(write_only image2d_array_t a, int4 b, uint4 c);
__attribute__((overloadable)) void F(write_only image2d_array_t a, int4 b, float4 c);
__attribute__((overloadable)) int4 A(read_only image1d_buffer_t a, int b);
__attribute__((overloadable)) uint4 B(read_only image1d_buffer_t a, int b);
__attribute__((overloadable)) float4 C(read_only image1d_buffer_t a, int b);
__attribute__((overloadable)) void D(write_only image1d_buffer_t a, int b, int4 c);
__attribute__((overloadable)) void E(write_only image1d_buffer_t a, int b, uint4 c);
__attribute__((overloadable)) void F(write_only image1d_buffer_t a, int b, float4 c);

__attribute__((overloadable)) int G(read_only image1d_t a);
__attribute__((overloadable)) int H(read_only image1d_t a);
__attribute__((overloadable)) int I(read_only image1d_t a);

__attribute__((overloadable)) int G(read_only image1d_buffer_t a);
__attribute__((overloadable)) int H(read_only image1d_buffer_t a);
__attribute__((overloadable)) int I(read_only image1d_buffer_t a);

__attribute__((overloadable)) int G(read_only image2d_t a);
__attribute__((overloadable)) int H(read_only image2d_t a);
__attribute__((overloadable)) int I(read_only image2d_t a);
__attribute__((overloadable)) int J(read_only image2d_t a);
__attribute__((overloadable)) int2 K(read_only image2d_t a);

__attribute__((overloadable)) int G(read_only image1d_array_t a);
__attribute__((overloadable)) int H(read_only image1d_array_t a);
__attribute__((overloadable)) int I(read_only image1d_array_t a);
__attribute__((overloadable)) size_t L(read_only image1d_array_t a);

__attribute__((overloadable)) int G(read_only image3d_t a);
__attribute__((overloadable)) int H(read_only image3d_t a);
__attribute__((overloadable)) int I(read_only image3d_t a);
__attribute__((overloadable)) int J(read_only image3d_t a);
__attribute__((overloadable)) int M(read_only image3d_t a);
__attribute__((overloadable)) int4 K(read_only image3d_t a);

__attribute__((overloadable)) int G(read_only image2d_array_t a);
__attribute__((overloadable)) int H(read_only image2d_array_t a);
__attribute__((overloadable)) int I(read_only image2d_array_t a);
__attribute__((overloadable)) int J(read_only image2d_array_t a);
__attribute__((overloadable)) int2 K(read_only image2d_array_t a);
__attribute__((overloadable)) size_t L(read_only image2d_array_t a);

__attribute__((overloadable)) int G(write_only image1d_t a);
__attribute__((overloadable)) int H(write_only image1d_t a);
__attribute__((overloadable)) int I(write_only image1d_t a);

__attribute__((overloadable)) int G(write_only image1d_buffer_t a);
__attribute__((overloadable)) int H(write_only image1d_buffer_t a);
__attribute__((overloadable)) int I(write_only image1d_buffer_t a);

__attribute__((overloadable)) int G(write_only image2d_t a);
__attribute__((overloadable)) int H(write_only image2d_t a);
__attribute__((overloadable)) int I(write_only image2d_t a);
__attribute__((overloadable)) int J(write_only image2d_t a);
__attribute__((overloadable)) int2 K(write_only image2d_t a);

__attribute__((overloadable)) int G(write_only image1d_array_t a);
__attribute__((overloadable)) int H(write_only image1d_array_t a);
__attribute__((overloadable)) int I(write_only image1d_array_t a);
__attribute__((overloadable)) size_t L(write_only image1d_array_t a);

__attribute__((overloadable)) int G(write_only image3d_t a);
__attribute__((overloadable)) int H(write_only image3d_t a);
__attribute__((overloadable)) int I(write_only image3d_t a);
__attribute__((overloadable)) int J(write_only image3d_t a);
__attribute__((overloadable)) int M(write_only image3d_t a);
__attribute__((overloadable)) int4 K(write_only image3d_t a);

__attribute__((overloadable)) int G(write_only image2d_array_t a);
__attribute__((overloadable)) int H(write_only image2d_array_t a);
__attribute__((overloadable)) int I(write_only image2d_array_t a);
__attribute__((overloadable)) int J(write_only image2d_array_t a);
__attribute__((overloadable)) int2 K(write_only image2d_array_t a);
__attribute__((overloadable)) size_t L(write_only image2d_array_t a);
__attribute__((overloadable)) int4 N(read_only image1d_t a, sampler_t b, float c, uint d);
__attribute__((overloadable)) int4 N(read_only image1d_t a, sampler_t b, int c, uint d);
__attribute__((overloadable)) uint4 O(read_only image1d_t a, sampler_t b, float c, uint d);
__attribute__((overloadable)) uint4 O(read_only image1d_t a, sampler_t b, int c, uint d);
__attribute__((overloadable)) float4 P(read_only image1d_t a, sampler_t b, float c, uint d);
__attribute__((overloadable)) float4 P(read_only image1d_t a, sampler_t b, int c, uint d);
__attribute__((overloadable)) void Q(write_only image1d_t a, int b, int4 c);
__attribute__((overloadable)) void R(write_only image1d_t a, int b, uint4 c);
__attribute__((overloadable)) void S(write_only image1d_t a, int b, float4 c);
__attribute__((overloadable)) int4 N(read_only image1d_buffer_t a, sampler_t b, float2 c, uint d);
__attribute__((overloadable)) int4 N(read_only image1d_buffer_t a, sampler_t b, int2 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image1d_buffer_t a, sampler_t b, float2 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image1d_buffer_t a, sampler_t b, int2 c, uint d);
__attribute__((overloadable)) float4 P(read_only image1d_buffer_t a, sampler_t b, float2 c, uint d);
__attribute__((overloadable)) float4 P(read_only image1d_buffer_t a, sampler_t b, int2 c, uint d);
__attribute__((overloadable)) void Q(write_only image1d_buffer_t a, int2 b, int4 c);
__attribute__((overloadable)) void R(write_only image1d_buffer_t a, int2 b, uint4 c);
__attribute__((overloadable)) void S(write_only image1d_buffer_t a, int2 b, float4 c);
__attribute__((overloadable)) int4 N(read_only image1d_array_t a, sampler_t b, float2 c, uint d);
__attribute__((overloadable)) int4 N(read_only image1d_array_t a, sampler_t b, int2 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image1d_array_t a, sampler_t b, float2 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image1d_array_t a, sampler_t b, int2 c, uint d);
__attribute__((overloadable)) float4 P(read_only image1d_array_t a, sampler_t b, float2 c, uint d);
__attribute__((overloadable)) float4 P(read_only image1d_array_t a, sampler_t b, int2 c, uint d);
__attribute__((overloadable)) void Q(write_only image1d_array_t a, int2 b, int4 c);
__attribute__((overloadable)) void R(write_only image1d_array_t a, int2 b, uint4 c);
__attribute__((overloadable)) void S(write_only image1d_array_t a, int2 b, float4 c);
__attribute__((overloadable)) int4 N(read_only image1d_array_t a, sampler_t b, float4 c, uint d);
__attribute__((overloadable)) int4 N(read_only image1d_array_t a, sampler_t b, int4 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image1d_array_t a, sampler_t b, float4 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image1d_array_t a, sampler_t b, int4 c, uint d);
__attribute__((overloadable)) float4 P(read_only image1d_array_t a, sampler_t b, float4 c, uint d);
__attribute__((overloadable)) float4 P(read_only image1d_array_t a, sampler_t b, int4 c, uint d);
__attribute__((overloadable)) void Q(write_only image1d_array_t a, int4 b, int4 c);
__attribute__((overloadable)) void R(write_only image1d_array_t a, int4 b, uint4 c);
__attribute__((overloadable)) void S(write_only image1d_array_t a, int4 b, float4 c);
__attribute__((overloadable)) int4 N(read_only image2d_t a, sampler_t b, float2 c, uint d);
__attribute__((overloadable)) int4 N(read_only image2d_t a, sampler_t b, int2 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image2d_t a, sampler_t b, float2 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image2d_t a, sampler_t b, int2 c, uint d);
__attribute__((overloadable)) float4 P(read_only image2d_t a, sampler_t b, float2 c, uint d);
__attribute__((overloadable)) float4 P(read_only image2d_t a, sampler_t b, int2 c, uint d);
__attribute__((overloadable)) void Q(write_only image2d_t a, int2 b, int4 c);
__attribute__((overloadable)) void R(write_only image2d_t a, int2 b, uint4 c);
__attribute__((overloadable)) void S(write_only image2d_t a, int2 b, float4 c);
__attribute__((overloadable)) int4 N(read_only image2d_array_t a, sampler_t b, float3 c, uint d);
__attribute__((overloadable)) int4 N(read_only image2d_array_t a, sampler_t b, int3 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image2d_array_t a, sampler_t b, float3 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image2d_array_t a, sampler_t b, int3 c, uint d);
__attribute__((overloadable)) float4 P(read_only image2d_array_t a, sampler_t b, float3 c, uint d);
__attribute__((overloadable)) float4 P(read_only image2d_array_t a, sampler_t b, int3 c, uint d);
__attribute__((overloadable)) void Q(write_only image2d_array_t a, int3 b, int4 c);
__attribute__((overloadable)) void R(write_only image2d_array_t a, int3 b, uint4 c);
__attribute__((overloadable)) void S(write_only image2d_array_t a, int3 b, float4 c);
__attribute__((overloadable)) int4 N(read_only image3d_t a, sampler_t b, float3 c, uint d);
__attribute__((overloadable)) int4 N(read_only image3d_t a, sampler_t b, int3 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image3d_t a, sampler_t b, float3 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image3d_t a, sampler_t b, int3 c, uint d);
__attribute__((overloadable)) float4 P(read_only image3d_t a, sampler_t b, float3 c, uint d);
__attribute__((overloadable)) float4 P(read_only image3d_t a, sampler_t b, int3 c, uint d);
__attribute__((overloadable)) void Q(write_only image3d_t a, int3 b, int4 c);
__attribute__((overloadable)) void R(write_only image3d_t a, int3 b, uint4 c);
__attribute__((overloadable)) void S(write_only image3d_t a, int3 b, float4 c);
__attribute__((overloadable)) int4 N(read_only image2d_array_t a, sampler_t b, float4 c, uint d);
__attribute__((overloadable)) int4 N(read_only image2d_array_t a, sampler_t b, int4 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image2d_array_t a, sampler_t b, float4 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image2d_array_t a, sampler_t b, int4 c, uint d);
__attribute__((overloadable)) float4 P(read_only image2d_array_t a, sampler_t b, float4 c, uint d);
__attribute__((overloadable)) float4 P(read_only image2d_array_t a, sampler_t b, int4 c, uint d);
__attribute__((overloadable)) void Q(write_only image2d_array_t a, int4 b, int4 c);
__attribute__((overloadable)) void R(write_only image2d_array_t a, int4 b, uint4 c);
__attribute__((overloadable)) void S(write_only image2d_array_t a, int4 b, float4 c);
__attribute__((overloadable)) int4 N(read_only image3d_t a, sampler_t b, float4 c, uint d);
__attribute__((overloadable)) int4 N(read_only image3d_t a, sampler_t b, int4 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image3d_t a, sampler_t b, float4 c, uint d);
__attribute__((overloadable)) uint4 O(read_only image3d_t a, sampler_t b, int4 c, uint d);
__attribute__((overloadable)) float4 P(read_only image3d_t a, sampler_t b, float4 c, uint d);
__attribute__((overloadable)) float4 P(read_only image3d_t a, sampler_t b, int4 c, uint d);
__attribute__((overloadable)) void Q(write_only image3d_t a, int4 b, int4 c);
__attribute__((overloadable)) void R(write_only image3d_t a, int4 b, uint4 c);
__attribute__((overloadable)) void S(write_only image3d_t a, int4 b, float4 c);

__attribute__((overloadable)) int T(read_only image1d_t a);
__attribute__((overloadable)) int U(read_only image1d_t a);
__attribute__((overloadable)) int V(read_only image1d_t a);
__attribute__((overloadable)) int W(read_only image1d_t a);
__attribute__((overloadable)) int X(read_only image1d_t a);
__attribute__((overloadable)) int T(read_only image1d_buffer_t a);
__attribute__((overloadable)) int U(read_only image1d_buffer_t a);
__attribute__((overloadable)) int V(read_only image1d_buffer_t a);
__attribute__((overloadable)) int W(read_only image1d_buffer_t a);
__attribute__((overloadable)) int X(read_only image1d_buffer_t a);
__attribute__((overloadable)) int T(read_only image1d_array_t a);
__attribute__((overloadable)) int U(read_only image1d_array_t a);
__attribute__((overloadable)) int V(read_only image1d_array_t a);
__attribute__((overloadable)) int W(read_only image1d_array_t a);
__attribute__((overloadable)) int X(read_only image1d_array_t a);
__attribute__((overloadable)) int T(read_only image2d_t a);
__attribute__((overloadable)) int U(read_only image2d_t a);
__attribute__((overloadable)) int V(read_only image2d_t a);
__attribute__((overloadable)) int W(read_only image2d_t a);
__attribute__((overloadable)) int X(read_only image2d_t a);
__attribute__((overloadable)) int T(read_only image2d_array_t a);
__attribute__((overloadable)) int U(read_only image2d_array_t a);
__attribute__((overloadable)) int V(read_only image2d_array_t a);
__attribute__((overloadable)) int W(read_only image2d_array_t a);
__attribute__((overloadable)) int X(read_only image2d_array_t a);
__attribute__((overloadable)) int T(read_only image3d_t a);
__attribute__((overloadable)) int U(read_only image3d_t a);
__attribute__((overloadable)) int V(read_only image3d_t a);
__attribute__((overloadable)) int W(read_only image3d_t a);
__attribute__((overloadable)) int X(read_only image3d_t a);

__attribute__((overloadable)) int T(write_only image1d_t a);
__attribute__((overloadable)) int U(write_only image1d_t a);
__attribute__((overloadable)) int V(write_only image1d_t a);
__attribute__((overloadable)) int W(write_only image1d_t a);
__attribute__((overloadable)) int X(write_only image1d_t a);
__attribute__((overloadable)) int T(write_only image1d_buffer_t a);
__attribute__((overloadable)) int U(write_only image1d_buffer_t a);
__attribute__((overloadable)) int V(write_only image1d_buffer_t a);
__attribute__((overloadable)) int W(write_only image1d_buffer_t a);
__attribute__((overloadable)) int X(write_only image1d_buffer_t a);
__attribute__((overloadable)) int T(write_only image1d_array_t a);
__attribute__((overloadable)) int U(write_only image1d_array_t a);
__attribute__((overloadable)) int V(write_only image1d_array_t a);
__attribute__((overloadable)) int W(write_only image1d_array_t a);
__attribute__((overloadable)) int X(write_only image1d_array_t a);
__attribute__((overloadable)) int T(write_only image2d_t a);
__attribute__((overloadable)) int U(write_only image2d_t a);
__attribute__((overloadable)) int V(write_only image2d_t a);
__attribute__((overloadable)) int W(write_only image2d_t a);
__attribute__((overloadable)) int X(write_only image2d_t a);
__attribute__((overloadable)) int T(write_only image2d_array_t a);
__attribute__((overloadable)) int U(write_only image2d_array_t a);
__attribute__((overloadable)) int V(write_only image2d_array_t a);
__attribute__((overloadable)) int W(write_only image2d_array_t a);
__attribute__((overloadable)) int X(write_only image2d_array_t a);
__attribute__((overloadable)) int T(write_only image3d_t a);
__attribute__((overloadable)) int U(write_only image3d_t a);
__attribute__((overloadable)) int V(write_only image3d_t a);
__attribute__((overloadable)) int W(write_only image3d_t a);
__attribute__((overloadable)) int X(write_only image3d_t a);
inline __attribute__((overloadable, always_inline)) float2 Y(float2 a, read_only image1d_array_t b) {
  float c = X(b);
  a.s1 = clamp(__clc_rint(a.s1), 0.f, c - 1.f);
  return a;
}

inline __attribute__((overloadable, always_inline)) float4 Y(float4 a, read_only image2d_array_t b) {
  float c = X(b);
  a.s2 = clamp(__clc_rint(a.s2), 0.f, c - 1.f);
  return a;
}

inline __attribute__((overloadable, always_inline)) float3 Y(float3 a, read_only image2d_array_t b) {
  float c = X(b);
  a.s2 = clamp(__clc_rint(a.s2), 0.f, c - 1.f);
  return a;
}

inline __attribute__((overloadable, always_inline)) int2 Y(int2 a, read_only image1d_array_t b) {
  int c = X(b);
  a.s1 = clamp(a.s1, 0, c - 1);
  return a;
}

inline __attribute__((overloadable, always_inline)) int4 Y(int4 a, read_only image2d_array_t b) {
  int c = X(b);
  a.s2 = clamp(a.s2, 0, c - 1);
  return a;
}

inline __attribute__((overloadable, always_inline)) int3 Y(int3 a, read_only image2d_array_t b) {
  int c = X(b);
  a.s2 = clamp(a.s2, 0, c - 1);
  return a;
}

inline __attribute__((overloadable, always_inline)) float2 Y(float2 a, write_only image1d_array_t b) {
  float c = X(b);
  a.s1 = clamp(__clc_rint(a.s1), 0.f, c - 1.f);
  return a;
}
inline __attribute__((overloadable, always_inline)) float4 Y(float4 a, write_only image2d_array_t b) {
  float c = X(b);
  a.s2 = clamp(__clc_rint(a.s2), 0.f, c - 1.f);
  return a;
}
inline __attribute__((overloadable, always_inline)) float3 Y(float3 a, write_only image2d_array_t b) {
  float c = X(b);
  a.s2 = clamp(__clc_rint(a.s2), 0.f, c - 1.f);
  return a;
}
inline __attribute__((overloadable, always_inline)) int2 Y(int2 a, write_only image1d_array_t b) {
  int c = X(b);
  a.s1 = clamp(a.s1, 0, c - 1);
  return a;
}
inline __attribute__((overloadable, always_inline)) int4 Y(int4 a, write_only image2d_array_t b) {
  int c = X(b);
  a.s2 = clamp(a.s2, 0, c - 1);
  return a;
}
inline __attribute__((overloadable, always_inline)) int3 Y(int3 a, write_only image2d_array_t b) {
  int c = X(b);
  a.s2 = clamp(a.s2, 0, c - 1);
  return a;
}
inline __attribute__((overloadable, always_inline)) float Y(float a, read_only image1d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int Y(int a, read_only image1d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) float2 Y(float2 a, read_only image2d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int2 Y(int2 a, read_only image2d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) float4 Y(float4 a, read_only image3d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int4 Y(int4 a, read_only image3d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) float3 Y(float3 a, read_only image3d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int3 Y(int3 a, read_only image3d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) float Y(float a, read_only image1d_buffer_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int Y(int a, read_only image1d_buffer_t b) {
  return a;
}

inline __attribute__((overloadable, always_inline)) float Y(float a, write_only image1d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int Y(int a, write_only image1d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) float2 Y(float2 a, write_only image2d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int2 Y(int2 a, write_only image2d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) float4 Y(float4 a, write_only image3d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int4 Y(int4 a, write_only image3d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) float3 Y(float3 a, write_only image3d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int3 Y(int3 a, write_only image3d_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) float Y(float a, write_only image1d_buffer_t b) {
  return a;
}
inline __attribute__((overloadable, always_inline)) int Y(int a, write_only image1d_buffer_t b) {
  return a;
}
bool Z(sampler_t);
bool AA(sampler_t);

bool AB(const sampler_t a) {
  return Z(a);
}

bool AC(const sampler_t a) {
  return AA(a);
}

inline __attribute__((overloadable, always_inline)) float AD(float a) {
  if (a < 0 && a > -0x1p-20f)
    a += -0x1p-9f;
  return a;
}

inline __attribute__((overloadable, always_inline)) float2 AD(float2 a) {
  if (a.s0 < 0 && a.s0 > -0x1p-20f)
    a.s0 += -0x1p-9f;
  if (a.s1 < 0 && a.s1 > -0x1p-20f)
    a.s1 += -0x1p-9f;
  return a;
}

inline __attribute__((overloadable, always_inline)) float3 AD(float3 a) {
  if (a.s0 < 0 && a.s0 > -0x1p-20f)
    a.s0 += -0x1p-9f;
  if (a.s1 < 0 && a.s1 > -0x1p-20f)
    a.s1 += -0x1p-9f;
  if (a.s2 < 0 && a.s2 > -0x1p-20f)
    a.s2 += -0x1p-9f;
  return a;
}

inline __attribute__((overloadable, always_inline)) float4 AD(float4 a) {
  if (a.s0 < 0 && a.s0 > -0x1p-20f)
    a.s0 += -0x1p-9f;
  if (a.s1 < 0 && a.s1 > -0x1p-20f)
    a.s1 += -0x1p-9f;
  if (a.s2 < 0 && a.s2 > -0x1p-20f)
    a.s2 += -0x1p-9f;
  return a;
}

inline __attribute__((overloadable, always_inline)) float AE(const image1d_t a, float b) {
  return b * T(a);
}

inline __attribute__((overloadable, always_inline)) float2 AE(const image1d_array_t a, float2 b) {
  b.s0 = b.s0 * T(a);
  return b;
}

inline __attribute__((overloadable, always_inline)) float AE(const image1d_buffer_t a, float b) {
  return b * T(a);
}

inline __attribute__((overloadable, always_inline)) float2 AE(const image2d_t a, float2 b) {
  b.s0 = b.s0 * T(a);
  b.s1 = b.s1 * U(a);
  return b;
}

inline __attribute__((overloadable, always_inline)) float3 AE(const image2d_array_t a, float3 b) {
  b.s0 = b.s0 * T(a);
  b.s1 = b.s1 * U(a);
  return b;
}

inline __attribute__((overloadable, always_inline)) float3 AE(const image3d_t a, float3 b) {
  b.s0 = b.s0 * T(a);
  b.s1 = b.s1 * U(a);
  b.s2 = b.s2 * X(a);
  return b;
}

inline __attribute__((overloadable, always_inline)) float4 AE(const image2d_array_t a, float4 b) {
  b.s0 = b.s0 * T(a);
  b.s1 = b.s1 * U(a);
  return b;
}

inline __attribute__((overloadable, always_inline)) float4 AE(const image3d_t a, float4 b) {
  b.s0 = b.s0 * T(a);
  b.s1 = b.s1 * U(a);
  b.s2 = b.s2 * X(a);
  return b;
}

inline __attribute__((overloadable, always_inline)) float AF(float a) {
  return a < 0 ? -1 : a;
}

inline __attribute__((overloadable, always_inline)) float2 AF(float2 a) {
  a.s0 = a.s0 < 0 ? -1 : a.s0;
  a.s1 = a.s1 < 0 ? -1 : a.s1;
  return a;
}

inline __attribute__((overloadable, always_inline)) float4 AF(float4 a) {
  a.s0 = a.s0 < 0 ? -1 : a.s0;
  a.s1 = a.s1 < 0 ? -1 : a.s1;
  a.s2 = a.s2 < 0 ? -1 : a.s2;
  return a;
}

inline __attribute__((overloadable, always_inline)) float3 AF(float3 a) {
  a.s0 = a.s0 < 0 ? -1 : a.s0;
  a.s1 = a.s1 < 0 ? -1 : a.s1;
  a.s2 = a.s2 < 0 ? -1 : a.s2;
  return a;
}
__attribute__((overloadable)) int4 A(read_only image1d_t a, const sampler_t c, int b) {
  b = Y(b, a);
  if (0 && AB(c))
    return N(a, c, convert_int(b), 1);
  return N(a, c, convert_float(b), 0);
}
__attribute__((overloadable)) int4 A(read_only image1d_t a, const sampler_t c, float b) {
  float d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return N(a, c, convert_int(d), 1);
      }
    }
  }
  return N(a, c, convert_float(d), 0);
}
__attribute__((overloadable)) int4 A(read_only image1d_t a, int b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return N(a, e, convert_float(b), 0);
}
__attribute__((overloadable)) void D(write_only image1d_t a, int b, int4 c) {
  int d = Y(b, a);
  Q(a, d, c);
}
__attribute__((overloadable)) uint4 B(read_only image1d_t a, const sampler_t c, int b) {
  b = Y(b, a);
  if (0 && AB(c))
    return O(a, c, convert_int(b), 1);
  return O(a, c, convert_float(b), 0);
}
__attribute__((overloadable)) uint4 B(read_only image1d_t a, const sampler_t c, float b) {
  float d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return O(a, c, convert_int(d), 1);
      }
    }
  }
  return O(a, c, convert_float(d), 0);
}
__attribute__((overloadable)) uint4 B(read_only image1d_t a, int b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return O(a, e, convert_float(b), 0);
}
__attribute__((overloadable)) void E(write_only image1d_t a, int b, uint4 c) {
  int d = Y(b, a);
  R(a, d, c);
}
__attribute__((overloadable)) float4 C(read_only image1d_t a, const sampler_t c, int b) {
  b = Y(b, a);
  if (0 && AB(c))
    return P(a, c, convert_int(b), 1);
  return P(a, c, convert_float(b), 0);
}
__attribute__((overloadable)) float4 C(read_only image1d_t a, const sampler_t c, float b) {
  float d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return P(a, c, convert_int(d), 1);
      }
    }
  }
  return P(a, c, convert_float(d), 0);
}
__attribute__((overloadable)) float4 C(read_only image1d_t a, int b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return P(a, e, convert_float(b), 0);
}
__attribute__((overloadable)) void F(write_only image1d_t a, int b, float4 c) {
  int d = Y(b, a);
  S(a, d, c);
}
__attribute__((overloadable)) int4 A(read_only image2d_t a, const sampler_t c, int2 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return N(a, c, convert_int2(b), 1);
  return N(a, c, convert_float2(b), 0);
}
__attribute__((overloadable)) int4 A(read_only image2d_t a, const sampler_t c, float2 b) {
  float2 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return N(a, c, convert_int2(d), 1);
      }
    }
  }
  return N(a, c, convert_float2(d), 0);
}
__attribute__((overloadable)) int4 A(read_only image2d_t a, int2 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return N(a, e, convert_float2(b), 0);
}
__attribute__((overloadable)) void D(write_only image2d_t a, int2 b, int4 c) {
  int2 d = Y(b, a);
  Q(a, d, c);
}
__attribute__((overloadable)) uint4 B(read_only image2d_t a, const sampler_t c, int2 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return O(a, c, convert_int2(b), 1);
  return O(a, c, convert_float2(b), 0);
}
__attribute__((overloadable)) uint4 B(read_only image2d_t a, const sampler_t c, float2 b) {
  float2 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return O(a, c, convert_int2(d), 1);
      }
    }
  }
  return O(a, c, convert_float2(d), 0);
}
__attribute__((overloadable)) uint4 B(read_only image2d_t a, int2 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return O(a, e, convert_float2(b), 0);
}
__attribute__((overloadable)) void E(write_only image2d_t a, int2 b, uint4 c) {
  int2 d = Y(b, a);
  R(a, d, c);
}
__attribute__((overloadable)) float4 C(read_only image2d_t a, const sampler_t c, int2 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return P(a, c, convert_int2(b), 1);
  return P(a, c, convert_float2(b), 0);
}
__attribute__((overloadable)) float4 C(read_only image2d_t a, const sampler_t c, float2 b) {
  float2 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return P(a, c, convert_int2(d), 1);
      }
    }
  }
  return P(a, c, convert_float2(d), 0);
}
__attribute__((overloadable)) float4 C(read_only image2d_t a, int2 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return P(a, e, convert_float2(b), 0);
}
__attribute__((overloadable)) void F(write_only image2d_t a, int2 b, float4 c) {
  int2 d = Y(b, a);
  S(a, d, c);
}
__attribute__((overloadable)) int4 A(read_only image3d_t a, const sampler_t c, int4 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return N(a, c, convert_int4(b), 1);
  return N(a, c, convert_float4(b), 0);
}
__attribute__((overloadable)) int4 A(read_only image3d_t a, const sampler_t c, float4 b) {
  float4 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return N(a, c, convert_int4(d), 1);
      }
    }
  }
  return N(a, c, convert_float4(d), 0);
}
__attribute__((overloadable)) int4 A(read_only image3d_t a, int4 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return N(a, e, convert_float4(b), 0);
}
__attribute__((overloadable)) void D(write_only image3d_t a, int4 b, int4 c) {
  int4 d = Y(b, a);
  Q(a, d, c);
}
__attribute__((overloadable)) uint4 B(read_only image3d_t a, const sampler_t c, int4 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return O(a, c, convert_int4(b), 1);
  return O(a, c, convert_float4(b), 0);
}
__attribute__((overloadable)) uint4 B(read_only image3d_t a, const sampler_t c, float4 b) {
  float4 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return O(a, c, convert_int4(d), 1);
      }
    }
  }
  return O(a, c, convert_float4(d), 0);
}
__attribute__((overloadable)) uint4 B(read_only image3d_t a, int4 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return O(a, e, convert_float4(b), 0);
}
__attribute__((overloadable)) void E(write_only image3d_t a, int4 b, uint4 c) {
  int4 d = Y(b, a);
  R(a, d, c);
}
__attribute__((overloadable)) float4 C(read_only image3d_t a, const sampler_t c, int4 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return P(a, c, convert_int4(b), 1);
  return P(a, c, convert_float4(b), 0);
}
__attribute__((overloadable)) float4 C(read_only image3d_t a, const sampler_t c, float4 b) {
  float4 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return P(a, c, convert_int4(d), 1);
      }
    }
  }
  return P(a, c, convert_float4(d), 0);
}
__attribute__((overloadable)) float4 C(read_only image3d_t a, int4 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return P(a, e, convert_float4(b), 0);
}
__attribute__((overloadable)) void F(write_only image3d_t a, int4 b, float4 c) {
  int4 d = Y(b, a);
  S(a, d, c);
}
__attribute__((overloadable)) int4 A(read_only image3d_t a, const sampler_t c, int3 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return N(a, c, convert_int3(b), 1);
  return N(a, c, convert_float3(b), 0);
}
__attribute__((overloadable)) int4 A(read_only image3d_t a, const sampler_t c, float3 b) {
  float3 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return N(a, c, convert_int3(d), 1);
      }
    }
  }
  return N(a, c, convert_float3(d), 0);
}
__attribute__((overloadable)) int4 A(read_only image3d_t a, int3 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return N(a, e, convert_float3(b), 0);
}
__attribute__((overloadable)) void D(write_only image3d_t a, int3 b, int4 c) {
  int3 d = Y(b, a);
  Q(a, d, c);
}
__attribute__((overloadable)) uint4 B(read_only image3d_t a, const sampler_t c, int3 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return O(a, c, convert_int3(b), 1);
  return O(a, c, convert_float3(b), 0);
}
__attribute__((overloadable)) uint4 B(read_only image3d_t a, const sampler_t c, float3 b) {
  float3 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return O(a, c, convert_int3(d), 1);
      }
    }
  }
  return O(a, c, convert_float3(d), 0);
}
__attribute__((overloadable)) uint4 B(read_only image3d_t a, int3 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return O(a, e, convert_float3(b), 0);
}
__attribute__((overloadable)) void E(write_only image3d_t a, int3 b, uint4 c) {
  int3 d = Y(b, a);
  R(a, d, c);
}
__attribute__((overloadable)) float4 C(read_only image3d_t a, const sampler_t c, int3 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return P(a, c, convert_int3(b), 1);
  return P(a, c, convert_float3(b), 0);
}
__attribute__((overloadable)) float4 C(read_only image3d_t a, const sampler_t c, float3 b) {
  float3 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return P(a, c, convert_int3(d), 1);
      }
    }
  }
  return P(a, c, convert_float3(d), 0);
}
__attribute__((overloadable)) float4 C(read_only image3d_t a, int3 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return P(a, e, convert_float3(b), 0);
}
__attribute__((overloadable)) void F(write_only image3d_t a, int3 b, float4 c) {
  int3 d = Y(b, a);
  S(a, d, c);
}
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, const sampler_t c, int4 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return N(a, c, convert_int4(b), 1);
  return N(a, c, convert_float4(b), 0);
}
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, const sampler_t c, float4 b) {
  float4 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return N(a, c, convert_int4(d), 1);
      }
    }
  }
  return N(a, c, convert_float4(d), 0);
}
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, int4 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return N(a, e, convert_float4(b), 0);
}
__attribute__((overloadable)) void D(write_only image2d_array_t a, int4 b, int4 c) {
  int4 d = Y(b, a);
  Q(a, d, c);
}
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, const sampler_t c, int4 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return O(a, c, convert_int4(b), 1);
  return O(a, c, convert_float4(b), 0);
}
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, const sampler_t c, float4 b) {
  float4 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return O(a, c, convert_int4(d), 1);
      }
    }
  }
  return O(a, c, convert_float4(d), 0);
}
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, int4 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return O(a, e, convert_float4(b), 0);
}
__attribute__((overloadable)) void E(write_only image2d_array_t a, int4 b, uint4 c) {
  int4 d = Y(b, a);
  R(a, d, c);
}
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, const sampler_t c, int4 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return P(a, c, convert_int4(b), 1);
  return P(a, c, convert_float4(b), 0);
}
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, const sampler_t c, float4 b) {
  float4 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return P(a, c, convert_int4(d), 1);
      }
    }
  }
  return P(a, c, convert_float4(d), 0);
}
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, int4 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return P(a, e, convert_float4(b), 0);
}
__attribute__((overloadable)) void F(write_only image2d_array_t a, int4 b, float4 c) {
  int4 d = Y(b, a);
  S(a, d, c);
}
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, const sampler_t c, int3 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return N(a, c, convert_int3(b), 1);
  return N(a, c, convert_float3(b), 0);
}
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, const sampler_t c, float3 b) {
  float3 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return N(a, c, convert_int3(d), 1);
      }
    }
  }
  return N(a, c, convert_float3(d), 0);
}
__attribute__((overloadable)) int4 A(read_only image2d_array_t a, int3 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return N(a, e, convert_float3(b), 0);
}
__attribute__((overloadable)) void D(write_only image2d_array_t a, int3 b, int4 c) {
  int3 d = Y(b, a);
  Q(a, d, c);
}
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, const sampler_t c, int3 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return O(a, c, convert_int3(b), 1);
  return O(a, c, convert_float3(b), 0);
}
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, const sampler_t c, float3 b) {
  float3 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return O(a, c, convert_int3(d), 1);
      }
    }
  }
  return O(a, c, convert_float3(d), 0);
}
__attribute__((overloadable)) uint4 B(read_only image2d_array_t a, int3 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return O(a, e, convert_float3(b), 0);
}
__attribute__((overloadable)) void E(write_only image2d_array_t a, int3 b, uint4 c) {
  int3 d = Y(b, a);
  R(a, d, c);
}
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, const sampler_t c, int3 b) {
  b = Y(b, a);
  if (0 && AB(c))
    return P(a, c, convert_int3(b), 1);
  return P(a, c, convert_float3(b), 0);
}
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, const sampler_t c, float3 b) {
  float3 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        d = AF(d);
        return P(a, c, convert_int3(d), 1);
      }
    }
  }
  return P(a, c, convert_float3(d), 0);
}
__attribute__((overloadable)) float4 C(read_only image2d_array_t a, int3 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return P(a, e, convert_float3(b), 0);
}
__attribute__((overloadable)) void F(write_only image2d_array_t a, int3 b, float4 c) {
  int3 d = Y(b, a);
  S(a, d, c);
}
__attribute__((overloadable)) int4 A(read_only image1d_buffer_t a, int b) {
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  int2 f;
  f.s0 = b % 8192;
  f.s1 = b / 8192;
  return N(a, e, convert_float2(f), 0);
}
__attribute__((overloadable)) void D(write_only image1d_buffer_t a, int b, int4 c) {
  int2 e;
  e.s0 = b % 8192;
  e.s1 = b / 8192;
  Q(a, e, c);
}
__attribute__((overloadable)) uint4 B(read_only image1d_buffer_t a, int b) {
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  int2 f;
  f.s0 = b % 8192;
  f.s1 = b / 8192;
  return O(a, e, convert_float2(f), 0);
}
__attribute__((overloadable)) void E(write_only image1d_buffer_t a, int b, uint4 c) {
  int2 e;
  e.s0 = b % 8192;
  e.s1 = b / 8192;
  R(a, e, c);
}
__attribute__((overloadable)) float4 C(read_only image1d_buffer_t a, int b) {
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  int2 f;
  f.s0 = b % 8192;
  f.s1 = b / 8192;
  return P(a, e, convert_float2(f), 0);
}
__attribute__((overloadable)) void F(write_only image1d_buffer_t a, int b, float4 c) {
  int2 e;
  e.s0 = b % 8192;
  e.s1 = b / 8192;
  S(a, e, c);
}

inline __attribute__((overloadable, always_inline)) float4 AG(float2 a, image1d_array_t b) {
  float4 c;
  c.s0 = a.s0 < 0 ? -1 : a.s0;
  c.s1 = 0;
  c.s2 = a.s1;
  c.s3 = 0;
  return c;
}

inline __attribute__((overloadable, always_inline)) int4 AG(int2 a, image1d_array_t b) {
  int4 c;
  c.s0 = a.s0;
  c.s1 = 0;
  c.s2 = a.s1;
  c.s3 = 0;
  return c;
}
__attribute__((overloadable)) int4 A(image1d_array_t a, const sampler_t c, int2 b) {
  b = Y(b, a);
  if (0 && AB(c)) {
    int4 g = AG(b, a);
    return N(a, c, g, 2);
  }
  return N(a, c, convert_float2(b), 0);
}
__attribute__((overloadable)) int4 A(image1d_array_t a, const sampler_t c, float2 b) {
  float2 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        float4 g = AG(d, a);
        return N(a, c, convert_int4(g), 2);
      }
    }
  }
  return N(a, c, convert_float2(d), 0);
}
__attribute__((overloadable)) int4 A(read_only image1d_array_t a, int2 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return N(a, e, convert_float2(b), 0);
}
__attribute__((overloadable)) void D(write_only image1d_array_t a, int2 b, int4 c) {
  int2 d = Y(b, a);
  Q(a, d, c);
}
__attribute__((overloadable)) uint4 B(image1d_array_t a, const sampler_t c, int2 b) {
  b = Y(b, a);
  if (0 && AB(c)) {
    int4 g = AG(b, a);
    return O(a, c, g, 2);
  }
  return O(a, c, convert_float2(b), 0);
}
__attribute__((overloadable)) uint4 B(image1d_array_t a, const sampler_t c, float2 b) {
  float2 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        float4 g = AG(d, a);
        return O(a, c, convert_int4(g), 2);
      }
    }
  }
  return O(a, c, convert_float2(d), 0);
}
__attribute__((overloadable)) uint4 B(read_only image1d_array_t a, int2 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return O(a, e, convert_float2(b), 0);
}
__attribute__((overloadable)) void E(write_only image1d_array_t a, int2 b, uint4 c) {
  int2 d = Y(b, a);
  R(a, d, c);
}
__attribute__((overloadable)) float4 C(image1d_array_t a, const sampler_t c, int2 b) {
  b = Y(b, a);
  if (0 && AB(c)) {
    int4 g = AG(b, a);
    return P(a, c, g, 2);
  }
  return P(a, c, convert_float2(b), 0);
}
__attribute__((overloadable)) float4 C(image1d_array_t a, const sampler_t c, float2 b) {
  float2 d = Y(b, a);
  if (0 | 0) {
    if (AB(c)) {
      if (0 && AC(c))
        d = AD(d);
      if (0) {
        if (!AC(c))
          d = AE(a, d);
        float4 g = AG(d, a);
        return P(a, c, convert_int4(g), 2);
      }
    }
  }
  return P(a, c, convert_float2(d), 0);
}
__attribute__((overloadable)) float4 C(read_only image1d_array_t a, int2 b) {
  b = Y(b, a);
  sampler_t e = 0x0000 | 0x0000 | 0x0000;
  return P(a, e, convert_float2(b), 0);
}
__attribute__((overloadable)) void F(write_only image1d_array_t a, int2 b, float4 c) {
  int2 d = Y(b, a);
  S(a, d, c);
}
__attribute__((overloadable)) int G(read_only image1d_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(read_only image1d_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(read_only image1d_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(read_only image1d_buffer_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(read_only image1d_buffer_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(read_only image1d_buffer_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(read_only image1d_array_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(read_only image1d_array_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(read_only image1d_array_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(read_only image2d_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(read_only image2d_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(read_only image2d_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(read_only image3d_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(read_only image3d_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(read_only image3d_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(read_only image2d_array_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(read_only image2d_array_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(read_only image2d_array_t a) {
  return T(a);
}

__attribute__((overloadable)) int G(write_only image1d_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(write_only image1d_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(write_only image1d_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(write_only image1d_buffer_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(write_only image1d_buffer_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(write_only image1d_buffer_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(write_only image1d_array_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(write_only image1d_array_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(write_only image1d_array_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(write_only image2d_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(write_only image2d_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(write_only image2d_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(write_only image3d_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(write_only image3d_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(write_only image3d_t a) {
  return T(a);
}
__attribute__((overloadable)) int G(write_only image2d_array_t a) {
  return V(a);
}
__attribute__((overloadable)) int H(write_only image2d_array_t a) {
  return W(a);
}
__attribute__((overloadable)) int I(write_only image2d_array_t a) {
  return T(a);
}
__attribute__((overloadable)) int J(read_only image2d_t a) {
  return U(a);
}
__attribute__((overloadable)) int2 K(read_only image2a) {
  reJibute__((overloadable)) int J(write_only image2d_t a) {
    return U(a);
  }
  __attribute__((overloadable)) int2 K(write_only image2a) {
    reJbute__((overloadable)) int J(read_only image3d_t a) {
      return U(a);
    }
    __attribute__((overloadable)) int M(read_only image3d_t a) {
      return X(a);
    }
    __attribute__((overloadable)) int4 K(read_only image3d_t a) {
  retainta    a       M        0);
    }

    __attribute__((overloadable)) int J(write_only image3d_t a) {
      return U(a);
    }
    __attribute__((overloadable)) int M(write_only image3d_t a) {
      return X(a);
    }
    __attribute__((overloadable)) int4 K(write_only image3d_t a) {
  retainta    a       M        0);
    }
    __attribute__((overloadable)) int J(read_only image2d_array_t a) {
      return U(a);
    }
    __attribute__((overloadable)) int2 K(read_only image2d_arraa) {
      reJbute__((overloadable)) size_t L(read_only image2d_array_t a) {
        return X(a);
      }

      __attribute__((overloadable)) int J(write_only image2d_array_t a) {
        return U(a);
      }
      __attribute__((overloadable)) int2 K(write_only image2d_arraa) {
        reJbute__((overloadable)) size_t L(write_only image2d_array_t a) {
          return X(a);
        }
        __attribute__((overloadable)) size_t L(read_only image1d_array_t a) {
          return X(a);
        }

        __attribute__((overloadable)) size_t L(write_only image1d_array_t a) {
          return X(a);
        }