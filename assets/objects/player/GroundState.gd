extends PlayerState

func can_stomp():
	return host.motion.y > 0

func jump():
	host.motion.y = -200

func state_init():
	anim_player.play("hit_ground")
	anim_player.queue("run")

func state_update(delta):
	if Input.is_action_just_pressed("tap"):
		jump()
	
	if not host.is_on_floor():
		return "Air"
