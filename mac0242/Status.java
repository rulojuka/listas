import java.util.*;
import java.io.*;

class Status extends Elemento implements Animado {
    static int rodadas = 0;
    static int pontos = 0;
    Verbo anima;
    Status() {
		super("Status", "","");
		longa = "";
        curta = "";
		//anima = new Atualiza();
    }

    public void acao() {
		//anima.acao();
    }
}
