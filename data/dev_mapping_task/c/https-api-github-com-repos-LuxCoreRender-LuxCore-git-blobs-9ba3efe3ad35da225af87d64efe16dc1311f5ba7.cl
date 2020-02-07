float A(const float3 a) {
  return acos(clamp(a.z, -1.f, 1.f));
}

float B(const float3 a) {
  const float b = atan2(a.y, a.x);
  return (b < 0.f) ? b + 2.f * 0x1.921fb6p+1f : b;
}

void C(const float3 a, float3* b, float3* c) {
  if (__clc_fabs(a.x) > __clc_fabs(a.y)) {
    float d = 1.f / sqrt(a.x * a.x + a.z * a.z);
    (*b).x = -a.z * d;
    (*b).y = 0.f;
    (*b).z = a.x * d;
  } else {
    float d = 1.f / sqrt(a.y * a.y + a.z * a.z);
    (*b).x = 0.f;
    (*b).y = a.z * d;
    (*b).z = -a.y * d;
  }

  *c = cross(a, *b);
}