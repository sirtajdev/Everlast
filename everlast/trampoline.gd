extends Area2D

# Negative values move UP in Godot 2D
@export var bounce_force: float = -1200.0

func _on_body_entered(body: Node2D) -> void:
	# Check if the entering body is a CharacterBody2D (or check a group like body.is_in_group("player"))
	if body is CharacterBody2D:
		body.velocity.y = bounce_force
