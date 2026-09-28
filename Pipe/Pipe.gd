extends Area2D


var speed = 700
export var direction = -1
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	move(delta)
	if get_parent().global_position.distance_to(global_position) > 2500 and get_parent().global_position.x > global_position.x:
		queue_free()


		
func move(delta):
	position.x += speed * direction * delta
	#move_toward(velocity.x,speed * direction,delta)
	#velocity.x += 1000
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pipe_body_entered(body):
	if body.is_in_group("Player"):
		Globals.game_over =true
	#	get_tree().current_scene.get_node("Bird/Camera2D").shake(0.5,10)
		#get_tree().reload_current_scene()
