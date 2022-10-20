extends StaticBody2D

#En esta escena tenemos las propiedades y caracteristicas de los cubos.

var abierto = false 
export (int) var item 
export (int) var cantidad 
export (PackedScene) var moneda
export (PackedScene) var hongo
var cooldown = false 

func _ready():
	pass

func romper_cubo():
	var newitem 
	
	if(item == 0): 
		newitem = moneda.instance()
		add_child(newitem)
		gamehandler.set_monedas(1)
		get_tree().get_nodes_in_group("sfx")[0].get_node("3").play()

	elif(item == 1):
		get_tree().get_nodes_in_group("sfx")[0].get_node("8").play()
		newitem = hongo.instance() 
		get_tree().get_nodes_in_group("main")[0].add_child(newitem) 
		
	elif(item == 2): 
		get_tree().get_nodes_in_group("sfx")[0].get_node("8").play()
		get_node("Sprite").visible = true 
		newitem = hongo.instance()
		newitem.get_node("Sprite").frame = 1 
		get_tree().get_nodes_in_group("main")[0].add_child(newitem)
		newitem.tipo = 2 
		
	newitem.global_position = get_node("SpawnPoint").global_position 
	cantidad -= 1 

	if(cantidad == 0): 
		get_node("animacion").play("cubo_roto") 
		
	cooldown = true 
	yield(get_tree().create_timer(0.5), "timeout") 
	cooldown = false 

func golpear_vacio():
	cooldown = true 
	get_tree().get_nodes_in_group("sfx")[0].get_node("5").play()
	yield(get_tree().create_timer(0.5), "timeout") 
	cooldown = false 
