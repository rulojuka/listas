#!/usr/bin/perl 
use encoding 'utf8';

################################################################
# O arquivo de entrada é uma sequência de blocos, ligados por um

# separador (':::').  O formato de cada bloco é:
# -------------------------------------------------------------- 
# [TIPO] [NOME] 
# [Conteúdo]
# -------------------------------------------------------------- 
# [TIPO] é um de (lugar, objeto, saida, acao, inicio atualiza)
# [NOME] é um identificador
# [Conteúdo] depende do tipo.  Em geral é uma sequência de pares
# do tipo propriedade, valor, da seguinte forma:
# --------------------------------------------------------------
# [propriedade] = [valor]
# --------------------------------------------------------------
# ou
# --------------------------------------------------------------
# [propriedade] = {
#   [valor]
# }
# --------------------------------------------------------------
# Neste segundo caso, [valor] pode ocupar várias linhas
#
# Para ação, o [Conteúdo] é um código de uma rotina, que será traduzida 
# para java.

# Separador dos blocos
$/="\n:::\n";

# Tipos de blocos
%Tipos = (
	  lugar  => \&Lugar,
	  sala   => \&Lugar,
	  objeto => \&Objeto,
	  saida  => \&Saida,
	  acao   => \&Funcao,
	  funcao => \&Funcao,
	  inicio => \&Inicio,
	  atualiza => \&Atualiza
	 );

# Auxiliar para tratar os tipos em java
%Values = (
	   Boolean => "booleanValue()",
	   Integer => "intValue()"
);

%Defaults = (
	   Boolean => "false",
	   Integer => 0
);

# Leitura dos blocos
while(<>) {
  chomp;			# Arranca o separador
  s/#.*?\n$//gms;		# Comentários
  next unless /\S/;		# Linha vazia

  # o bloco começa com o tipo
  do {
    Erro("Tipo indefinido");
    next;
  } unless (s/^(\w+)\s*//);

  # pega o nome da variável e dos símbolos
  $tipo = lc $1;
  s/^(\w+)\s*(:([\w\s]+))?$//m;
  my $nome  = $1;
  my @alias = split " ", $3;
  @alias = ($nome) unless @alias;

  # chama a rotina de tratamento correspondente
  if (exists $Tipos{$tipo}) {
    next unless &{$Tipos{$tipo}}($nome, \@alias)
  }
  else {
    Erro("Tipo inválido");
    next;
  }
}

# Escreve o programa:
print <<END_JAVA;
import java.util.*;
import java.io.*;

public class Jogo {
    static Animado anima[];	// lista dos elementos que devem ser animados
    static Aventureiro Av = new Aventureiro();
    static Status Status;

$GlobObj

    Jogo() {

        // Verbos
$Verbos

        // Objetos e Lugares
$Objetos

        // Adjetivos
$Adjetivos

        // Saidas
$Saidas

        // Verbos específicos
$AtuVerbos

        Status = new Status();

       // Aventureiro
       Av.Move($AQUI);

       Animado an[] = {
$Animacoes              Status
	};

	anima = an;
$Inicio
    }


    Elemento Pos() {
        return Av.Pos();
    }

    void Move(Lugar l) {
        Av.Move(l);
    }

}

$decverb
END_JAVA

# atualização default
if ($decverb !~ /class\s+Atualiza/) {
  print <<END_JAVA;
class Atualiza extends Verbo
{
     public String getNome() {return "Atualiza";}
     public void acao(Elemento o) {
           int rodadas = ++Motor.G.Status.rodadas;
           o.setLonga(rodadas  + " passo" + (rodadas != 1 ? "s." : "."));
     }
}
END_JAVA
}

# Pega um valor
sub Valor {
  my $val;
  $val = $1 if s/^\s*\{(.*?)\}\s*//s || s/^\s*(.*)\n?//;
  return $val;
}

# Pega um campo
sub Campo {
  my ($campo,$valor);
  my $tipo;

  $campo=$1 if s/^\s*(\w+)=//s;
  return if $campo eq "";

  $valor = Valor;

  if ($valor =~ /^\d+$/) {	# valor numérico
    $valor = "new Integer($valor)";
    $tipo = "Integer";
  }
  elsif ($valor =~ /^(true|false|V|F|sim|n[aã]o)$/i) {
    $valor =~ s/V|sim/true/i;
    $valor =~ s/f|n[aã]o/false/i;
    $valor = "new Boolean($valor)";
    $tipo = "Boolean";
  }
  else {
      $valor =~ s/"/\\"/g;	# proteger as aspas
      $valor =~ s/\n/\\n/gs;	# uma única linha
  }

  return ($campo,$valor, $tipo);
}

# Define um Elemento
sub Define {
  my $tipo= shift;
  my $var = shift;
  my $tmp = shift;

  my @a = @{$tmp};
  my $nome =  $a[0];

  my $type;

  my $anima = "";		# animação. se houver

  # outras variáveis auxiliares
  my ($c,$v);			# campo e valor

  # verifica animação
  if (s/^\s*animacao\s*=\s*(\w+)\s*?$//im) {
    $tipo .= "Animado";
    $anima = ", new $1()";
    $Animacoes .= <<FIM
              $var,
FIM
  }

  $GlobObj .= <<FIM;
    //$nome
    $tipo $var = new $tipo("$nome"$anima);
FIM

  # o primeiro lugar definido é o ponto de partida
  $AQUI = $var if ($tipo =~ /^Lugar/) && $AQUI eq undef;


  # pega os campos
  while ($_) {
    s/#.*?$//mg;
    s/^\s+//m;
    last unless /\S/;
    # Verificação de campos especiais (adjetivos, inclui e verbos).
    # Objetos significa os objetos contidos neste elemento (por exemplo
    # as coisas dentro de uma bolsa ou de uma sala.

    # Específicos de objeto
    if ($tipo =~ /^(Objeto|Saida)/) {
      if (s/^\s*adjetivos\s*=\s*([\w\s]+?)\s*?$//mis) {	# adjetivos
		my @adjs = split / /, $1;
      }
      elsif (s/^\s*invisivel\s*$//mis) { # invisivel
		$Objetos .=  qq/\t$var.visivel=false;\n/;
      }
      elsif (s/^\s*inativo\s*$//mis) { # ativo é default
		$Objetos .=  qq/\t$var.ativo=false;\n/;
      }
      elsif ($tipo =~/Saida/) {
		if (s/^\s*fechada\s*$//mis) { # aberta é default
		  $Objetos .=  qq/\t$var.aberta=false;\n/;
		}
		elsif (s/^\s*destino\s*=\s*(\w+)\s*$//mis) {
		  $Objetos .=  qq/\t$var.destino=$1;\n/;
		}
      }
    }
    # Específicos de Lugar
    elsif ($tipo =~/^Lugar/) {
      # As saidas devem ser adicionadas depois de todas as declarações
      # de lugares
      if (s/^\s*saida\s+(\w+)\s*=\s*(\w+)\s*?$//mis) {
		my $ss = lc $1;
		$Saidas .=  qq/\t$var.addSaida("$ss", $2);\n/;
      }
    }

    # Comuns aos dois

    # Ações
    if (s/^\s*acao\s*=
		  \s*(\w+)\s* #nome base
#           :\s*([\w\s]+?)\s*\n # grafias
		 //xi) {
# pega as grafias
#      my @args = split / /,$2;

      my $var1  = lc $1;

#      # inserção na tabela de símbolos
#      for my $a (@args) {
#		$Objetos .= qq/\t$var.addVerbo("$a", _$var1);\n/;
#      }

       $VerboEspecifico{"_$var1"} = [@{$VerboEspecifico{"_$var1"}}, $var];
    }
    elsif (s/^curta\s*=\s*"([^"]*?)"\s*?$//mis) { # descrição curta
      $Objetos .= qq/\t$var.setCurta("$1");\n/;
    }
    elsif (s/^longa\s*=\s*"([^"]*?)"\s*?$//mis) { # descrição longa
      my $c = $1;
      $c =~ s/\\n/\\n" +\n\t\t"/gs;
      $Objetos .= qq/\t$var.setLonga("$c");\n/;
    }
    elsif (s/^\s*artigos\s*=\s*([\w\s]+?)\s*?$//mis) { # artigos
      my @arts = split / /, $1;
      my $arts;
      for $tmp (@arts) {
	$arts .= qq/"$tmp", /;
      }
      chop $arts;
      chop $arts;
      $Objetos .= qq/\t$var.setArtigos($arts);\n/;
    }
    elsif (s/^contem\s*=\s*\(([\w\s,]+?)\)//im) { # ítens
      my @itens = split /\s*,\s*/, $1;
      for my $i (@itens) {
	$Objetos .= "\t$i.Move($var);\n";
      }
    }
    elsif (/\S/) {			# propriedades
      ($c,$v, $type) = Campo();
      $Objetos .= qq/\t$var.addProp("$c",$v);\n/;
      $Types{"$c"} = $type;
    }
    else {
      s/^\s+//;
    }
  }
  1;
}

# Define um lugar
sub Lugar {
  Define("Lugar", @_);
}

# Define um objeto
sub Objeto {
  Define("Objeto", @_);
}

# Define uma saida
sub Saida {
  Define("Saida", @_);
}

# Define uma função
# Acao [nome] : [grafias]
sub Funcao {
  my $nome = shift;		# nome da função
  my $tmp  = shift;
  my $code;			# código traduzido

  # pega as grafias
  my @args = @{$tmp};

  my $var   = lc $nome;

  # Construção
  $Verbos .= "\t$nome _$var = new $nome();\n";

  # inserção na tabela de símbolos
  unless (exists $VerboEspecifico{"_$var"}) {
  }
  else {
	for my $obj (@{$VerboEspecifico{"_$var"}}) {
#	  print "Verbo de $obj: $var\n";
	  for my $a (@args) {
		$AtuVerbos .= qq/\t$obj.addVerbo("$a", _$var);\n/;
	  }
	}
  }

  $code = <<FIM;

// $nome
class $nome extends Verbo
\{
     public String getNome() {return "$args[0]";}
FIM

      $code .= <<FIM if /\(\s*\d+\s*\)\s*\{/sm;
     static Random r = new Random();
FIM

  my @cods = split /%%/;

  for my $cc (@cods) {
    my $trans = "Elemento e1";

    $decobj = "\n      Objeto o = (Objeto) e1;\n";

    if ($cc =~ s/^\s*(2|bi(transitivo))\s*//ism) {
      $trans = "Elemento e1, Elemento e2";
      $decobj = <<FIM;
          Objeto o  = (Objeto) e1;
          Objeto oi = (Objeto) e2;
FIM
    }
    elsif ($cc =~ s/^\s*(0|in(transitivo))\s*//ism) {
      $trans = "";
      $decobj="";
    }
    else {
      $cc =~ s/^\s*(1|transitivo)\s*//ism;
    }

    $decobj .= <<FIM if $cc=~ /\bAQUI\b/;
       Lugar AQUI = (Lugar) Motor.G.Av.Pos();
FIM

    if ($cc =~ s/^\s*java:\s*//ism) {
      $code .=  $_;
    }
    else {
      $code .= <<FIM;
     public void acao($trans) \{$decobj
FIM

      $code .= trad($cc);
      $code .= "    }\n";
    }
  }

  $code .= "}\n\n";
  # construção do verbo
  $decverb .= $code;
  $verbos .= <<FIM;
  $nome $nome = new $nome();
FIM
  1;
}

# Atualização do Status - caso especial
# Atualiza
sub Atualiza {
  my $code;			# código traduzido

  $code = <<FIM;

// $nome
class Atualiza extends Verbo
\{
     public String getNome() {return "Atualiza";}
FIM

      $code .= <<FIM if /\(\s*\d+\s*\)\s*\{/sm;
     static Random r = new Random();
FIM
  
  my @cods = split /%%/;
  
  my $cc = $_;
  $decobj = "\n      Status o = Motor.G.Status;\n";
  
  $decobj .= <<FIM if $cc=~ /\bAQUI\b/;
       Lugar AQUI = (Lugar) Motor.G.Av.Pos();
FIM
  
  if ($cc =~ s/^\s*java:\s*//ism) {
    $code .=  $_;
  }
  else {
    $code .= <<FIM;
     public void acao() \{$decobj
FIM

    $code .= trad($cc);
    $code .= "    }\n";
  }

  $code .= "}\n\n";
  # construção do verbo
  $decverb .= $code;
  $verbos .= <<FIM;
  $nome $nome = new $nome();
FIM
  1;
}

sub trad {
  my $c = shift;
  my $code;
  @strings = ();
  @blocos=();

  # referências globais
  $c =~ s/@(\w+)/Motor.G.$1/gs;

  # salvemos as strings

  # expressão para nome de objetos
  my $regb = '((?:Motor[.]G[.])?\w+)';

  my $i = 0;

  while ($c =~ s/(\"[^\"]*?\")/°STRING[$i]/) {
    $strings[$i++] = $1;
  }

  # Ajuste das strings
  map {
    # Outros objetos
    s/\bo\s+OBJETO:$regb\b/" + $1.getDef() + " " + $1.getNome() + "/g;
    s/\bum\s+OBJETO:$regb\b/" +$1.getIndef() + " " + $1.getNome() + "/g;
    s/\bdo\s+OBJETO:$regb\b/" +$1.getDefI() + " " + $1.getNome() + "/g;
    s/\bdum\s+OBJETO:$regb\b/" $1.getIndefI() + " " + $1.getNome() + "/g;
    s/\bO\s+OBJETO:$regb\b/" + $1.getDef().toUpperCase() + " " + $1.getNome() + "/g;
    s/\bUM\s+OBJETO:$regb\b/" +$1.getIndef().toUpperCase() + " " + $1.getNome() + "/g;
    s/\bDO\s+OBJETO:$regb\b/" +$1.getDefI().toUpperCase() + " " + $1.getNome() + "/g;
    s/\bDUM\s+OBJETO:$regb\b/" +$1.getIndefI().toUpperCase() + " " + $1.getNome() + "/g;
    s/\b\^OBJETO:$regb\^\b/" + $1.getNome().toUpperCase() + "/g;
    s/\bOBJETO:$regb\b/" +$1.getNome() + "/g;
    s/\bLONGA:$regb\b/" + $1.getLonga() + "/g;
    s/\bCURTA:$regb\b/" + $1.getCurta() + "/g;

    # Objeto default
    s/\bo\s+OBJETO\b/" + o.getDef() + " " + o.getNome() + "/g;
    s/\bum\s+OBJETO\b/" +o.getIndef() + " " + o.getNome() + "/g;
    s/\bdo\s+OBJETO\b/" +o.getDefI() + " " + o.getNome() + "/g;
    s/\bdum\s+OBJETO\b/" +o.getIndefI() + " " + o.getNome() + "/g;
    s/\bO\s+OBJETO\b/" + o.getDef().toUpperCase() + " " + o.getNome() + "/g;
    s/\bUM\s+OBJETO\b/" +o.getIndef().toUpperCase() + " " + o.getNome() + "/g;
    s/\bDO\s+OBJETO\b/" +o.getDefI().toUpperCase() + " " + o.getNome() + "/g;
    s/\bDUM\s+OBJETO\b/" +o.getIndefI().toUpperCase() + " " + o.getNome() + "/g;
    s/\b\^OBJETO\^\b/" + o.getNome().toUpperCase() + "/g;
    s/\bOBJETO\b/" + o.getNome() + "/g;
    s/\bLONGA\b/" + o.getLonga() + "/g;
    s/\bCURTA\b/" + o.getCurta() + "/g;

    #otimizações
    s/\s*""\s*[+]\s*//s;
    s/\s*[+]\s*""\s*//s;
  } @strings;

  # comentários
  $c =~ s/#[^\n]*?\n//gm;

  # Seleção dos blocos
  $i = 0;
  while ($c =~ s/\{([^{}]*?)\n*\}/°BLOCO[$i]/sim) {
    $blocos[$i++]=$1;
  }

  # guarda também o que sobrou
  $blocos[$i]=$c;

  # agora podemos fazer a tradução bloco a bloco
  for $i (0 .. $#blocos) {
    my $b = $blocos[$i];

    $code = "";

    ##################
    # Acertos gerais #
    ##################

    # ###########################
    # Manipulaçoes do aventureiro

    # Objetos globais
    # $b =~ s/@(\w+)/Motor.G.$1/gs;

    # visibilidade (condição)
    $b =~ s/Visivel\($regb\)/Motor.G.Av.Visivel($1)/gims;
    $b =~ s/Te(m|nho)\($regb\)/Motor.G.Av.Carrega($2)/gims;

    # pegar, largar (comandos, precisam do \n no final)
    $b =~ s/Pega\($regb\)/$1.Move(Motor.G.Av)\n/gims;
    $b =~ s/Larga\($regb\)/$1.Move(AQUI)\n/gims;

    ###################
    # Objetos e lugares

    # Só por precaução, evitar acesso direto (ARRUMAR)
#    if ($b =~ /(\w+[.]\w+)/) {
#      Erro("Esta sintaxe:\n   $1\npode causar confusão, use ':'");
#    }

    # Atributos especiais
    $b =~ s/$regb:(Longa|Curta)\s*=\s*?([^\n]+?)\s*?\n/$1.set$2($3)\n/gms;
    $b =~ s/$regb:(Longa|Curta)/$1.get$2()/gms;
    $b =~ s{$regb:(visivel|ativo|local|lugar|visitado)\s*=\s*?([^=][^\n]*?)\s*?\n}{$1.$2=$3\n}gms;
    $b =~ s/$regb:(visivel|ativo|local|lugar|visitado)/$1.$2/gms;

    # Valores especiais
    $b =~ s/\b(V|sim)\b/true/g;
    $b =~ s/\b(F|n[ãa]o)\b/false/i;

    $b =~ s/\b(RODADAS)\b/Motor.G.Status.rodadas/g;
    $b =~ s/\b(PONTOS)\b/Motor.G.Status.pontos/g;

    # para objetos
    $b =~ s/LONGA:$regb\s*=\s+([^\n]+)\s*/$1.setLonga($2)\n/gms;
    $b =~ s/CURTA:$regb\s*=\s*([^\n]+)\s*/$1.setCurta($2)\n/gms;
    $b =~ s/LONGA:$regb/$1.getLonga()/gms;
    $b =~ s/CURTA:$regb/$1.getCurta()/gms;

    # default é o próprio objeto
    $b =~ s/LONGA\s*=\s*([^\n]+)\s*/o.setLonga($1)\n/gms;
    $b =~ s/CURTA\s*=\s*([^\n]+)\s*/o.setCurta($1)\n/gms;
    $b =~ s/LONGA/o.getLonga()/gms;
    $b =~ s/CURTA/o.getCurta()/gms;

    # Objeto
    $b =~ s/OBJETO:$regb/$1.getNome()/gms;
    $b =~ s/OBJETO/o.getNome()/gms;

    # Atribuições
    $b =~ s{$regb:(\w+)\s*=\s*?([^=][^\n]*?)\s*?\n}{
      my $r = $Types{"$2"};
      $r = ($r ne "") ? "new $r($3)" : $3;
      qq/$1.setProp("$2",$r)\n/;
    }gimesx;

    # Funções
    $b =~ s/$regb:(\w+)\(/$1.$2\(/gims;

    # Atributos
    $b =~ s{$regb:(\w+)}{
      my $r = $Types{"$2"};
      $r = ($r ne "") ? qq/($1.hasProp("$2") ? (($r) $1.getProp("$2")).$Values{$r} : $Defaults{$r})/
	              : qq/$1.getProp("$2")/;
    }gimesx;

    my $s;

   # Tradução linha a linha
   # Para ver a tradução acontecendo, descomente as linhas marcadas com TRAD

   while ($b =~ /\S/) {
      #pega uma linha
      $b=~s/^\s*([^\n]+)\n?//sm; # pode ser que a última linha não tenha \n
      $s = $1;

      #print ">> $s\n";  # TRAD

      # comando de impressão
      if ($s =~ s/(print|imprima)//i) {
	$code .= "Motor.Mostra($s);\n";
      }

      #laço
      elsif ($s =~ s/^(?:varra|scan)\s+$regb\s+(?:com|with)\s+(\w+)\s*(°BLOCO\[\d+\])//sm) {
	$code .= <<FIM;
for (Iterator at = $1.Itens.iterator(); at.hasNext();) {
Objeto $2 = (Objeto) at.next();
$3}
FIM
      }

      #condicional
      elsif ($s =~ s/^(se|if)\s*(\([^°]+?\))\s*(°BLOCO\[\d+\])//sm) {
	$code .= <<FIM;
if $2 $3
FIM
      }
      # o else é "solto", não verifico se está corretamente emparelhado
      elsif ($s =~ s/^(sen.o|else)\s*(°BLOCO\[\d+\])//sm) {
	$code .= <<FIM;
else $2
FIM
      }

      # condição ligada à probabilidade
      elsif ($s =~ s/^\(([^°]+?)\)\s*(°BLOCO\[\d+\])//sm) {
	$code .= <<FIM;
if (r.nextFloat() <= ($1)/100.) $2
FIM
      }

      # uma string solitária é impressa
      elsif ($s =~ s/^°STRING\[(\d+)\]//sm) {
	$code .= <<FIM;
Motor.Mostra($strings[$1]);
FIM
      }

      # um bloco é copiado diretamente
      elsif ($s =~ s/^°BLOCO\[(\d+)\]//sm) {
	$code .= $blocos[$1];
      }
      # o que sobrou é comando pronto, copie e coloque o ';'
      else {
	$code .= "$s;\n";
	$s = "";
      }
      # print "  > $code\n";    #TRAD
    }
    $blocos[$i] = $code;
  }


  # Começando pelo último bloco (o mais abrangente)
  $code = $blocos[$#blocos];

  # tabulação
  $code =~ s/^/       /gsm;

  # Arruma os blocos e strings
  1  while  ($code =~ s<°BLOCO\[(\d+)\]><&Bloco("       ",$1)>eg);
  2  while  ($code =~ s/°STRING\[(\d+)\]/$strings[$1]/gsim);

  return $code;
}

sub Bloco {
  my ($tab, $bloco) = @_;

  $blocos[$bloco] =~ s/^/$tab  /gsm;
  my $r =  "{\n". $blocos[$bloco] ."$tab}";
  42 while  ($r =~ s/°BLOCO\[(\d+)\]/&Bloco("$tab  ",$1)/egsim);
  return $r;
}

sub Inicio {
  s/\s*$//ms;
  s/^\s*//ms;
  s/\n/");\n        Motor.Mostra("/gs;
  $Inicio = qq/        Motor.Mostra("$_");\n/;
}

sub Erro {
  print STDERR <<ERR;
Erro na entrada $.
  $_[0]
ERR
  die "Melhor parar aqui";
}

# Local Variables:
# mode: cperl
# End:
