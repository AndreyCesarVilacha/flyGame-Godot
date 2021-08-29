extends RigidBody2D

#Obtendo o sprite animado "anim"
onready var animPlayer :AnimatedSprite= get_node("anim");

#Força do pulo
const force_jump: int = 400;
#Se o personagem esta sendo impulsionado
var impulse: bool = false;

#Função responsavel por fazer o personagem subir
func on_touch() -> void:
	
	#Faz a animação fly ir para o frame 0
	animPlayer.frame =0;
	
	#Mudando a animação ao precionar uma das teclas do "touch"
	impulse = true;
	
	#O 'apply_impulse' aplica um impulso aplicado a partir do offset
	#que vai servir do ponto de partida
	#apply_impulse(ponto de partida, impulso aplicado)
	#Valores y positivos vai para baixo e valores negativos para cima
	apply_impulse(Vector2(0,0),Vector2(0,-force_jump));

#É a primeira função chamada quando o node é inicializado
func _ready() -> void:
	#Conectado o sinal "animation finished" no proprio Rigid (self) e
	#chama a função "anim_finished"
	animPlayer.connect("animation_finished",self,"anim_finished");

#Esta função é chamada a cada frame
func _process(delta) -> void:
	
	#Controla que animação deve rodar
	if impulse:
		#Aciona a animação de "impulse"
		animPlayer.play("impulse");
	else:
		#Aciona a animação de "fly"
		animPlayer.play("fly")
	
	#Verifica se as teclas defininas em "touch" esta sendo pressionadas
	if Input.is_action_just_pressed("touch"):
		on_touch();

#Função responsavel por controlar a animação
func anim_finished() -> void:
	impulse = false;





