extends Node2D
var normal = preload("res://normal.tscn")
var antigravity = preload("res://antigravity.tscn")
var teleporation = preload("res://teleportation.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(KillZone.deaths == 3):
		KillZone.deaths = 0
	if(KillZone.deaths == 0):
		normal = normal.instantiate()
		normal.position = Vector2(-246,153)
		add_child(normal)
		normal.collision_layer = 2
		normal.collision_mask = 1
	if(KillZone.deaths == 1):
		antigravity = antigravity.instantiate()
		antigravity.position = Vector2(-246,153)
		add_child(antigravity)
		antigravity.collision_layer = 2
		antigravity.collision_mask = 1
	if(KillZone.deaths == 2):
		teleporation = teleporation.instantiate()
		teleporation.position = Vector2(-246,153)
		add_child(teleporation)
		teleporation.collision_layer = 2
		teleporation.collision_mask = 1

		# Replace with function body
