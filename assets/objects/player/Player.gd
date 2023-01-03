extends MovingBody
class_name Player

var can_place_player = true

func enemy_stomped(enemy):
	if $StateMachine.current_state.can_stomp():
		motion.y = -225
		$StateMachine.change_state("Air")
		$StateMachine/Air.bounced = true
		
		enemy.die()
	else:
		get_tree().reload_current_scene()
