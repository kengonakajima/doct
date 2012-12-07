#include <stdio.h>
#include <string.h>

int main(){
    char v[1024];
    int i;
    snprintf(v,sizeof(v),"%s",__VERSION__);
    for(i=0;v[i];i++) if(v[i]==' ' ) v[i]=0;
    puts(v);
    return 0;
}
