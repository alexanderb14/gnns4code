__kernel void A(__global float* a) {
  int b = (get_global_size(0) - 1) * 2;
  int c = b / 4;

  float d = 0.0f;
  float e = 0.0f;

  float4 f, g, h, i;
  float j = 2 * 0x1.921fb6p+1f * get_global_id(0) / b;

  for (int k = 0; k < c; k++) {
      g =k(float4) (j     k          j       k          j       k          j   h = cos(g);
      i = sin(g);

      f = vload4(k, a);
      d += dot(f, h);
      e -= dot(f, i);
  }
  barrier(2);

  if (get_global_id(0) == 0) {
    a[0] = d;
  } else if (get_global_id(0) == get_global_size(0) - 1) {
    a[1] = d;
  } else {
    a[get_global_id(0) * 2] = d;
    a[get_global_id(0) * 2 + 1] = e;
  }
}