extends Area2D
class_name KillZone
@onready var timer = $Timer
static var deaths = 0
func _on_body_entered(body):
	print("You Died!")

	body.alive=false
	print(deaths)
	deaths += 1
	timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
	
