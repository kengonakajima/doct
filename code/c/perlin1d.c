

//= generate-1-dimensional-perlin-noise
//== ja: 特殊な最適化や最小化を使わずに、1次元のパーリンノイズを生成する
//== en: generate 1-dimensional perlin noise with no special optimization or minimization

#include <stdio.h>
#include <stdlib.h>
void perlin1D( float *out, int n ) {
    float *tables[30];
    int tablesz[30];
    int tn = n;
    int units[30];
    int table_n;
    int u = 1;
    int i,j;
    for(i=0;i<30;i++) {
        printf("allocate table sz:%d u:%d\n", tn ,u );        
        tables[i] = (float*) malloc(tn*sizeof(float));
        tablesz[i] = tn+1;
        units[i] = u;
        for(j=0;j<tn+1;j++) {
            tables[i][j] = (float)rand() / (float)(RAND_MAX);
        }
        u *= 2;
        tn /= 2;
        table_n = i + 1;
        if( tn < 4 ) break;
    }

    for(i=0;i<n;i++) {
        float tot = 0;
        for(j=0;j<table_n;j++){
            int ind_in_table = i / units[j];
            int mod = i % units[j];
            float t = (float)mod / (float)units[j];
            float zoom = 0.5 / units[table_n-1-j];
            float val0 = tables[j][ind_in_table];
            float val1 = tables[j][ind_in_table+1];
            float val = val0 * (1-t) + t * val1;
            tot += val * zoom;
        }
        out[i] = tot;
    }
    for(i=0;i<8;i++) free(tables[i]);
}

void doct_test() {
    float v[100];
    int i,j;
    perlin1D( v, 100 );
    for(i=0;i<100;i++){
        int n = v[i] * 50;
        for(j=0;j<n;j++) printf(" ");
        printf("*\n");
    }    
}

