
extends Panel

func _on_button_pressed():
	get_tree().change_scene("res://Node2D.scn")
	
func _ready():
	get_node("PlayButton").connect("pressed",self,"_on_button_pressed")
	set_process_input(true)
	
func _input(event):
   if(event.type == InputEvent.KEY && event.is_pressed()):
      if(event.scancode == KEY_ESCAPE):
         get_tree().quit() 


