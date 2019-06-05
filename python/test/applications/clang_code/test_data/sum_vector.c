int sum_vec(int* vec, int size) {
    int sum = 0;

    for(int i=0; i<size; i++) {
        sum += vec[i];
    }

    return sum;
}