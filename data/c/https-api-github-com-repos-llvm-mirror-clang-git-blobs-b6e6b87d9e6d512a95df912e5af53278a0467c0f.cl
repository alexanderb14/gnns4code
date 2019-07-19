__attribute__((overloadable)) void A(int* a) {
}

__attribute__((overloadable)) void B(private int* a) {
}

__attribute__((overloadable)) void B(global int* a) {
}

__attribute__((overloadable)) void B(local int* a) {
}

__attribute__((overloadable)) void B(constant int* a) {
}