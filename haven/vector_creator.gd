extends Area2D

signal vector_created(vector)

@export var maximum_length := 400


var touch_down := false
var postion_start := Vector2.ZERO
var postion_end := Vector2.ZERO

var vector := Vector2.ZERO

func _ready() -> void :
	connect("input_event",_on_input_event)
	
func _draw() -> void:
	draw_line(postion_start-global_position,
		(postion_end - global_position),
		Color.BLUE,
		8) 
	draw_line(postion_start - global_position,
	postion_start - global_position + vector,
	Color.RED,
	16)
		
func _reset() -> void:
	postion_start = Vector2.ZERO
	postion_end = Vector2.ZERO
	vector = Vector2.ZERO
	
	queue_redraw()

func _input(event) -> void:
	if not touch_down:
		return
	if event.is_action_released("ui_touch"):
		touch_down = false
		emit_signal("vector_created",vector )
		
		_reset()
		
	if event is InputEventMouseMotion:
		postion_end = event.position
		vector = -(postion_end - postion_start).limit_length(maximum_length)
		
		queue_redraw()
	
	
func _on_input_event(_viewport, event, _shape_idx) -> void:
	
	if event.is_action_pressed("ui_touch"):
		touch_down = true
		postion_start = event.position 


func launch(vector: Variant) -> void:
	pass # Replace with function body.
