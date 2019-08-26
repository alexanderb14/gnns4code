typedef struct {
  unsigned int particles_count;
  float max_velocity;
  float fluid_density;
  float total_mass;
  float particle_mass;
  float dynamic_viscosity;
  float simulation_time;
  float target_fps;
  float h;
  float simulation_scale;
  float time_delta;
  float surface_tension_threshold;
  float surface_tension;
  float restitution;
  float K;

  float3 constant_acceleration;

  int grid_size_x;
  int grid_size_y;
  int grid_size_z;
  unsigned int grid_cell_count;
  float3 min_point, max_point;
} simulation_parameters;

typedef struct {
  float3 position, velocity, intermediate_velocity, acceleration;
  float density, pressure;
  unsigned int grid_index;
} particle;

typedef struct {
  float poly_6;
  float poly_6_gradient;
  float poly_6_laplacian;
  float spiky;
  float viscosity;
} precomputed_kernel_values;

unsigned int A(unsigned int a) {
  unsigned int b = 0x0;

  b |= (a & 0x1) >> 0;
  b |= (a & 0x8) >> 2;
  b |= (a & 0x40) >> 4;
  b |= (a & 0x200) >> 6;
  b |= (a & 0x1000) >> 8;
  b |= (a & 0x8000) >> 10;
  b |= (a & 0x40000) >> 12;
  b |= (a & 0x200000) >> 14;
  b |= (a & 0x1000000) >> 16;
  b |= (a & 0x8000000) >> 18;

  return b;
}

uint3 B(unsigned int a) {
  unsigned int b = 0x9249249;
  unsigned int c = a & b;
  unsigned int d = (a >> 1) & b;
  unsigned int e = (a >> e& b;d Aurn f;
}

unsigned int C(unsigned int a, unsigned int b, unsigned int c) {
  unsigned int d = a;
  unsigned int e = b;
  unsigned int f = c;

  d = (d | (d << 16)) & 0x030000FF;
  d = (d | (d << 8)) & 0x0300F00F;
  d = (d | (d << 4)) & 0x030C30C3;
  d = (d | (d << 2)) & 0x09249249;

  e = (e | (e << 16)) & 0x030000FF;
  e = (e | (e << 8)) & 0x0300F00F;
  e = (e | (e << 4)) & 0x030C30C3;
  e = (e | (e << 2)) & 0x09249249;

  f = (f | (f << 16)) & 0x030000FF;
  f = (f | (f << 8)) & 0x0300F00F;
  f = (f | (f << 4)) & 0x030C30C3;
  f = (f | (f << 2)) & 0x09249249;

  return d | (e << 1) | (f << 2);
}

uint2 D(uint a, global const unsigned int* b, simulation_parameters c);
uint2 D(uint a, global const unsigned int* b, simulation_parameters c){
  uint2 dc_cell_count > a a : cicles_count,
};

return d;
}
void kernel E(global const particle* a, global particle* b, simulation_parameters c) {
  const size_t d = get_global_id(0);
  b[d] = a[d];

  uint3 e = {0, 0, 0};

  float f = c.min_point.x;
  float g = c.min_point.y;
  float h = c.min_point.z;

  e.x = (uint)((a[d].position.x - f) / (c.h * 2));
  e.y = (uint)((a[d].position.y - g) / (c.h * 2));
  e.z = (uint)((a[d].position.z - h) / (c.h * 2));

  uint i = C(e.x, e.y, e.z);

  b[d].grid_index = i;
}