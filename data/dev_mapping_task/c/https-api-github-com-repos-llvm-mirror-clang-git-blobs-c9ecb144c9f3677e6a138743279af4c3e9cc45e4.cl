typedef unsigned int uint4 __attribute__((ext_vector_type(4))); kernel __attribute__((vec_type_hint(int))) __attribute__((reqd_work_group_size(1, 2, 4))) void A(int a) {
}

kernel __attribute__((vec_type_hint(uint4))) __attribute__((work_group_size_hint(8, 16, 32))) void B(int a) {
}

kernel __attribute__((intel_reqd_sub_group_size(8))) void C(int a) {
}