extends KinematicBody2D

var gravity = 2000
var max_fall = 1000
var jump_force = -800
var jump_hold_time = 0.2
var local_hold_time = 0
var velocity = Vector2.ZERO
var UP = Vector2.UP



func _physics_process(delta):
	
	if Globals.game_over ==true:
		get_node("Camera2D").shake(0.5,10)
		$Game_over.wait_time = 0.5
		$Game_over.start()
		set_physics_process(false)
		
		var pipes = get_tree().get_nodes_in_group("pipe")
		var crystals = get_tree().get_nodes_in_group("crystall")
		for pipe in pipes:
			pipe.set_process(false)
		for crystall in crystals:
			crystall.set_process(false)
		Globals.game_over = false
		
		
	add_gravity(delta)
	jump()
	if abs(velocity.y) > 250:
		$Particles2D.emitting = true
	else:
		$Particles2D.emitting = false 
	var _useless = move_and_slide(velocity,UP)



func jump():
	if Input.is_action_just_pressed("Jump"):
		velocity.y = jump_force
		local_hold_time = jump_hold_time
		#if rotation_degrees > -20:
		#	rotation_degrees -= 2
		#	pass
		rotation_degrees = 0
		$Particles2D.get_process_material().angle = 0
	elif local_hold_time > 0:
		if Input.is_action_pressed("Jump"):
			velocity.y = jump_force
			if rotation_degrees > -20:
				rotation_degrees -= 2.5
			if $Particles2D.get_process_material().angle < 20:
				$Particles2D.get_process_material().angle +=2.5
		else:
			local_hold_time = 0

			
func add_gravity(delta):
	velocity.y = move_toward(velocity.y, max_fall, gravity * delta)
	if !Input.is_action_pressed("Jump"):
		if velocity.y > 0:
			if rotation_degrees <30:
				rotation_degrees +=1
			if $Particles2D.get_process_material().angle > -30:
				$Particles2D.get_process_material().angle -=1


func _on_Game_over_timeout():
	get_tree().reload_current_scene()
