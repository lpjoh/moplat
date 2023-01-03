extends Node2D

var spawned_next = false

var levelpiece_file = load("res://assets/objects/level/LevelPiece.tscn")

func _process(delta):
	position.x -= get_parent().speed * delta
	get_global_mouse_position()

func _on_VisibilityNotifier2D_screen_entered():
	if not spawned_next:
		var levelpiece = levelpiece_file.instance()
		get_parent().add_child(levelpiece)
		
		levelpiece.global_position = $VisibilityNotifier2D.global_position
		
		spawned_next = true

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
