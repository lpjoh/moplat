extends State
class_name PlayerState

onready var anim_player = host.get_node("AnimationPlayer")

func falling():
	return host.motion.y >= 0

func can_stomp():
	return falling()
