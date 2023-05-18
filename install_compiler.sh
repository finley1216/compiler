echo rr9874563210 | sudo -S apt-get install flex -y
echo rr9874563210 | sudo -S apt-get install bison -y
cd Compiler-sample
lex lex.l
yacc -d yacc.y
cc lex.yy.c y.tab.c -o Compile
./Compile < sample1.c
./Compile < sample4.c
gcc -S -masm=intel sample3.c -o stt && cat stt
sudo apt-get install clang llvm -y
clang --version && llc --version
clang -S -emit-llvm sample3.c && ls && cat sample3.ll
opt -S -globalopt -loop-simplify -mem2reg sample3.ll
llc sample3.ll && ls
cat sample3.s
as sample3.s -o sample3.o
ld -o sample_ex -dynamic-linker /lib64/ld-linux-x86-64.so.2 /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o sample3.o -lc /usr/lib/x86_64-linux-gnu/crtn.o && ls
./sample_ex
