
extends Panel

# member variables here, example:
# var a=2
# var b="textvar"
func _on_button_pressed():
	get_tree().change_scene("res://Node2D.scn")
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Button").connect("pressed",self,"_on_button_pressed")
	
	
	pass


