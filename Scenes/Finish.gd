extends Area2D


#En esta escena tenemos la parte final del juego, el area de la bandera.

func _ready():
	pass

func _on_Finish_body_entered( body ):
	if(body.is_in_group("player") && !gamehandler.win): 
		get_tree().get_nodes_in_group("sfx")[0].get_node("7").play()
		gamehandler.win = true
		var newMariow = get_tree().get_nodes_in_group("lista_obj")[0].mario_w.instance() 
		var player = get_tree().get_nodes_in_group("player")[0] 
		newMariow.global_position = player.global_position 
		var cols = player.get_node("CollisionShape2D")
		player.remove_child(player.get_node("CollisionShape2D"))
		newMariow.add_child(cols) 
		newMariow.get_node("Sprite").texture = player.get_node("Sprite").texture 
		var cam = player.get_node("Camera2D") 
		player.remove_child(player.get_node("Camera2D"))
		cam.global_position.y = get_tree().get_nodes_in_group("spawn")[0].global_position.y
		add_child(cam)
		player.free() 
		get_tree().get_nodes_in_group("main")[0].add_child(newMariow)
		
		
		
