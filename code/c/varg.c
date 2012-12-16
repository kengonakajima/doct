#include <assert.h>

//= variable-function-argument-wrap-sprintf
//== ja: 関数の可変長引数を使って sprintfをwrapする
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
void sprintf_func_demo( char *out_buf, size_t out_sz, const char *fmt, ... ) {
    char tmp[100];
    va_list argptr;
    va_start( argptr, fmt );
    vsnprintf( tmp, sizeof(tmp), fmt, argptr );
    va_end( argptr );
    snprintf( out_buf, out_sz, "hello:%s", tmp );
}

void varg_wrap_sprintf() {
    char buf[100];
    sprintf_func_demo( buf, sizeof(buf), "world:%d", 10 );
    assert( strcmp( buf, "hello:world:10" ) == 0 );
}    


//= variable-function-argument
//== ja: 関数の可変長引数を使って数値をsumする
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
int sum( int arg_num, ...) {
    int total = 0;
	va_list argptr;
    va_start( argptr, arg_num ); // set start address
    int i;
    for(i=0;i<arg_num;i++) {
        int param = va_arg( argptr, int ); // get parameter with type
        total += param;
    }
    va_end(argptr);
    return total;
}
void varg_sum() {
    int total;
    total = sum( 2, 1,2 );
    assert( total == 3 );
    total = sum( 5, 1,2,3,4,5 );
    assert( total == 15 );
    
}

//= variable-macro-argument
//== ja: プリプロセッサマクロの可変長引数を使って printfをwrapする
#define MY_SPRINTF(x,out,...) if(x)sprintf( out, __VA_ARGS__); else out[0]='\0';
void varg_macro() {
    char out[100];
    MY_SPRINTF( 1, out, "hello:%s", "world" );
    assert( strcmp( out, "hello:world" ) == 0 );
    MY_SPRINTF( 0, out, "%s", "hello" );
    assert( out[0] == '\0' );
}


// __STOP_DOCT_PARSE__

int main() {
	varg_wrap_sprintf();
    varg_sum();
    
    varg_macro();
    return 0;
}
