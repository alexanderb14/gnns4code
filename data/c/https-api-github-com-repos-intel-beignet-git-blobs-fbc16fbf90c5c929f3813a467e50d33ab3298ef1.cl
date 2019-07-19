__kernel void A(__global int* a, __local int* b, __global int* c) {
  int d = get_local_id(0);
  int e = d % 12;
  if (d == 0) {
    for (int f = 0; f < 12; f = f + 1) {
      atomic_xchg(&b[f], 0);
    }
    atomic_xchg(&b[4], -1);
  }
  barrier(1);

  switch (e) {
    case 0:
      atomic_add(&b[e], 1);
      break;
    case 1:
      atomic_sub(&b[e], 1);
      break;
    case 2:
      atomic_add(&b[e], c[d]);
      break;
    case 3:
      atomic_sub(&b[e], c[d]);
      break;
    case 4:
      atomic_and(&b[e], ~(c[d] << (d / 16)));
      break;
    case 5:
      atomic_or(&b[e], c[d] << (d / 16));
      break;
    case 6:
      atomic_xor(&b[e], c[d]);
      break;
    case 7:
      atomic_min(&b[e], -c[d]);
      break;
    case 8:
      atomic_max(&b[e], c[d]);
      break;
    case 9:
      atomic_min((__local unsigned int*)&b[e], -c[d]);
      break;
    case 10:
      atomic_max((__local unsigned int*)&b[e], c[d]);
      break;
    case 11:
      atomic_cmpxchg(&(b[e]), 0, c[10]);
      break;
    default:
      break;
  }

  switch (e) {
    case 0:
      atomic_add(&a[e], 1);
      break;
    case 1:
      atomic_sub(&a[e], 1);
      break;
    case 2:
      atomic_add(&a[e], c[d]);
      break;
    case 3:
      atomic_sub(&a[e], c[d]);
      break;
    case 4:
      atomic_and(&a[e], ~(c[d] << (d / 16)));
      break;
    case 5:
      atomic_or(&a[e], c[d] << (d / 16));
      break;
    case 6:
      atomic_xor(&a[e], c[d]);
      break;
    case 7:
      atomic_min(&a[e], -c[d]);
      break;
    case 8:
      atomic_max(&a[e], c[d]);
      break;
    case 9:
      atomic_min((__global unsigned int*)&a[e], -c[d]);
      break;
    case 10:
      atomic_max((__global unsigned int*)&a[e], c[d]);
      break;
    case 11:
      atomic_cmpxchg(&a[e], 0, c[10]);
      break;
    default:
      break;
  }

  barrier(2);

  if (get_global_id(0) == 0) {
    for (e = 0; e < 12; e = e + 1)
      atomic_xchg(&a[e + 12], b[e]);
  }
}