float4 A(void); __kernel void B() {
  float4 a = A();
  float4 b = A();
  float4 c = A();
  float4 d = ((c <= 0.1f) ? (b) : (a));
}