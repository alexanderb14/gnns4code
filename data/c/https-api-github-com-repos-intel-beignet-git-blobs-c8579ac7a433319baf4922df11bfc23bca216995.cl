typedef unsigned char uchar; typedef unsigned short ushort; typedef unsigned int uint; typedef unsigned long ulong; typedef __typeof__(sizeof(int)) size_t; typedef __typeof__((int*)0 - (int*)0) ptrdiff_t; typedef long int intptr_t; typedef long unsigned int uintptr_t; typedef char char2 __attribute__((ext_vector_type(2))); typedef char char3 __attribute__((ext_vector_type(3))); typedef char char4 __attribute__((ext_vector_type(4))); typedef char char8 __attribute__((ext_vector_type(8))); typedef char char16 __attribute__((ext_vector_type(16))); ; typedef uchar uchar2 __attribute__((ext_vector_type(2))); typedef uchar uchar3 __attribute__((ext_vector_type(3))); typedef uchar uchar4 __attribute__((ext_vector_type(4))); typedef uchar uchar8 __attribute__((ext_vector_type(8))); typedef uchar uchar16 __attribute__((ext_vector_type(16))); ; typedef short short2 __attribute__((ext_vector_type(2))); typedef short short3 __attribute__((ext_vector_type(3))); typedef short short4 __attribute__((ext_vector_type(4))); typedef short short8 __attribute__((ext_vector_type(8))); typedef short short16 __attribute__((ext_vector_type(16))); ; typedef ushort ushort2 __attribute__((ext_vector_type(2))); typedef ushort ushort3 __attribute__((ext_vector_type(3))); typedef ushort ushort4 __attribute__((ext_vector_type(4))); typedef ushort ushort8 __attribute__((ext_vector_type(8))); typedef ushort ushort16 __attribute__((ext_vector_type(16))); ; typedef int int2 __attribute__((ext_vector_type(2))); typedef int int3 __attribute__((ext_vector_type(3))); typedef int int4 __attribute__((ext_vector_type(4))); typedef int int8 __attribute__((ext_vector_type(8))); typedef int int16 __attribute__((ext_vector_type(16))); ; typedef uint uint2 __attribute__((ext_vector_type(2))); typedef uint uint3 __attribute__((ext_vector_type(3))); typedef uint uint4 __attribute__((ext_vector_type(4))); typedef uint uint8 __attribute__((ext_vector_type(8))); typedef uint uint16 __attribute__((ext_vector_type(16))); ; typedef long long2 __attribute__((ext_vector_type(2))); typedef long long3 __attribute__((ext_vector_type(3))); typedef long long4 __attribute__((ext_vector_type(4))); typedef long long8 __attribute__((ext_vector_type(8))); typedef long long16 __attribute__((ext_vector_type(16))); ; typedef ulong ulong2 __attribute__((ext_vector_type(2))); typedef ulong ulong3 __attribute__((ext_vector_type(3))); typedef ulong ulong4 __attribute__((ext_vector_type(4))); typedef ulong ulong8 __attribute__((ext_vector_type(8))); typedef ulong ulong16 __attribute__((ext_vector_type(16))); ; typedef float float2 __attribute__((ext_vector_type(2))); typedef float float3 __attribute__((ext_vector_type(3))); typedef float float4 __attribute__((ext_vector_type(4))); typedef float float8 __attribute__((ext_vector_type(8))); typedef float float16 __attribute__((ext_vector_type(16))); ; typedef double double2 __attribute__((ext_vector_type(2))); typedef double double3 __attribute__((ext_vector_type(3))); typedef double double4 __attribute__((ext_vector_type(4))); typedef double double8 __attribute__((ext_vector_type(8))); typedef double double16 __attribute__((ext_vector_type(16))); ; typedef half half2 __attribute__((ext_vector_type(2))); typedef half half3 __attribute__((ext_vector_type(3))); typedef half half4 __attribute__((ext_vector_type(4))); typedef half half8 __attribute__((ext_vector_type(8))); typedef half half16 __attribute__((ext_vector_type(16))); ; typedef uint cl_mem_fence_flags; typedef enum { memory_order_relaxed, memory_order_acquire, memory_order_release, memory_order_acq_rel, memory_order_seq_cst } memory_order;

typedef enum {
  memory_scope_work_item,
  memory_scope_work_group,
  memory_scope_device,
  memory_scope_all_svm_devices,
  memory_scope_sub_group,
} memory_scope;
__attribute__((overloadable)) event_t A(local char* a, const global char* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global char* a, const local char* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local char* a, const global char* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global char* a, const local char* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local char2* a, const global char2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global char2* a, const local char2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local char2* a, const global char2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global char2* a, const local char2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local char3* a, const global char3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global char3* a, const local char3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local char3* a, const global char3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global char3* a, const local char3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local char4* a, const global char4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global char4* a, const local char4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local char4* a, const global char4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global char4* a, const local char4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local char8* a, const global char8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global char8* a, const local char8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local char8* a, const global char8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global char8* a, const local char8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local char16* a, const global char16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global char16* a, const local char16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local char16* a, const global char16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global char16* a, const local char16* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uchar* a, const global uchar* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uchar* a, const local uchar* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uchar* a, const global uchar* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uchar* a, const local uchar* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uchar2* a, const global uchar2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uchar2* a, const local uchar2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uchar2* a, const global uchar2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uchar2* a, const local uchar2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uchar3* a, const global uchar3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uchar3* a, const local uchar3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uchar3* a, const global uchar3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uchar3* a, const local uchar3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uchar4* a, const global uchar4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uchar4* a, const local uchar4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uchar4* a, const global uchar4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uchar4* a, const local uchar4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uchar8* a, const global uchar8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uchar8* a, const local uchar8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uchar8* a, const global uchar8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uchar8* a, const local uchar8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uchar16* a, const global uchar16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uchar16* a, const local uchar16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uchar16* a, const global uchar16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uchar16* a, const local uchar16* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local short* a, const global short* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global short* a, const local short* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local short* a, const global short* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global short* a, const local short* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local short2* a, const global short2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global short2* a, const local short2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local short2* a, const global short2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global short2* a, const local short2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local short3* a, const global short3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global short3* a, const local short3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local short3* a, const global short3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global short3* a, const local short3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local short4* a, const global short4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global short4* a, const local short4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local short4* a, const global short4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global short4* a, const local short4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local short8* a, const global short8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global short8* a, const local short8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local short8* a, const global short8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global short8* a, const local short8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local short16* a, const global short16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global short16* a, const local short16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local short16* a, const global short16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global short16* a, const local short16* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ushort* a, const global ushort* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ushort* a, const local ushort* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ushort* a, const global ushort* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ushort* a, const local ushort* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ushort2* a, const global ushort2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ushort2* a, const local ushort2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ushort2* a, const global ushort2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ushort2* a, const local ushort2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ushort3* a, const global ushort3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ushort3* a, const local ushort3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ushort3* a, const global ushort3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ushort3* a, const local ushort3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ushort4* a, const global ushort4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ushort4* a, const local ushort4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ushort4* a, const global ushort4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ushort4* a, const local ushort4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ushort8* a, const global ushort8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ushort8* a, const local ushort8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ushort8* a, const global ushort8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ushort8* a, const local ushort8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ushort16* a, const global ushort16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ushort16* a, const local ushort16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ushort16* a, const global ushort16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ushort16* a, const local ushort16* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local int* a, const global int* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global int* a, const local int* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local int* a, const global int* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global int* a, const local int* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local int2* a, const global int2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global int2* a, const local int2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local int2* a, const global int2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global int2* a, const local int2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local int3* a, const global int3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global int3* a, const local int3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local int3* a, const global int3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global int3* a, const local int3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local int4* a, const global int4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global int4* a, const local int4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local int4* a, const global int4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global int4* a, const local int4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local int8* a, const global int8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global int8* a, const local int8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local int8* a, const global int8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global int8* a, const local int8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local int16* a, const global int16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global int16* a, const local int16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local int16* a, const global int16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global int16* a, const local int16* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uint* a, const global uint* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uint* a, const local uint* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uint* a, const global uint* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uint* a, const local uint* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uint2* a, const global uint2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uint2* a, const local uint2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uint2* a, const global uint2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uint2* a, const local uint2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uint3* a, const global uint3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uint3* a, const local uint3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uint3* a, const global uint3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uint3* a, const local uint3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uint4* a, const global uint4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uint4* a, const local uint4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uint4* a, const global uint4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uint4* a, const local uint4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uint8* a, const global uint8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uint8* a, const local uint8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uint8* a, const global uint8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uint8* a, const local uint8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local uint16* a, const global uint16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global uint16* a, const local uint16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local uint16* a, const global uint16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global uint16* a, const local uint16* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local long* a, const global long* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global long* a, const local long* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local long* a, const global long* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global long* a, const local long* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local long2* a, const global long2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global long2* a, const local long2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local long2* a, const global long2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global long2* a, const local long2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local long3* a, const global long3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global long3* a, const local long3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local long3* a, const global long3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global long3* a, const local long3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local long4* a, const global long4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global long4* a, const local long4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local long4* a, const global long4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global long4* a, const local long4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local long8* a, const global long8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global long8* a, const local long8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local long8* a, const global long8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global long8* a, const local long8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local long16* a, const global long16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global long16* a, const local long16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local long16* a, const global long16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global long16* a, const local long16* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ulong* a, const global ulong* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ulong* a, const local ulong* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ulong* a, const global ulong* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ulong* a, const local ulong* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ulong2* a, const global ulong2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ulong2* a, const local ulong2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ulong2* a, const global ulong2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ulong2* a, const local ulong2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ulong3* a, const global ulong3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ulong3* a, const local ulong3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ulong3* a, const global ulong3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ulong3* a, const local ulong3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ulong4* a, const global ulong4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ulong4* a, const local ulong4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ulong4* a, const global ulong4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ulong4* a, const local ulong4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ulong8* a, const global ulong8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ulong8* a, const local ulong8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ulong8* a, const global ulong8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ulong8* a, const local ulong8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local ulong16* a, const global ulong16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global ulong16* a, const local ulong16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local ulong16* a, const global ulong16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global ulong16* a, const local ulong16* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local float* a, const global float* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global float* a, const local float* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local float* a, const global float* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global float* a, const local float* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local float2* a, const global float2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global float2* a, const local float2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local float2* a, const global float2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global float2* a, const local float2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local float3* a, const global float3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global float3* a, const local float3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local float3* a, const global float3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global float3* a, const local float3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local float4* a, const global float4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global float4* a, const local float4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local float4* a, const global float4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global float4* a, const local float4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local float8* a, const global float8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global float8* a, const local float8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local float8* a, const global float8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global float8* a, const local float8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local float16* a, const global float16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global float16* a, const local float16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local float16* a, const global float16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global float16* a, const local float16* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local double* a, const global double* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global double* a, const local double* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local double* a, const global double* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global double* a, const local double* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local double2* a, const global double2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global double2* a, const local double2* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local double2* a, const global double2* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global double2* a, const local double2* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local double3* a, const global double3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global double3* a, const local double3* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local double3* a, const global double3* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global double3* a, const local double3* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local double4* a, const global double4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global double4* a, const local double4* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local double4* a, const global double4* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global double4* a, const local double4* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local double8* a, const global double8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global double8* a, const local double8* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local double8* a, const global double8* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global double8* a, const local double8* b, size_t c, size_t f, event_t e);
;
__attribute__((overloadable)) event_t A(local double16* a, const global double16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t A(global double16* a, const local double16* b, size_t c, event_t d);
__attribute__((overloadable)) event_t B(local double16* a, const global double16* b, size_t c, size_t d, event_t e);
__attribute__((overloadable)) event_t B(global double16* a, const local double16* b, size_t c, size_t f, event_t e);
;

__attribute__((overloadable)) void C(int a, event_t* b);

__attribute__((overloadable)) void D(const global char* a, size_t b);
;
__attribute__((overloadable)) void D(const global char2* a, size_t b);
;
__attribute__((overloadable)) void D(const global char3* a, size_t b);
;
__attribute__((overloadable)) void D(const global char4* a, size_t b);
;
__attribute__((overloadable)) void D(const global char8* a, size_t b);
;
__attribute__((overloadable)) void D(const global char16* a, size_t b);
;
__attribute__((overloadable)) void D(const global uchar* a, size_t b);
;
__attribute__((overloadable)) void D(const global uchar2* a, size_t b);
;
__attribute__((overloadable)) void D(const global uchar3* a, size_t b);
;
__attribute__((overloadable)) void D(const global uchar4* a, size_t b);
;
__attribute__((overloadable)) void D(const global uchar8* a, size_t b);
;
__attribute__((overloadable)) void D(const global uchar16* a, size_t b);
;
__attribute__((overloadable)) void D(const global short* a, size_t b);
;
__attribute__((overloadable)) void D(const global short2* a, size_t b);
;
__attribute__((overloadable)) void D(const global short3* a, size_t b);
;
__attribute__((overloadable)) void D(const global short4* a, size_t b);
;
__attribute__((overloadable)) void D(const global short8* a, size_t b);
;
__attribute__((overloadable)) void D(const global short16* a, size_t b);
;
__attribute__((overloadable)) void D(const global ushort* a, size_t b);
;
__attribute__((overloadable)) void D(const global ushort2* a, size_t b);
;
__attribute__((overloadable)) void D(const global ushort3* a, size_t b);
;
__attribute__((overloadable)) void D(const global ushort4* a, size_t b);
;
__attribute__((overloadable)) void D(const global ushort8* a, size_t b);
;
__attribute__((overloadable)) void D(const global ushort16* a, size_t b);
;
__attribute__((overloadable)) void D(const global int* a, size_t b);
;
__attribute__((overloadable)) void D(const global int2* a, size_t b);
;
__attribute__((overloadable)) void D(const global int3* a, size_t b);
;
__attribute__((overloadable)) void D(const global int4* a, size_t b);
;
__attribute__((overloadable)) void D(const global int8* a, size_t b);
;
__attribute__((overloadable)) void D(const global int16* a, size_t b);
;
__attribute__((overloadable)) void D(const global uint* a, size_t b);
;
__attribute__((overloadable)) void D(const global uint2* a, size_t b);
;
__attribute__((overloadable)) void D(const global uint3* a, size_t b);
;
__attribute__((overloadable)) void D(const global uint4* a, size_t b);
;
__attribute__((overloadable)) void D(const global uint8* a, size_t b);
;
__attribute__((overloadable)) void D(const global uint16* a, size_t b);
;
__attribute__((overloadable)) void D(const global long* a, size_t b);
;
__attribute__((overloadable)) void D(const global long2* a, size_t b);
;
__attribute__((overloadable)) void D(const global long3* a, size_t b);
;
__attribute__((overloadable)) void D(const global long4* a, size_t b);
;
__attribute__((overloadable)) void D(const global long8* a, size_t b);
;
__attribute__((overloadable)) void D(const global long16* a, size_t b);
;
__attribute__((overloadable)) void D(const global ulong* a, size_t b);
;
__attribute__((overloadable)) void D(const global ulong2* a, size_t b);
;
__attribute__((overloadable)) void D(const global ulong3* a, size_t b);
;
__attribute__((overloadable)) void D(const global ulong4* a, size_t b);
;
__attribute__((overloadable)) void D(const global ulong8* a, size_t b);
;
__attribute__((overloadable)) void D(const global ulong16* a, size_t b);
;
__attribute__((overloadable)) void D(const global float* a, size_t b);
;
__attribute__((overloadable)) void D(const global float2* a, size_t b);
;
__attribute__((overloadable)) void D(const global float3* a, size_t b);
;
__attribute__((overloadable)) void D(const global float4* a, size_t b);
;
__attribute__((overloadable)) void D(const global float8* a, size_t b);
;
__attribute__((overloadable)) void D(const global float16* a, size_t b);
;
__attribute__((overloadable)) void D(const global double* a, size_t b);
;
__attribute__((overloadable)) void D(const global double2* a, size_t b);
;
__attribute__((overloadable)) void D(const global double3* a, size_t b);
;
__attribute__((overloadable)) void D(const global double4* a, size_t b);
;
__attribute__((overloadable)) void D(const global double8* a, size_t b);
;
__attribute__((overloadable)) void D(const global double16* a, size_t b);
;
__attribute__((overloadable)) void E(cl_mem_fence_flags a);
__attribute__((overloadable)) void F(void);
__attribute__((overloadable)) void G(cl_mem_fence_flags a);
__attribute__((overloadable)) void H(cl_mem_fence_flags a);
__attribute__((overloadable)) void I(cl_mem_fence_flags a);

cl_mem_fence_flags J(void* a);
__attribute__((overloadable)) uint K(void);
__attribute__((overloadable)) size_t L(uint a);
__attribute__((overloadable)) size_t M(uint a);
__attribute__((overloadable)) size_t N(uint a);
__attribute__((overloadable)) size_t O(uint a);
__attribute__((overloadable)) size_t P(uint a);
__attribute__((overloadable)) size_t Q(uint a);
__attribute__((overloadable)) size_t R(uint a);
__attribute__((overloadable)) size_t S(uint a);
__attribute__((overloadable)) size_t T(void);
__attribute__((overloadable)) size_t U(void);
__attribute__((overloadable)) event_t A(local char* a, const global char* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global char* a, const local char* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local char* a, const global char* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global char* a, const local char* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local char2* a, const global char2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global char2* a, const local char2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local char2* a, const global char2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global char2* a, const local char2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local char3* a, const global char3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global char3* a, const local char3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local char3* a, const global char3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global char3* a, const local char3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local char4* a, const global char4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global char4* a, const local char4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local char4* a, const global char4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global char4* a, const local char4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local char8* a, const global char8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global char8* a, const local char8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local char8* a, const global char8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global char8* a, const local char8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local char16* a, const global char16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global char16* a, const local char16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local char16* a, const global char16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global char16* a, const local char16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uchar* a, const global uchar* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uchar* a, const local uchar* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uchar* a, const global uchar* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uchar* a, const local uchar* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uchar2* a, const global uchar2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uchar2* a, const local uchar2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uchar2* a, const global uchar2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uchar2* a, const local uchar2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uchar3* a, const global uchar3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uchar3* a, const local uchar3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uchar3* a, const global uchar3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uchar3* a, const local uchar3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uchar4* a, const global uchar4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uchar4* a, const local uchar4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uchar4* a, const global uchar4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uchar4* a, const local uchar4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uchar8* a, const global uchar8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uchar8* a, const local uchar8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uchar8* a, const global uchar8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uchar8* a, const local uchar8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uchar16* a, const global uchar16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uchar16* a, const local uchar16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uchar16* a, const global uchar16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uchar16* a, const local uchar16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local short* a, const global short* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global short* a, const local short* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local short* a, const global short* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global short* a, const local short* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local short2* a, const global short2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global short2* a, const local short2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local short2* a, const global short2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global short2* a, const local short2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local short3* a, const global short3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global short3* a, const local short3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local short3* a, const global short3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global short3* a, const local short3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local short4* a, const global short4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global short4* a, const local short4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local short4* a, const global short4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global short4* a, const local short4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local short8* a, const global short8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global short8* a, const local short8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local short8* a, const global short8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global short8* a, const local short8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local short16* a, const global short16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global short16* a, const local short16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local short16* a, const global short16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global short16* a, const local short16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ushort* a, const global ushort* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ushort* a, const local ushort* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ushort* a, const global ushort* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ushort* a, const local ushort* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ushort2* a, const global ushort2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ushort2* a, const local ushort2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ushort2* a, const global ushort2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ushort2* a, const local ushort2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ushort3* a, const global ushort3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ushort3* a, const local ushort3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ushort3* a, const global ushort3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ushort3* a, const local ushort3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ushort4* a, const global ushort4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ushort4* a, const local ushort4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ushort4* a, const global ushort4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ushort4* a, const local ushort4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ushort8* a, const global ushort8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ushort8* a, const local ushort8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ushort8* a, const global ushort8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ushort8* a, const local ushort8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ushort16* a, const global ushort16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ushort16* a, const local ushort16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ushort16* a, const global ushort16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ushort16* a, const local ushort16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local int* a, const global int* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global int* a, const local int* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local int* a, const global int* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global int* a, const local int* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local int2* a, const global int2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global int2* a, const local int2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local int2* a, const global int2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global int2* a, const local int2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local int3* a, const global int3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global int3* a, const local int3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local int3* a, const global int3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global int3* a, const local int3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local int4* a, const global int4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global int4* a, const local int4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local int4* a, const global int4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global int4* a, const local int4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local int8* a, const global int8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global int8* a, const local int8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local int8* a, const global int8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global int8* a, const local int8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local int16* a, const global int16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global int16* a, const local int16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local int16* a, const global int16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global int16* a, const local int16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uint* a, const global uint* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uint* a, const local uint* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uint* a, const global uint* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uint* a, const local uint* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uint2* a, const global uint2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uint2* a, const local uint2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uint2* a, const global uint2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uint2* a, const local uint2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uint3* a, const global uint3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uint3* a, const local uint3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uint3* a, const global uint3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uint3* a, const local uint3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uint4* a, const global uint4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uint4* a, const local uint4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uint4* a, const global uint4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uint4* a, const local uint4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uint8* a, const global uint8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uint8* a, const local uint8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uint8* a, const global uint8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uint8* a, const local uint8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local uint16* a, const global uint16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global uint16* a, const local uint16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local uint16* a, const global uint16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global uint16* a, const local uint16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local long* a, const global long* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global long* a, const local long* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local long* a, const global long* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global long* a, const local long* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local long2* a, const global long2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global long2* a, const local long2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local long2* a, const global long2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global long2* a, const local long2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local long3* a, const global long3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global long3* a, const local long3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local long3* a, const global long3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global long3* a, const local long3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local long4* a, const global long4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global long4* a, const local long4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local long4* a, const global long4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global long4* a, const local long4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local long8* a, const global long8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global long8* a, const local long8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local long8* a, const global long8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global long8* a, const local long8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local long16* a, const global long16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global long16* a, const local long16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local long16* a, const global long16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global long16* a, const local long16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ulong* a, const global ulong* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ulong* a, const local ulong* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ulong* a, const global ulong* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ulong* a, const local ulong* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ulong2* a, const global ulong2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ulong2* a, const local ulong2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ulong2* a, const global ulong2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ulong2* a, const local ulong2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ulong3* a, const global ulong3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ulong3* a, const local ulong3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ulong3* a, const global ulong3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ulong3* a, const local ulong3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ulong4* a, const global ulong4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ulong4* a, const local ulong4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ulong4* a, const global ulong4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ulong4* a, const local ulong4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ulong8* a, const global ulong8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ulong8* a, const local ulong8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ulong8* a, const global ulong8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ulong8* a, const local ulong8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local ulong16* a, const global ulong16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global ulong16* a, const local ulong16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local ulong16* a, const global ulong16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global ulong16* a, const local ulong16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local float* a, const global float* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global float* a, const local float* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local float* a, const global float* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global float* a, const local float* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local float2* a, const global float2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global float2* a, const local float2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local float2* a, const global float2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global float2* a, const local float2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local float3* a, const global float3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global float3* a, const local float3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local float3* a, const global float3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global float3* a, const local float3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local float4* a, const global float4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global float4* a, const local float4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local float4* a, const global float4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global float4* a, const local float4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local float8* a, const global float8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global float8* a, const local float8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local float8* a, const global float8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global float8* a, const local float8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local float16* a, const global float16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global float16* a, const local float16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local float16* a, const global float16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global float16* a, const local float16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local double* a, const global double* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global double* a, const local double* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local double* a, const global double* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global double* a, const local double* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local double2* a, const global double2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global double2* a, const local double2* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local double2* a, const global double2* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global double2* a, const local double2* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local double3* a, const global double3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global double3* a, const local double3* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local double3* a, const global double3* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global double3* a, const local double3* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local double4* a, const global double4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global double4* a, const local double4* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local double4* a, const global double4* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global double4* a, const local double4* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local double8* a, const global double8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global double8* a, const local double8* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local double8* a, const global double8* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global double8* a, const local double8* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};
__attribute__((overloadable)) event_t A(local double16* a, const global double16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t A(global double16* a, const local double16* b, size_t c, event_t d) {
  uint e = N(2) * N(1) * N(0);
  uint f = c / e;
  uint g = P(2) * N(1) + P(1);
  g = g * N(0) + P(0);
  for (uint h = 0; h < f; h += 1) {
    *(a + g * 1) = *(b + g * 1);
    g += e;
  }
  if (g < c)
    *(a + g * 1) = *(b + g * 1);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(local double16* a, const global double16* b, size_t c, size_t d, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * 1) = *(b + i * d);
    i += g;
  }
  if (i < c)
    *(a + i * 1) = *(b + i * d);
  return 0;
  ;
}
__attribute__((overloadable)) event_t B(global double16* a, const local double16* b, size_t c, size_t f, event_t e) {
  uint g = N(2) * N(1) * N(0);
  uint h = c / g;
  uint i = P(2) * N(1) + P(1);
  i = i * N(0) + P(0);
  for (uint j = 0; j < h; j += 1) {
    *(a + i * f) = *(b + i * 1);
    i += g;
  }
  if (i < c)
    *(a + i * f) = *(b + i * 1);
  return 0;
  ;
};

__attribute__((overloadable)) void C(int a, event_t* b) {
  E((1 << 0) | (1 << 1));
}

__attribute__((overloadable)) void D(const global char* a, size_t b){};
__attribute__((overloadable)) void D(const global char2* a, size_t b){};
__attribute__((overloadable)) void D(const global char3* a, size_t b){};
__attribute__((overloadable)) void D(const global char4* a, size_t b){};
__attribute__((overloadable)) void D(const global char8* a, size_t b){};
__attribute__((overloadable)) void D(const global char16* a, size_t b){};
__attribute__((overloadable)) void D(const global uchar* a, size_t b){};
__attribute__((overloadable)) void D(const global uchar2* a, size_t b){};
__attribute__((overloadable)) void D(const global uchar3* a, size_t b){};
__attribute__((overloadable)) void D(const global uchar4* a, size_t b){};
__attribute__((overloadable)) void D(const global uchar8* a, size_t b){};
__attribute__((overloadable)) void D(const global uchar16* a, size_t b){};
__attribute__((overloadable)) void D(const global short* a, size_t b){};
__attribute__((overloadable)) void D(const global short2* a, size_t b){};
__attribute__((overloadable)) void D(const global short3* a, size_t b){};
__attribute__((overloadable)) void D(const global short4* a, size_t b){};
__attribute__((overloadable)) void D(const global short8* a, size_t b){};
__attribute__((overloadable)) void D(const global short16* a, size_t b){};
__attribute__((overloadable)) void D(const global ushort* a, size_t b){};
__attribute__((overloadable)) void D(const global ushort2* a, size_t b){};
__attribute__((overloadable)) void D(const global ushort3* a, size_t b){};
__attribute__((overloadable)) void D(const global ushort4* a, size_t b){};
__attribute__((overloadable)) void D(const global ushort8* a, size_t b){};
__attribute__((overloadable)) void D(const global ushort16* a, size_t b){};
__attribute__((overloadable)) void D(const global int* a, size_t b){};
__attribute__((overloadable)) void D(const global int2* a, size_t b){};
__attribute__((overloadable)) void D(const global int3* a, size_t b){};
__attribute__((overloadable)) void D(const global int4* a, size_t b){};
__attribute__((overloadable)) void D(const global int8* a, size_t b){};
__attribute__((overloadable)) void D(const global int16* a, size_t b){};
__attribute__((overloadable)) void D(const global uint* a, size_t b){};
__attribute__((overloadable)) void D(const global uint2* a, size_t b){};
__attribute__((overloadable)) void D(const global uint3* a, size_t b){};
__attribute__((overloadable)) void D(const global uint4* a, size_t b){};
__attribute__((overloadable)) void D(const global uint8* a, size_t b){};
__attribute__((overloadable)) void D(const global uint16* a, size_t b){};
__attribute__((overloadable)) void D(const global long* a, size_t b){};
__attribute__((overloadable)) void D(const global long2* a, size_t b){};
__attribute__((overloadable)) void D(const global long3* a, size_t b){};
__attribute__((overloadable)) void D(const global long4* a, size_t b){};
__attribute__((overloadable)) void D(const global long8* a, size_t b){};
__attribute__((overloadable)) void D(const global long16* a, size_t b){};
__attribute__((overloadable)) void D(const global ulong* a, size_t b){};
__attribute__((overloadable)) void D(const global ulong2* a, size_t b){};
__attribute__((overloadable)) void D(const global ulong3* a, size_t b){};
__attribute__((overloadable)) void D(const global ulong4* a, size_t b){};
__attribute__((overloadable)) void D(const global ulong8* a, size_t b){};
__attribute__((overloadable)) void D(const global ulong16* a, size_t b){};
__attribute__((overloadable)) void D(const global float* a, size_t b){};
__attribute__((overloadable)) void D(const global float2* a, size_t b){};
__attribute__((overloadable)) void D(const global float3* a, size_t b){};
__attribute__((overloadable)) void D(const global float4* a, size_t b){};
__attribute__((overloadable)) void D(const global float8* a, size_t b){};
__attribute__((overloadable)) void D(const global float16* a, size_t b){};
__attribute__((overloadable)) void D(const global double* a, size_t b){};
__attribute__((overloadable)) void D(const global double2* a, size_t b){};
__attribute__((overloadable)) void D(const global double3* a, size_t b){};
__attribute__((overloadable)) void D(const global double4* a, size_t b){};
__attribute__((overloadable)) void D(const global double8* a, size_t b){};
__attribute__((overloadable)) void D(const global double16* a, size_t b){};