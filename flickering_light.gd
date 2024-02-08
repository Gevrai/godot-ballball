@tool
extends Sprite2D

@export var amplitude =0.01
@export var frequency = 3

@onready var initial_opacity = modulate.a

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	modulate.a = initial_opacity + amplitude*sin(PI * frequency*Time.get_ticks_msec()/1000.0)
