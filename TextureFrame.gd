
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
			time.set_wait_time(.22)
			typesound.play("space")
		elif text.substr(visible-1,1) in ["a","f","x","l","a","p","r","d","c","i","o"]:
			time.set_wait_time(.11)
			typesound.play("key")
		else: 
			time.set_wait_time(.18)
			typesound.play("key")
			
	if visible >= text.length()+4:
		typesound.play("bell")
		time.stop()
		icon.set_rotation_deg(-20)
	


func _ready():
	time.connect("timeout",self,"_jjfduhf")
	label.set_text("")




