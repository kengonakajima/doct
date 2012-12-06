#include <stdio.h>
#include <assert.h>

//= printf-various-patterns
//== ja: いろいろなprintf
#include <stdio.h>
void printf_various() {
    char s[50];
    snprintf( s, sizeof(s), "%8x", 123 );
    assert( strcmp(s,"      7b") == 0 );
    snprintf( s, sizeof(s), "%08x", 123 );
    assert( strcmp( s, "0000007b" ) == 0 );    
    snprintf(s,sizeof(s),"%08X", 123 );
    assert( strcmp( s, "0000007B" ) == 0 );        
}

//= printf-sprintf-snprintf
#include <stdio.h>
void printf_sprintf_snprintf() {
    printf( "hello world\n" );
    char s[50];
    sprintf( s, "hello world\n" );
    char t[8];
    snprintf( t, sizeof(t), "hello world\n" );
    assert( strcmp( t, "hello w" ) == 0 );
}

//= standard-file-io
//== ja: 標準入出力を用いたファイルの書き込みと読み込み
#include <stdio.h>
void std_file_io() {
    // Write 
    FILE *fp = fopen( "/tmp/hoge", "w" );
    fprintf( fp, "hello " );
    char data[5] = {'w','o','r','l','d' };
    fwrite( data, sizeof(char), 5, fp );
    fclose(fp);
    // Read
    fp = fopen( "/tmp/hoge", "r" );
    char readbuf[50];
    size_t readlen;
    readlen = fread( readbuf, sizeof(char), sizeof(readbuf), fp );
    // Check
    assert( readlen == 11 );
    readbuf[readlen] = '\0';
    assert( strcmp( readbuf, "hello world" ) == 0 );
}

int main() {
    printf_various();
    printf_sprintf_snprintf();
    std_file_io();
    return 0;
}
