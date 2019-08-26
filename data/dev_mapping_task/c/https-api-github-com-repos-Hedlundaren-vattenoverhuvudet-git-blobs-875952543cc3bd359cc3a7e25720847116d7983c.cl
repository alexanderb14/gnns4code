typedef struct def_ParticleData {
  float density;

  float3 force;
  float color_field;
} ParticleData;

typedef struct def_VoxelGridInfo {
  uint3 grid_dimensions;

  uint total_grid_cells;

  float grid_cell_size;

  float3 grid_origin;

  uint max_cell_particle_count;
} VoxelGridInfo;

int3 A(const float3 a, const VoxelGridInfo b) {
  return clamp(convert_int3(__clc_floor((a - b.grid_origin) / b.grid_cell_size)), (int3)(0, 0, 0), (int3)(convert_int3(b.grid_dimensions) - (int3)(1, 1, 1)));
}

uint B(const uint3 a, const VoxelGridInfo b) {
  return a.x + b.grid_dimensions.x * (a.y + b.grid_dimensions.y * a.z);
}

__kernel void C(__global const float* a, __global volatile uint* b, __global volatile uint* c, const VoxelGridInfo d) {
  const uint e = get_global_id(0);
  const uint f = 3 * e;

  f h = A(g, d);
  const uint i = B(convert_uint3(h), d);

  const uint j = atomic_add(&(c[i]), 1);

  if (j >= d.max_cell_particle_count) {
    atomic_sub(&(c[i]), 1);
    return;
  }

  b[i * d.max_cell_particle_count + j] = e;
}

__kernel void D(__global volatile uint* a, __global volatile uint* b, const VoxelGridInfo c) {
  const uint d = get_global_id(0);
  b[d] = 0;

  for (uint e = 0; e < c.max_cell_particle_count; ++e) {
    a[d * c.max_cell_particle_count + e] = 0;
  }
}