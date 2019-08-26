__kernel void A(__global bool* a, const int b) {
  const uint c = get_global_id(0);

  if (c < b) {
    a[c] = false;
  }
}

__kernel void B(__global float* a, const int b) {
  const uint c = get_global_id(0);

  if (c < b) {
    a[c] = 0.0f;
  }
}

__kernel void C(__global int* a, const int b) {
  const uint c = get_global_id(0);

  if (c < b) {
    a[c] = 0;
  }
}