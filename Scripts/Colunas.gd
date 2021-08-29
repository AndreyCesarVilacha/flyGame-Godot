extends Node2D

#Var pra controlar a velocidade da coluna
#A palavra export, faz a variavel ficar disponivel no Inspector
export var coluna_speed: float = 200;
#Var para pontos
export var pontos: int = 30;

func _ready() -> void:
	pass

func _process(delta) -> void:
	
	#Muda a poscição da área2D a cada frame
	#O delta são valores baixos
	self.position.x -= coluna_speed * delta;
	
	if self.position.x < -50:
		DadosGame.pontuar(pontos);
		queue_free()



func _on_area_body_entered(body):
	DadosGame.pontos = 0;
	get_tree().reload_current_scene();
