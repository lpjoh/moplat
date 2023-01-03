extends KinematicBody2D
class_name MovingBody

var motion = Vector2()

func _physics_process(_delta):
	motion = move_and_slide(motion, Vector2(0, -1))
