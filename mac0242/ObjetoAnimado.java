import java.util.*;

public class ObjetoAnimado extends Objeto implements Animado {
    Verbo anima;
    ObjetoAnimado(String Nome, Verbo a) {
		this(Nome, "", "", a);
    }

    ObjetoAnimado(String Nome, String C, Verbo a) {
		this(Nome, C,"", a);
    }

    ObjetoAnimado(String Nome, String C, String L, Verbo a) {
		super(Nome, C, L);
		anima = a;
    }

    public void acao() {
		anima.acao(this);
    }
}

