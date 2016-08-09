
extends Node2D
onready var label = get_node("Label")
onready var time = get_node("Timer")
onready var icon = get_node("TextureFrame")
onready var typesound = get_node("TypeSound")
onready var text = label.get_text()
# member variables here, example:
# var a=2
# var b="textvar"
var visible = 0
func _jjfduhf():
	visible += 1
	if visible<=text.length():
		label.set_text(text.substr(0,visible))
		if text.substr(visible-1,1)==" ":
			typesound.play("space")
		else:
			typesound.play("key")
			
	if visible >= text.length()+4:
		time.stop()
		icon.set_rotation_deg(-20)
	


func _ready():
	time.connect("timeout",self,"_jjfduhf")
	label.set_text("")




