__kernel void A(__global float* a) {
  a[get_global_id(0)] += 1.0f;
}