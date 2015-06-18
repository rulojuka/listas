DEST=Example
CLASSPATH=.:${DEST}

Motor.class: Motor.java  Jogo.java
	javac  -Xlint:deprecation  -Xlint:unchecked  -d ${DEST} $+ 


Jogo.java: exemplo.dsc trad
	./trad $< > Jogo.java

clean:
	rm -rf  ${DEST}/* *.class    Jogo.java *~

run:
	cd ${DEST} ; java -classpath ${CLASSPATH} Motor


