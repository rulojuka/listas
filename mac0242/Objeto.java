import java.util.*;
import java.io.*;

public class Objeto extends Elemento {
    ArrayList<String> Adjs;		// Adjetivos
    boolean   ativo;			// Existência ou conhecimento
    boolean   visivel;
	
    // Localização
    Elemento  lugar;		// pode ser outro objeto
    Lugar     local;
	
    Objeto(String Nome) {
		this(Nome, "", "");
    }
	
    Objeto(String Nome, String C) {
		this(Nome, C,"");
    }
	
    Objeto(String Nome, String C, String L) {
		super(Nome, C, L);
		Adjs  = new ArrayList<String>();
		
		visivel  = true;
		ativo    = true;
    }
	
    // Adiciona um adjetivo
    void addAdj(String A) {
		Adjs.add(A);
    }    
	
    // Verifica se existe o adjetivo para este objeto
    boolean hasAdj(String A) {
		return Adjs.contains(A);
    }    
	
    // Lista de adjetivos
    ArrayList getAdjs() {
		return this.Adjs;
    }
	
    // Retorna uma String com todos os adjetivos
    String ListAdjs() {
		String s = new String("");
		for (Iterator at = Adjs.iterator(); at.hasNext();) {
			s +=  (String) at.next() + " ";
		}
		return s;
    }
	
    Elemento Pos() {
		return lugar;
    }
	
    void Ativa() {
		ativo = true;
    }
	
    void Destiva() {
		ativo = false;
		// retira do mundo..
		Move(null);
    }
	
    // Coloca em outro lugar
    void Move(Elemento l) {
		// retira se estiver em algum lugar
		if (lugar != null) {
			lugar.Retira(this);
		}
		else if (local != null) {
			local.Retira(this);
		}
		
		// Se exisir onde mandar
		if (l != null) 
			l.Inclui(this);
		
		// Arruma os locais
		if (l instanceof Lugar) {
			Reposiciona((Lugar) l);
		}
		else if (l instanceof Objeto) {
			lugar = l;
			Reposiciona(((Objeto) l).local);
		}
		else Reposiciona(null);
    }
	
    void Reposiciona(Lugar l) {
		local = l;
		
		for (Iterator at = Itens.iterator(); at.hasNext();) {
			Objeto o = (Objeto) at.next();
			o.Reposiciona(l);
		}	
    }
	
	
    public HashSet ListaObjs() {
		HashSet<Objeto> Validos = new HashSet<Objeto>();
		for (Iterator at = Itens.iterator(); at.hasNext();) {
			Objeto o = (Objeto) at.next();
			if (o.ativo && o.visivel) Validos.add(o);
		}
		return Validos;
    }
	
    void Conteudo() { Conteudo("");}
	
    void Conteudo(String tab) {
		Objeto o;
		HashSet v = ListaObjs();
		if (!v.isEmpty()) {
			//			Motor.Mostra(tab + "Dentro " + getDefI() + " " + getNome() + " existe:");
			for (Iterator at = v.iterator(); at.hasNext();) {
				o = (Objeto) at.next();
				//	Motor.MostraS(tab + "  " + o.getCurta());
				
				o.Conteudo(tab + "   ");
				o.Ativa();
			}
		}
    }
	
    String  Listagem(String tab) {
		String s = "";
		Objeto o;
		HashSet v = ListaObjs();
		if (!v.isEmpty()) {
			s+=tab + "Dentro " + getDefI() + " " + getNome() + " existe:\n";
			for (Iterator at = v.iterator(); at.hasNext();) {
				o = (Objeto) at.next();
				s += tab + "  " + o.getCurta()+".\n";
				s += o.Listagem(tab + "   ");
			}
		}
		return s;
    }
}
