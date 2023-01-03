extends Node
class_name StateMachine

onready var current_state = get_child(0)

var called_state = null

func _ready():
	current_state.state_init()

func _process(delta):
	update_current_state(delta)

func update_current_state(delta):
	if called_state == null:
		var new_state_name = current_state.state_update(delta)
		if not new_state_name == null:
			begin_state(new_state_name, delta)
	else:
		var new_state_name = called_state
		called_state = null
		begin_state(new_state_name, delta)

func change_state(state_name):
	called_state = state_name

func begin_state(state_name, delta):
	current_state.state_exit()
	current_state = get_node(state_name)
	current_state.state_init()
	update_current_state(delta)
