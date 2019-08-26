__kernel void A(__global unsigned int* a, float3 b) {
  size_t c = get_global_id(0);

  switch (c % 3) {
    case 0:
      a[c] = b.x;
      break;
    case 1:
      a[c] = b.y;
      break;
    case 2:
      a[c] = b.z;
      break;
    default:
      break;
  }
}