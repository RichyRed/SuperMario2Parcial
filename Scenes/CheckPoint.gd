extends Area2D

func _ready():
	pass

#En esta escena verificamos si el player llego al ckeckpoint.

func _on_CheckPoint_body_entered( body ):
	if(body.is_in_group("player")): 
		gamehandler.CheckPoint.x = global_position.x
