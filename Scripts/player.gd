extends RigidBody2D

const force_jump: int = 600;

func on_touch() -> void:
	#O 'apply_impulse' aplica um impulso aplicado a partir do offset
	#que vai servir do ponto de partida
	#apply_impulse(ponto de partida, impulso aplicado)
	#Valores y positivos vai para baixo e valores negativos para cima
	apply_impulse(Vector2(0,0),Vector2(0,-force_jump));

func _ready() -> void:
	pass


func _process(delta) -> void:
	if Input.is_action_just_pressed("touch"):
		on_touch();









