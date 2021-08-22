extends Node2D

#Var pra controlar a velocidade da coluna
#A palavra export, faz a variavel ficar disponivel no Inspector
export var coluna_speed: float = 100;

func _ready() -> void:
	pass

func _process(delta) -> void:
	
	#Muda a poscição da área2D a cada frame
	#O delta são valores baixos
	self.position.x -= coluna_speed * delta;
	
	if self.position.x < -50:
		print(self.position.x)
		#Deleta o objeto
		#queue_free()

