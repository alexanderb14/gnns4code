typedef unsigned char uchar; typedef unsigned short ushort; typedef unsigned int uint; typedef unsigned long ulong; typedef __typeof__(sizeof(int)) size_t; typedef __typeof__((int*)0 - (int*)0) ptrdiff_t; typedef long int intptr_t; typedef long unsigned int uintptr_t; typedef char char2 __attribute__((ext_vector_type(2))); typedef char char3 __attribute__((ext_vector_type(3))); typedef char char4 __attribute__((ext_vector_type(4))); typedef char char8 __attribute__((ext_vector_type(8))); typedef char char16 __attribute__((ext_vector_type(16))); ; typedef uchar uchar2 __attribute__((ext_vector_type(2))); typedef uchar uchar3 __attribute__((ext_vector_type(3))); typedef uchar uchar4 __attribute__((ext_vector_type(4))); typedef uchar uchar8 __attribute__((ext_vector_type(8))); typedef uchar uchar16 __attribute__((ext_vector_type(16))); ; typedef short short2 __attribute__((ext_vector_type(2))); typedef short short3 __attribute__((ext_vector_type(3))); typedef short short4 __attribute__((ext_vector_type(4))); typedef short short8 __attribute__((ext_vector_type(8))); typedef short short16 __attribute__((ext_vector_type(16))); ; typedef ushort ushort2 __attribute__((ext_vector_type(2))); typedef ushort ushort3 __attribute__((ext_vector_type(3))); typedef ushort ushort4 __attribute__((ext_vector_type(4))); typedef ushort ushort8 __attribute__((ext_vector_type(8))); typedef ushort ushort16 __attribute__((ext_vector_type(16))); ; typedef int int2 __attribute__((ext_vector_type(2))); typedef int int3 __attribute__((ext_vector_type(3))); typedef int int4 __attribute__((ext_vector_type(4))); typedef int int8 __attribute__((ext_vector_type(8))); typedef int int16 __attribute__((ext_vector_type(16))); ; typedef uint uint2 __attribute__((ext_vector_type(2))); typedef uint uint3 __attribute__((ext_vector_type(3))); typedef uint uint4 __attribute__((ext_vector_type(4))); typedef uint uint8 __attribute__((ext_vector_type(8))); typedef uint uint16 __attribute__((ext_vector_type(16))); ; typedef long long2 __attribute__((ext_vector_type(2))); typedef long long3 __attribute__((ext_vector_type(3))); typedef long long4 __attribute__((ext_vector_type(4))); typedef long long8 __attribute__((ext_vector_type(8))); typedef long long16 __attribute__((ext_vector_type(16))); ; typedef ulong ulong2 __attribute__((ext_vector_type(2))); typedef ulong ulong3 __attribute__((ext_vector_type(3))); typedef ulong ulong4 __attribute__((ext_vector_type(4))); typedef ulong ulong8 __attribute__((ext_vector_type(8))); typedef ulong ulong16 __attribute__((ext_vector_type(16))); ; typedef float float2 __attribute__((ext_vector_type(2))); typedef float float3 __attribute__((ext_vector_type(3))); typedef float float4 __attribute__((ext_vector_type(4))); typedef float float8 __attribute__((ext_vector_type(8))); typedef float float16 __attribute__((ext_vector_type(16))); ; typedef double double2 __attribute__((ext_vector_type(2))); typedef double double3 __attribute__((ext_vector_type(3))); typedef double double4 __attribute__((ext_vector_type(4))); typedef double double8 __attribute__((ext_vector_type(8))); typedef double double16 __attribute__((ext_vector_type(16))); ; typedef half half2 __attribute__((ext_vector_type(2))); typedef half half3 __attribute__((ext_vector_type(3))); typedef half half4 __attribute__((ext_vector_type(4))); typedef half half8 __attribute__((ext_vector_type(8))); typedef half half16 __attribute__((ext_vector_type(16))); ; typedef uint cl_mem_fence_flags; typedef enum { memory_order_relaxed, memory_order_acquire, memory_order_release, memory_order_acq_rel, memory_order_seq_cst } memory_order;

typedef enum {
  memory_scope_work_item,
  memory_scope_work_group,
  memory_scope_device,
  memory_scope_all_svm_devices,
  memory_scope_sub_group,
} memory_scope;
void A(__global uchar* a, __global uchar* b, size_t c);
void B(__global uchar* a, __private uchar* b, size_t c);
void C(__global uchar* a, __local uchar* b, size_t c);
void D(__global uchar* a, __constant uchar* b, size_t c);
void E(__private uchar* a, __global uchar* b, size_t c);
void F(__private uchar* a, __private uchar* b, size_t c);
void G(__private uchar* a, __local uchar* b, size_t c);
void H(__private uchar* a, __constant uchar* b, size_t c);
void I(__local uchar* a, __global uchar* b, size_t c);
void J(__local uchar* a, __private uchar* b, size_t c);
void K(__local uchar* a, __local uchar* b, size_t c);
void L(__local uchar* a, __constant uchar* b, size_t c);

void M(__global uchar* a, __global uchar* b, size_t c);
void N(__global uchar* a, __private uchar* b, size_t c);
void O(__global uchar* a, __local uchar* b, size_t c);
void P(__global uchar* a, __constant uchar* b, size_t c);
void Q(__private uchar* a, __global uchar* b, size_t c);
void R(__private uchar* a, __private uchar* b, size_t c);
void S(__private uchar* a, __local uchar* b, size_t c);
void T(__private uchar* a, __constant uchar* b, size_t c);
void U(__local uchar* a, __global uchar* b, size_t c);
void V(__local uchar* a, __private uchar* b, size_t c);
void W(__local uchar* a, __local uchar* b, size_t c);
void X(__local uchar* a, __constant uchar* b, size_t c);

typedef int __attribute__((may_alias)) AI;
void A(__global uchar* a, __global uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__global AI*)(a + d)) = *((__global AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void M(__global uchar* a, __global uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void C(__global uchar* a, __local uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__global AI*)(a + d)) = *((__local AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void O(__global uchar* a, __local uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void B(__global uchar* a, __private uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__global AI*)(a + d)) = *((__private AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void N(__global uchar* a, __private uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void D(__global uchar* a, __constant uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__global AI*)(a + d)) = *((__constant AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void P(__global uchar* a, __constant uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void I(__local uchar* a, __global uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__local AI*)(a + d)) = *((__global AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void U(__local uchar* a, __global uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void K(__local uchar* a, __local uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__local AI*)(a + d)) = *((__local AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void W(__local uchar* a, __local uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void J(__local uchar* a, __private uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__local AI*)(a + d)) = *((__private AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void V(__local uchar* a, __private uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void L(__local uchar* a, __constant uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__local AI*)(a + d)) = *((__constant AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void X(__local uchar* a, __constant uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void E(__private uchar* a, __global uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__private AI*)(a + d)) = *((__global AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void Q(__private uchar* a, __global uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void G(__private uchar* a, __local uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__private AI*)(a + d)) = *((__local AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void S(__private uchar* a, __local uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void F(__private uchar* a, __private uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__private AI*)(a + d)) = *((__private AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void R(__private uchar* a, __private uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void H(__private uchar* a, __constant uchar* b, size_t c) {
  size_t d = 0;
  while ((d + 4) <= c) {
    *((__private AI*)(a + d)) = *((__constant AI*)(b + d));
    d += 4;
  }
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}
void T(__private uchar* a, __constant uchar* b, size_t c) {
  size_t d = 0;
  while (d < c) {
    a[d] = b[d];
    d++;
  }
}