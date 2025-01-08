extends Node2D
#Variavel de gravidade
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(_delta: float) -> void:
		#Adiciona a gravidade do mundo
	$CharacterBody2D.velocity.y += gravity * 2 * _delta
	
	#Método de characterbody para mover e colidir
	$CharacterBody2D.move_and_slide()
	#Função de capturar inputs e adicionar +1 -1 ao vetor de movimento
	_Movement_Player(_delta)








	#Função de capturar inputs e movimento do jogador
func _Movement_Player(_delta):
	#Captura o Input se a tecla A for apertada
	if Input.is_action_pressed("Left"):
		position.x -= Global.Movement_Speed * _delta
#Captura o Input se a tecla D for apertada
	if Input.is_action_pressed("Right"):
		position.x += Global.Movement_Speed * _delta
#Captura o Input se a tecla Espace for apertada
	#Se a tecla for apertada e o characterbody estiver em contato com um collision shape
	if Input.is_action_pressed("Jump") and $CharacterBody2D.is_on_floor():
		#Ele ira adicionar y igual a gravidade no global.gd
		$CharacterBody2D.velocity.y = Global.Movement_Gravity
