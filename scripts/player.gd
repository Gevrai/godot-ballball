class_name Player extends RigidBody2D

const PLAYER_GROUP = "players"

@export var player: StringName = "p1"
@export var color: Color = Color(1, 0, 0)
@export var acceleration: float = 10

@onready var has_ball_outline = %BallActiveOutline

var has_ball: bool = false:
	set(value): has_ball_outline.visible = value
	get: return has_ball_outline.visible

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Body.modulate = color
	has_ball = false

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var direction = Input.get_vector(player+"_left", player+"_right", player+"_up", player+"_down").normalized()
	if has_ball:
		state.linear_velocity += direction * acceleration * 0.9
	else:
		state.linear_velocity += direction * acceleration

func _on_body_entered(body: Node) -> void:
	if body.is_in_group(PLAYER_GROUP):
		var other_player = body as Player
		if other_player.has_ball:
			other_player.set_deferred("has_ball", false)
			set_deferred("has_ball", true)