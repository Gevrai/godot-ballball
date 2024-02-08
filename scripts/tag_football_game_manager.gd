extends Node2D

var pickup_initial_position: Vector2

var p1_score = 0:
	set(value):
		%P1Score.text = str(value) if value > 0 else ""
	get:
		return int(%P1Score.text)

var p2_score = 0:
	set(value):
		%P2Score.text = str(value) if value > 0 else ""
	get:
		return int(%P2Score.text)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pickup_initial_position = %Pickup.position
	p1_score = 0
	p2_score = 0

func _on_pickup_body_entered(body:Node2D) -> void:
	if body.is_in_group(Player.PLAYER_GROUP):
		body.has_ball = true
		%Pickup.position = Vector2(-1000, -1000)

func _on_player_1_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group(Player.PLAYER_GROUP):
		if body.has_ball:
			body.has_ball = false
			p2_score += 1
			%Pickup.position = pickup_initial_position

func _on_player_2_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group(Player.PLAYER_GROUP):
		if body.has_ball:
			body.has_ball = false
			p1_score += 1
			%Pickup.position = pickup_initial_position
