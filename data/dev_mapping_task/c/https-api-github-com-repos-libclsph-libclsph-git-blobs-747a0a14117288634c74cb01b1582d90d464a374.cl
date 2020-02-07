typedef struct { float3 old_position, new_position, next_velocity; } advection_result;

advection_result A(float3 a, float3 b, float3 c, float d, float e) {
  advection_result f;

  f.old_position = a;

  f.next_velocity = b + c * e;

  if (length(f.next_velocity) > d) {
    f.next_velocity = normalize(f.next_velocity) * d;
  }

  f.new_position = a + f.next_velocity * e;

  return f;
}