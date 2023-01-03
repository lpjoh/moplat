extends PlayerState

var prev_motion = Vector2()
var passed_platform = false

func state_init():
	anim_player.play("slam_start")
	anim_player.queue("slam")
	
	passed_platform = false

func state_update(delta):
	host.motion.y += 1500 * delta
	host.motion.y = min(host.motion.y, 500)
	
	if host.is_on_floor():
		if passed_platform:
			return "Ground"
		else:
			host.position.y += 1
			host.motion = prev_motion
			passed_platform = true
	
	prev_motion = host.motion
