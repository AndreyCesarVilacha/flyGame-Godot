extends Node2D

#Obtendo o caminho da Scene Coluna
const PRE_COLUNAS     : Resource = preload("res://Scenes/Colunas.tscn");
#Obtendo os fundos
onready var fundo1    : Node = get_node("cenario/fundo");
onready var fundo2    : Node = $cenario/fundo2;
onready var montanha1 : Node = $cenario/montanha;
onready var montanha2 : Node = $cenario/montanha2;
onready var nuvem1    : Node = $cenario/nuvem;
onready var nuvem2    : Node = $cenario/nuvem2;
#Obtendo o label 'Score'
onready var scoreNode :Node = $pontos/Score;


#Var responsavel por controlar o tempo de crianção da coluna
var tempo_instanciar : float = 0;

func mover_cenario(node1:Node, node2:Node, velocidade:float, posicao:float) -> void:
	node1.position.x -= velocidade;
	node2.position.x -= velocidade;
	
	if node1.position.x <= -posicao:
		node1.position.x = posicao;
	if node2.position.x <= -posicao:
		node2.position.x = posicao;

func criar_colunas():
	
	#Criando uma instância de coluna
	var colunas = PRE_COLUNAS.instance();
	#Gerando numeros aleatorios para a posição y da coluna
	colunas.position.y = rand_range(200, 450);
	#Posição inicial da coluna
	colunas.position.x = 500;
	#Adicionando a coluna como filha do mundo
	add_child(colunas);

func _ready() -> void:
	pass

func _process(delta) -> void:
	
	scoreNode.text = str(DadosGame.pontos);
	
	#Incrementado o tempo_instanciar por delta
	tempo_instanciar += delta;
	if tempo_instanciar > 2:
		#Instânciando coluna
		criar_colunas();
		tempo_instanciar = 0;
	
	#Movendo a nuvem
	mover_cenario(nuvem1,nuvem2,9,2160);
	#Movendo a montanha
	mover_cenario(montanha1, montanha2,4, 1082);
	#movendo fundo
	mover_cenario(fundo1, fundo2, 0.5, 1085);




