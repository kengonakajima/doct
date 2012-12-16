//= bench-simple-loop
//== ja: 単純な1億回のループ
void doct_test() {
    int tot = 0;
    const int n = 100000000;
    int i;
    for(i=0;i<n;i++){
        tot += i;
    }
    assert( tot == 887459712 );
}
