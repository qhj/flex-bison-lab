out:
	mkdir -p out

fb1-1: out fb1-1.l
	flex -o out/lex.yy.c fb1-1.l
	gcc -o out/$@ out/lex.yy.c -lfl

fb1-3: out fb1-3.l
	flex -o out/lex.yy.c fb1-3.l
	gcc -o out/$@ out/lex.yy.c -lfl

fb1-4: out fb1-4.l
	flex -o out/lex.yy.c fb1-4.l
	gcc -o out/$@ out/lex.yy.c -lfl

fb1-5: out fb1-5.l fb1-5.y
	bison -d fb1-5.y -o out/fb1-5.tab.c
	flex -o out/lex.yy.c fb1-5.l
	gcc -o out/$@ out/fb1-5.tab.c out/lex.yy.c -lfl

clean:
	rm -rf out