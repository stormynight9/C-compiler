all: flex bison compile

flex:
	@flex front-end.l

bison:
	@bison -d -v structfe.y

compile:
	@gcc -o structfe.out structfe.tab.c lex.yy.c

# try:
# 	@./structfe.out < add.c

clean:
	cmd //C del -f structfe.out structfe.tab.c structfe.tab.h lex.yy.c structfe.output