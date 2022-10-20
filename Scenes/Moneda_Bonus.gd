extends Sprite

	#Escena que elimina las animaciones de las monedas.

func _ready():
	pass

func _on_AnimationPlayer_animation_finished( anim_name ):
	queue_free() 
