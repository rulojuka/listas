import java.util.*;
import java.io.*;

public class Elemento {
    static ArrayList<Elemento> Mundo = new ArrayList<Elemento>();
    static private int Nelem = 0;
	
    int     gid;				// identificador global
    String  Nome;
    HashMap<String,Verbo> Verbos; // Verbos
    HashMap<String,Object> Props; // Propriedades (pode ser qualquer coisa)
    ArrayList<Elemento> Itens;	  // Itens contidos
	
    String curta;				// Descricao curta
    String longa;				// Descricao longa
	
    // Artigos definido e indefinido, no singular e no plural
    String def;
    String indef;
    String defI;
    String indefI;
	
    Elemento(String Nome) {
		this.Nome = Nome;
		Mundo.add(this);
		gid = Nelem++;
		
		Verbos = new HashMap<String,Verbo>();
		Props  = new HashMap<String,Object>();
		Itens  = new ArrayList<Elemento>();
		
		// default é masculino, o certo seria verificar a frequencia
		def    = "o";
		indef  = "um";
		defI   = "do";
		indefI = "dum";
    }
	
    Elemento(String Nome, String Curta, String Longa) {
		this(Nome, Curta);
		this.longa = Longa;
    }
	
    Elemento(String Nome, String Curta) {
		this(Nome);
		this.curta = Curta;
    }
	
    // artigos
    void setArtigos(String d, String u, String di, String ui) {
		def    = d;
		indef  = u;
		defI   = di;
		indefI = ui;
    }
	
    // Descricao curta
    void setCurta(String A) {
		curta = A;
    }    
	
    String getCurta() {
		return curta;
    }    
	
	
    // Descricao longa
    void setLonga(String A) {
		longa = A;
    }
	
    String getLonga() {
		return longa;
    }
	
	
    // Adiciona uma propriedade
    void addProp(String p, Object a) {
		Props.put(p, a);
    }    
	
    // Modifica uma propriedade
    void setProp(String p, Object a) {
		Props.put(p, a);
    }    
	
    // Retorna uma propriedade
    Object getProp(String p) {
		return Props.get(p);
    }    
	
    // Verifica a presenca da propriedade
    boolean hasProp(String v) {
		return Props.containsKey(v);
    }
	
    // Adiciona um verbo
    void addVerbo(String v, Verbo a) {
		Verbos.put(v,a);
    }    
	
    // Verifica a presenca do verbo
    boolean hasVerbo(String v) {
		return Verbos.containsKey(v);
    }
	
    // Retorna o verbo
    Verbo getVerbo(String v) {
		if (!this.hasVerbo(v))  
			System.err.println(v + "  nao e aplicavel a  " + Nome);
		return Verbos.get(v);
    }
	
    // Executa o verbo
    void Acao(String v) {
		if (!this.hasVerbo(v))  
			System.err.println(v + "  nao e aplicavel a  " + Nome);
		Verbos.get(v).acao(this);	
    }
	
    // Objetos contidos
    void Inclui(Objeto o) {
		Itens.add(o);
    }
	
    void Retira(Objeto o) {
		Itens.remove(o);
    }
	
    boolean Contem(Objeto o) {
		if (Itens.contains(o)) return true;
		for (Iterator at = Itens.iterator(); at.hasNext();) {
			Objeto x = (Objeto) at.next();
			if (x.Contem(o)) return true;
		}
		return false;
    }
	
    // Nome e variações
    String getNome()  { return Nome; }
    String getDef()   { return def; }
    String getIndef() { return indef; }
    String getDefI()  { return defI; }
    String getIndefI(){ return indefI;}
	
}
