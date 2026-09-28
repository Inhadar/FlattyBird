extends Node2D


export(PackedScene) var obs_obj: PackedScene
export(PackedScene) var col_obj: PackedScene
var one_start = true

func _ready():
	spawn()
	$Timer.start()
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func spawn():
	var pipe1 = obs_obj.instance()
	var pipe2 = obs_obj.instance()
	var crystal = col_obj.instance()
	
	pipe1.rotation_degrees = 0
	pipe2.rotation_degrees = 180
	
	pipe1.position.y = rand_range(500,1500)
	pipe2.position.y = pipe1.position.y - 2300 #rand_range(1600,1500)
	pipe2.scale.x = pipe2.scale.x *-1
	crystal.position.y = (pipe1.position.y + pipe2.position.y)/2
	crystal.position.x = pipe1.position.x
	

	add_child(pipe1)
	add_child(pipe2)
	add_child(crystal)
	
	
	




func _on_Timer_timeout():
	spawn()
