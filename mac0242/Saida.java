import java.util.*;
import java.io.*;

public class Saida extends Objeto  {
    Lugar destino;
    boolean aberta = true;

    Saida(String Nome) {
		this(Nome, "");
    }

    Saida(String Nome, String C) {
		this(Nome, C,"");
    }

    Saida(String Nome, String C, String L) {
		super(Nome, C, L);

		// o default é não ser visível, a saída aparece na descrição do lugar
		visivel = false;
    }

    void Abre() {aberta = true;}
    void Fecha() {aberta = false;}
    void Muda(Lugar l) {destino = l;}
}

