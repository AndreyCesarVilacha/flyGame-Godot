extends Node2D

#Obtendo o caminho da Scene Coluna
const pre_colunas : Resource = preload("res://Scenes/Colunas.tscn");
#Obtendo os fundos
onready var fundo1 : Node = get_node("cenario/fundo");
onready var fundo2 : Node = $cenario/fundo2;


#Var responsavel por controlar o tempo de crianção da coluna
var tempo_instanciar : float = 0;

func criar_colunas():
	
	#Criando uma instância de coluna
	var colunas = pre_colunas.instance();
	#Gerando numeros aleatorios para a posição y da coluna
	colunas.position.y = rand_range(200, 450);
	#Posição inicial da coluna
	colunas.position.x = 500;
	#Adicionando a coluna como filha do mundo
	add_child(colunas);

func _ready() -> void:
	pass

func _process(delta) -> void:
	
	#Incrementado o tempo_instanciar por delta
	tempo_instanciar += delta;
	if tempo_instanciar > 2:
		#Instânciando coluna
		criar_colunas();
		tempo_instanciar = 0;
	
	#Movendo o fundo
	fundo1.position.x -= 0.5;
	fundo2.position.x -= 0.5;
	
	#Resetando a posição do fundo ao chegar na posição -1085
	if fundo1.position.x <= -1085:
		fundo1.position.x = 1085;
	if fundo2.position.x <= -1085:
		fundo2.position.x = 1085;




