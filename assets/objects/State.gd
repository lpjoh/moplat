extends Node
class_name State

onready var machine = get_parent()
onready var host = machine.get_parent()

func state_init():
	pass

func state_exit():
	pass

func state_update(_delta):
	pass

func is_current_state():
	if machine == null:
		return false
	
	return machine.current_state == self
