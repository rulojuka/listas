import java.util.*;
import java.io.*;

public class Lugar extends Elemento {
    HashMap<String,Objeto> Saidas;	// Conexoes para outros lugares
    boolean   visitado;
	
    Lugar(String Nome) {
		this(Nome, "", "");
    }
	
    Lugar(String Nome, String C) {
		this(Nome, C, "");
    }
	
    Lugar(String Nome, String C, String L) {
		super(Nome, C, L);
		Saidas = new HashMap<String,Objeto>();
		visitado = false;
    }
	
    public void Descreve() {
		//Motor.Titulo(getCurta(), getLonga());
		if (!visitado) {
			Motor.Mostra(getCurta());
			Longa();	
			visitado = true;
			mostraObjetos();
		}
		else
			Curta();
		Motor.Mostra("--------------------------------------------------------");
    }
	
    public void Longa() {
		Motor.Mostra(super.getLonga());
		Saidas();
		Objetos();
    }
	
    public void Curta() {
		Motor.Mostra(super.getCurta());
		Objetos();
    }
	
    // Adiciona uma saida
    void addSaida(String s, Saida l) {
		Saidas.put(s, l);
    }    
	
    // Retorna  uma saida
    Saida getSaida(String s) {
		return (Saida) Saidas.get(s);
    }    
	
    // Modifica uma saida
    void setSaida(String s, Objeto a) {
		Saidas.put(s, a);
    }    
	
    // Verifica a presenca da saida
    boolean hasSaida(String s) {
		return Saidas.containsKey(s);
    }
	
    // Verifica se um objeto e visivel
    boolean isVisivel(Objeto o) {
		return Contem(o) && o.visivel;
    }
	
    HashSet ListaObjs() {
		HashSet<Objeto> Validos = new HashSet<Objeto>();
		for (Iterator at = Itens.iterator(); at.hasNext();) {
			Objeto o = (Objeto) at.next();
			if (o.visivel) Validos.add(o);
		}
		return Validos;
    }
    
    void mostraObjetos(){
    	Objeto o;
		HashSet v = ListaObjs();
		if (!v.isEmpty()) {
			Motor.Mostra("Aqui tem:");
			for (Iterator at = v.iterator(); at.hasNext();) {
				o = (Objeto) at.next();
				Motor.Mostra("\t" + o.getCurta());
			}
		}
    }
	
    void Objetos() {
		Objeto o;
		HashSet v = ListaObjs();
		if (!v.isEmpty()) {
			//Motor.Mostra("Aqui tem:");
			for (Iterator at = v.iterator(); at.hasNext();) {
				o = (Objeto) at.next();
				//Motor.Mostra("\t" + o.getCurta());
				o.Ativa();
				o.Conteudo("\t   ");
			}
		}
    }
	
	
    void Saidas() {
		Saida s;
		HashMap<Saida,Saida> SaidasJaMostradas = new HashMap<Saida,Saida>();
		
		for (Iterator at = Saidas.keySet().iterator(); at.hasNext();) {
			String x = (String) at.next();
			s = (Saida)Saidas.get(x);
			if (s.ativo) {
				if (!SaidasJaMostradas.containsKey(s)) {
					//Motor.Mostra(s.getLonga());
					SaidasJaMostradas.put(s,s);
				}
			}
		}
		
    }
 }
