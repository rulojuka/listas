//package Example;
import java.util.*;
import java.io.*;


public class Motor  {
    static Jogo G;

    public Motor() {
		G = new Jogo();
		imprimeDescricaoInicial();
		G.Av.DescreveLocal();
    }

    static public void main(String[] args) throws Exception {
		  Motor m = new Motor();
		  
		  Lugar curral = null;
		  Objeto vaca = null;
		  Objeto balde = null;
		  for( int i =0; i < Elemento.Mundo.size(); i++){
		    Elemento elemento = Elemento.Mundo.get(i);
		    if( elemento.getNome() == "vaca")
		    	vaca = (Objeto) elemento;
		    if( elemento.getNome() == "curral")
		    	curral = (Lugar) elemento;
		    if( elemento.getNome() == "balde")
		    	balde = (Objeto) elemento;
		  }
		  Queue<String> comandos = new LinkedList<String>();
		  comandos.add("olha vaca");
		  comandos.add("pega balde");
		  comandos.add("inventario");
		  while(!comandos.isEmpty()){
		  	  String atual = comandos.remove();
		  	  if(atual == "olha vaca" && vaca!=null)
		  	  	Mostra(vaca.getLonga());
		  	  if(atual == "pega balde" && balde!=null)
		  	  	G.Av.Inclui(balde);
		  	  if(atual == "inventario")
		  	  	G.Av.Conteudo("");
			  G.Av.DescreveLocal();
		  }

		  /*Imprime Objetos*/
		  /*
		  imprimeLinhaGrossa();
		  System.out.println("                       Objetos                          ");
		  for( int i =0; i < Elemento.Mundo.size(); i++){
		    Elemento elemento = Elemento.Mundo.get(i);
		    if( elemento.getClass() == Objeto.class || elemento.getClass() == ObjetoAnimado.class )
		      imprimeObjeto((Objeto)elemento);
		  }*/

		  /*Imprime Lugares*/
		  /*
		  imprimeLinhaGrossa();
		  System.out.println("                       Lugares                          ");
		  for( int i =0; i < Elemento.Mundo.size(); i++){
		    Elemento elemento = Elemento.Mundo.get(i);
		    if( elemento.getClass() == Lugar.class || elemento.getClass() == LugarAnimado.class )
		      imprimeLugar((Lugar)elemento);
		  }*/

		  /*Imprime Elementos Animados*/
		  /*
		  imprimeLinhaGrossa();
		  System.out.println("                    Elementos Animados                  ");
		  for( int i =0; i < Elemento.Mundo.size(); i++){
		    Elemento elemento = Elemento.Mundo.get(i);
        if (elemento.hasProp("animacao"));
          Mostra(  "    " + elemento.Nome );
		  }*/
    }

    static void Titulo(String s, String t) {
      System.out.println( s + ": " + t);
	  }

    static void Status() {
		  String s = G.Status.getLonga();
    }

    static void Inventario() {
    }

    static void Alerta(String s) {
    }

    static void Mostra(String s) {
      if(s.length()>56){
        Mostra( s.substring(0,56) );
        Mostra( s.substring(56,s.length()) );
      }
      else
        System.out.println( s );
    }

    static void imprimeObjeto(Objeto objeto){
      System.out.println(objeto.Nome);
      imprimeLinha();
      //System.out.println("Apelidos:");
      //imprimeLinha();
      System.out.println("Descrição Curta:");
      Mostra( "    " + objeto.getCurta() );
      imprimeLinha();
      System.out.println("Descrição Longa:");
      Mostra( "    " + objeto.getLonga() );
      Set s = objeto.Props.entrySet();
      if(s.size()>0){
        imprimeLinha();
        System.out.println("Propriedades:");
        Iterator it = s.iterator();
        while (it.hasNext())
          Mostra( "    " + it.next());
      }
      imprimeLinhaGrossa();
      System.out.println();
    }

    static void imprimeLugar(Lugar lugar){
      System.out.println(lugar.Nome);
      if( lugar.Itens.size()>0 ){
		  imprimeLinha();
		  System.out.println("Contém:");
		  for(int i=0;i< lugar.Itens.size();i++){
		  	Mostra( "    " + lugar.Itens.get(i).Nome);
		  }
      }
      Set s = lugar.Saidas.keySet();
      Saida aux;
      if(s.size()>0){
        imprimeLinha();
        System.out.println("Saídas:");
        Iterator it = s.iterator();
        while (it.hasNext()){
          aux = (Saida) lugar.Saidas.get(it.next()); /*Tentando fazer as saidas aparecerem*/
          Mostra( "    " + aux.destino);
        }
      }
      imprimeLinhaGrossa();
      System.out.println();
    }

    private static void imprimeLinha(){
      System.out.println("--------------------------------------------------------");
    }
    private static void imprimeLinhaGrossa(){
      System.out.println("========================================================");
    }
    
    private static void imprimeDescricaoInicial(){
    	Mostra("Esse jogo foi desenvolvido durante a disciplina de Laboratório de Programação II por: Alessandro Wagner Palmeira e João Marco Maciel da Silva.");
    	imprimeLinhaGrossa();
    	//Mostra("Seu nome é '" + G.Av.Nome + "'");
    	//imprimeLinha();
    }


}
