all:
	happy -gca Parparser.y
	alex -g Lexparser.x
	latex Docparser.tex; dvips Docparser.dvi -o Docparser.ps
	ghc --make Testparser.hs -o Testparser
clean:
	-rm -f *.log *.aux *.hi *.o *.dvi
	-rm -f Docparser.ps
distclean: clean
	-rm -f Docparser.* Lexparser.* Parparser.* Layoutparser.* Skelparser.* Printparser.* Testparser.* Absparser.* Testparser ErrM.* SharedString.* parser.dtd XMLparser.* Makefile*

