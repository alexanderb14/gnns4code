__kernel void A(__global int* a, __global int* b) {
  switch (get_global_id(0)) {
    case 0:
      a[get_global_id(0)] = b[get_global_id(0) + 4];
      break;
    case 1:
      a[get_global_id(0)] = b[get_global_id(0) + 14];
      break;
    case 2:
      a[get_global_id(0)] = b[get_global_id(0) + 13];
      break;
    case 6:
      a[get_global_id(0)] = b[get_global_id(0) + 11];
      break;
    case 7:
      a[get_global_id(0)] = b[get_global_id(0) + 10];
      break;
    case 10:
      a[get_global_id(0)] = b[get_global_id(0) + 9];
      break;
    case 12:
      a[get_global_id(0)] = b[get_global_id(0) + 6];
      break;
    default:
      a[get_global_id(0)] = b[get_global_id(0) + 8];
      break;
  }
}