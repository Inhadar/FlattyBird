extends Node



func _ready():
	Globals.score = 0


func _process(delta):
	$CanvasLayer/Label.text = str(Globals.score)#"FPS: " + str(Performance.get_monitor(Performance.TIME_FPS))

