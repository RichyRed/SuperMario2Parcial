extends KinematicBody2D

#En esta escena evaluamos si Mario llega al final, para ganar el juego

var suelo_reached = false
var Velocidad = Vector2()
var bandera

func _ready():
	bandera = get_tree().get_nodes_in_group("flag")[0] 
	
func _physics_process(delta):
	if(!suelo_reached):
		Velocidad.y += gamehandler.GRAVEDAD/2 * delta
		move_and_slide(Velocidad)
		if(get_slide_count() > 0):
			var obj_col = get_slide_collision(get_slide_count()-1).collider
			if(obj_col.is_in_group("gf")): 
				get_tree().get_nodes_in_group("sfx")[0].get_node("7").stop()
				suelo_reached = true
				get_node("AnimationPlayer").play("win") 
		bandera.move_and_slide(Velocidad)

