typedef float4 Point; typedef int4 IntPoint; typedef struct PointColor {
  Point point;
  Point color;
} PointColor;

uint A(uint a, uint b, uint c) {
  return (uint)((((((2166136261 ^ (uint)a) * 16777619) ^ (uint)b) * 16777619) ^ (uint)c) * 16777619);
}