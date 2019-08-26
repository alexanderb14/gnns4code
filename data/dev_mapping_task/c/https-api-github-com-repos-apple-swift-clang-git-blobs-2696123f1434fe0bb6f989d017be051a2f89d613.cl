__attribute__((amdgpu_flat_work_group_size(0, 0))) kernel void A() {
}
__attribute__((amdgpu_waves_per_eu(0))) kernel void B() {
}
__attribute__((amdgpu_waves_per_eu(0, 0))) kernel void C() {
}
__attribute__((amdgpu_num_sgpr(0))) kernel void D() {
}
__attribute__((amdgpu_num_vgpr(0))) kernel void E() {
}

__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_waves_per_eu(0))) kernel void F() {
}
__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_waves_per_eu(0, 0))) kernel void G() {
}
__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_num_sgpr(0))) kernel void H() {
}
__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_num_vgpr(0))) kernel void I() {
}
__attribute__((amdgpu_waves_per_eu(0), amdgpu_num_sgpr(0))) kernel void J() {
}
__attribute__((amdgpu_waves_per_eu(0), amdgpu_num_vgpr(0))) kernel void K() {
}
__attribute__((amdgpu_waves_per_eu(0, 0), amdgpu_num_sgpr(0))) kernel void L() {
}
__attribute__((amdgpu_waves_per_eu(0, 0), amdgpu_num_vgpr(0))) kernel void M() {
}
__attribute__((amdgpu_num_sgpr(0), amdgpu_num_vgpr(0))) kernel void N() {
}

__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_waves_per_eu(0), amdgpu_num_sgpr(0))) kernel void O() {
}
__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_waves_per_eu(0), amdgpu_num_vgpr(0))) kernel void P() {
}
__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_waves_per_eu(0, 0), amdgpu_num_sgpr(0))) kernel void Q() {
}
__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_waves_per_eu(0, 0), amdgpu_num_vgpr(0))) kernel void R() {
}

__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_waves_per_eu(0), amdgpu_num_sgpr(0), amdgpu_num_vgpr(0))) kernel void S() {
}
__attribute__((amdgpu_flat_work_group_size(0, 0), amdgpu_waves_per_eu(0, 0), amdgpu_num_sgpr(0), amdgpu_num_vgpr(0))) kernel void T() {
}

__attribute__((amdgpu_flat_work_group_size(32, 64))) kernel void U() {
}
__attribute__((amdgpu_waves_per_eu(2))) kernel void V() {
}
__attribute__((amdgpu_waves_per_eu(2, 4))) kernel void W() {
}
__attribute__((amdgpu_num_sgpr(32))) kernel void X() {
}
__attribute__((amdgpu_num_vgpr(64))) kernel void Y() {
}

__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_waves_per_eu(2))) kernel void Z() {
}
__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_waves_per_eu(2, 4))) kernel void AA() {
}
__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_num_sgpr(32))) kernel void AB() {
}
__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_num_vgpr(64))) kernel void AC() {
}
__attribute__((amdgpu_waves_per_eu(2), amdgpu_num_sgpr(32))) kernel void AD() {
}
__attribute__((amdgpu_waves_per_eu(2), amdgpu_num_vgpr(64))) kernel void AE() {
}
__attribute__((amdgpu_waves_per_eu(2, 4), amdgpu_num_sgpr(32))) kernel void AF() {
}
__attribute__((amdgpu_waves_per_eu(2, 4), amdgpu_num_vgpr(64))) kernel void AG() {
}
__attribute__((amdgpu_num_sgpr(32), amdgpu_num_vgpr(64))) kernel void AH() {
}

__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_waves_per_eu(2), amdgpu_num_sgpr(32))) kernel void AI() {
}
__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_waves_per_eu(2), amdgpu_num_vgpr(64))) kernel void AJ() {
}
__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_waves_per_eu(2, 4), amdgpu_num_sgpr(32))) kernel void AK() {
}
__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_waves_per_eu(2, 4), amdgpu_num_vgpr(64))) kernel void AL() {
}

__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_waves_per_eu(2), amdgpu_num_sgpr(32), amdgpu_num_vgpr(64))) kernel void AM() {
}
__attribute__((amdgpu_flat_work_group_size(32, 64), amdgpu_waves_per_eu(2, 4), amdgpu_num_sgpr(32), amdgpu_num_vgpr(64))) kernel void AN() {
}

__attribute__((reqd_work_group_size(32, 2, 1))) kernel void AO() {
}
__attribute__((reqd_work_group_size(32, 2, 1), amdgpu_flat_work_group_size(16, 128))) kernel void AP() {
}