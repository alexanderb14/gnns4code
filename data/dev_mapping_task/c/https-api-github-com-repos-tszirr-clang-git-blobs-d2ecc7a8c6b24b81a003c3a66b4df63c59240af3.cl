__attribute__((amdgpu_num_vgpr(64))) kernel void A() {
}

__attribute__((amdgpu_num_sgpr(32))) kernel void B() {
}

__attribute__((amdgpu_num_vgpr(64), amdgpu_num_sgpr(32))) kernel void C() {
}

__attribute__((amdgpu_num_sgpr(20), amdgpu_num_vgpr(40))) kernel void D() {
}

__attribute__((amdgpu_num_vgpr(0))) kernel void E() {
}

__attribute__((amdgpu_num_sgpr(0))) kernel void F() {
}

__attribute__((amdgpu_num_vgpr(0), amdgpu_num_sgpr(0))) kernel void G() {
}