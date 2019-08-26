int A(int a, int b, int c) {
  int d = 1;
  for (int e = 0; e < b; ++e) {
    d = (d * a) % c;
  }
  return d;
}

float4 B(const int a) {
  float4 b = {0.0f, 0.0f, 0.0f, 0.0f};
  const int4 c = {1, 4, 5, 6};
  const float4 d = {+4.0f, -2.0f, -1.0f, -1.0f};
  const int4 e = {8, 8, 8, 8};

  for (int f = 0; f <= a; ++f) {
    int4 g = e * (int4)f + c;

        b += ((float4){
            (floaa)(Af, g            (floaa)(Af, g            (floaa)(Af, g            (floaa)(Af, g       } / convert_float4(g));

        b -= convert_float4(convert_int4(b));
  }

  for (int f = a + 1; f < a + 100; ++f) {
    int4 g = e * (int4)f + c;
    float h = pown(16.0f, a - f);

    b += (float4){h(float) g h(float) g h(float) g h(float) g};

    b -= convert_float4(convert_int4(b));
  }

  return b * d;
}

__kernel void C(const int a, const int b, __global float* c) {
  const float4 d = {1, 1, 1, 1};

  const int e = get_local_id(0) + get_group_id(0) * get_local_size(0);
  const int f = get_local_size(0);

  for (int g = e; g < b; g += f) {
    const int h = a + g - 1;
    float4 i = B(h);
    float j = i.s0 + i.s1 + i.s2 + i.s3;
    c[g] = j - (int)j + 1.0f;
  }
  barrier(2);
}