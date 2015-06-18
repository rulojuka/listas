Objeto vaca : vaca mimosa malhada
curta="Uma vaca malhada"
longa="É uma vaca malhada, com olhos tristes e com uma placa no pescoço escrito `Mimosa'"
viva=1
animacao=AnimaVaca
com_leite=0
:::
Sala curral
curta="Este é o curral da fazenda"
longa="O curral tem algumas cocheiras e está surpreendentemente limpo comparado com o resto da fazenda.  Com certeza, quem quer que cuide daqui, gosta muito de leite."
saida=Ncurral
saida=Scurral
contem=(vaca, banquinho, corda, balde)
:::
Saida Ncurral : norte N estrada
curta="tem uma estrada ao norte"
longa="é uma estrada longa e tortuosa"
destino=estrada
:::
Saida Scurral : sul S
curta="uma porta ao sul"
longa="uma porta de madeira velha, caindo aos pedaços, a porta está entreaberta"
destino=pasto
:::
Objeto corda
curta="Uma corda enrolada"
longa="É apenas uma corda...."
invisivel
:::
Objeto banquinho : banco tamborete
curta="um banquinho de madeira"
longa="Um banquinho de madeira, com três pés, daqueles usados para ordenhar"
:::
Objeto balde
curta="um balde"
longa="um balde de alumínio, meio amassado pelo longo uso"
vazio=sim
acao=virar
:::
Lugar pasto
curta="Pasto do rebanho"
longa="É um pasto amplo e verde, cheio de vestígios ruminosos espalhados aqui e ali"
saida=Ncurral
saida=Scurral
:::
Lugar estrada 
curta="Estrada do curral"
longa="Uma estrada longa e bastante sinuosa, que parece levar a terras de além."
saida=Ncurral
saida=Scurral
:::
acao virar : vire tombe
{
   "Uma corda caiu no chão!  Ela estava dentro do balde, mas não dava para ver";
    @corda:visivel=sim;
}
:::
acao AnimaVaca
{
		"Muuuu"
}