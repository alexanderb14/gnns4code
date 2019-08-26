inline int3 A(float3 a, float b) {
  return convert_int3_sat_rtn(a / b);
}
inline uint B(int3 a, uint b) {
  return (

             (((a.x * 19349663 ^ a.y * 73856093 ^ a.z * 83492791) << 6)

              + (a.x & 63) + 4 * (a.y & 63) + 16 * (a.z & 63)) &
             0x7FFFFFFF) %
         b;
}

void C(__global uint* a, uint b, uint c, uint* d, uint* e) {
  uint2 f = vload2(b, a);
  *d = f.x;
  *e = f.y;
}