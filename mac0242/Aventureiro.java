import java.util.*;

public class Aventureiro extends Objeto {
    Aventureiro() {
		super("mim");
		ativo=false;
    }

    void Move(Elemento l) {
		// O aventureiro nunca se inclui de fato nas listas
		
		// Arruma os locais
		if (l instanceof Lugar)
			Reposiciona((Lugar) l);
		else if (l instanceof Objeto)
			Reposiciona(((Objeto) l).local);
		else Reposiciona(null);
    }
	
    Elemento Pos() {
		return local;
    }
	
    Lugar Local() {
		return local;
    }
    
    void DescreveLocal() {
		if (local != null)
			local.Descreve();
    }
	
    boolean Carrega(Objeto o) {
		return Contem(o);
    }
	
    boolean Visivel(Objeto o) {
		if (Contem(o)) return true;
		if (local != null) 
			return (o.visivel && local.Contem(o));
		return false;
    }

    void Conteudo() { Conteudo("");}

    void Conteudo(String tab) {
		Objeto o;
		HashSet v = ListaObjs();
		if (!v.isEmpty()) {
			Motor.Mostra("Você tem:");
			for (Iterator at = v.iterator(); at.hasNext();) {
				o = (Objeto) at.next();
				Motor.Mostra(tab + "  " + o.getCurta() + ".");
				o.Conteudo(tab + "   ");
				o.Ativa();
			}
		}
    }
    String  Listagem() { return Listagem("");}

    String Listagem(String tab) {
		String s = "";
		Objeto o;
		HashSet v = ListaObjs();
		if (!v.isEmpty()) {
			for (Iterator at = v.iterator(); at.hasNext();) {
				o = (Objeto) at.next();
				s += tab + "  " + o.getCurta() + ".\n";
				s += o.Listagem(tab + "   ");
			}
		}
		return s;
    }
}
