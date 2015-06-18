import java.util.*;

public class LugarAnimado extends Lugar implements Animado {
    Verbo anima;
    LugarAnimado(String Nome, Verbo a) {
		this(Nome, "", "", a);
    }

    LugarAnimado(String Nome, String C, Verbo a) {
		this(Nome, C,"", a);
    }

    LugarAnimado(String Nome, String C, String L, Verbo a) {
		super(Nome, C, L);
		anima = a;
    }

    public void acao() {
		anima.acao(this);
    }
}

