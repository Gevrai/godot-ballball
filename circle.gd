@tool
extends Node2D

@export var radius: float = 50:
	set(value): radius = value; queue_redraw()

@export var width: float = 5:
	set(value): width = value; queue_redraw()

@export var segments: int = 32:
	set(value): segments = value; queue_redraw()

func _draw() -> void:
	draw_arc(Vector2(0, 0), radius, 0, 360, segments, Color(1, 1, 1), width)
