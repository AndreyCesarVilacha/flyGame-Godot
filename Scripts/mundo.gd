extends Node2D

#Obtendo o caminho da Scene Coluna
const pre_colunas : Resource = preload("res://Scenes/Colunas.tscn");

var tempo_instanciar : float = 0;

func criar_colunas():
	
	#Criando uma instância de coluna
	var colunas = pre_colunas.instance();
	
	colunas.position.y = rand_range(200, 450);
	colunas.position.x = 500;
	
	add_child(colunas);

func _ready() -> void:
	pass

func _process(delta) -> void:
	
	tempo_instanciar += delta;
	if tempo_instanciar > 2:
		criar_colunas();
		tempo_instanciar = 0;




