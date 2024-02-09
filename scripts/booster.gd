extends Area2D

@export var force = 1000.0

func _ready():
	connect(body_entered.get_name(), _on_body_entered)
	connect(body_exited.get_name(), _on_body_exited)

func _on_body_entered(body: Node) -> void:
	var rb = body as RigidBody2D
	if rb:
		rb.add_constant_force(Vector2(0, force).rotated(global_rotation))

func _on_body_exited(body: Node) -> void:
	var rb = body as RigidBody2D
	if rb:
		rb.add_constant_force(-Vector2(0, force).rotated(global_rotation))

