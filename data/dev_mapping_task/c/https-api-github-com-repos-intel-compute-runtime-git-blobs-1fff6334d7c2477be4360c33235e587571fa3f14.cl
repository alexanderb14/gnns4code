__kernel __attribute__((reqd_work_group_size(16, 1, 1))) void A(sampler_t a, __read_only image2d_t b, __read_only image2d_t c, __global short2* d, __global short2* e, __global ushort* f) {
}

__kernel __attribute__((reqd_work_group_size(16, 1, 1))) void B(sampler_t a, __read_only image2d_t b, __read_only image2d_t c, uint d, uint e, uint f, uint g, __global short2* h, __global short2* i, __global short2* j, __global short2* k, __global char* l, __global ushort* m, __global ushort* n, __global ushort* o) {
}

__kernel __attribute__((reqd_work_group_size(16, 1, 1))) void C(sampler_t a, __read_only image2d_t b, __read_only image2d_t c, __read_only image2d_t d, __read_only image2d_t e, __read_only image2d_t f, uint g, uint h, uint i, short2 j, uchar k, __global short2* l, __global short2* m, __global char* n, __global short2* o, __global short2* p, __global char* q, __global ushort* r, __global ushort* s, __global ushort* t) {
}

__kernel void D(sampler_t a, int b, __read_only image2d_t c, __write_only image2d_t d) {
}

__kernel void E(sampler_t a, int b, __read_only image2d_t c, __read_only image2d_t d, __write_only image2d_t e) {
}

__kernel void F(sampler_t a, int b, __read_only image2d_t c, __read_only image2d_t d, __write_only image2d_t e, __write_only image2d_t f, __write_only image2d_t g) {
}