extends PlayerState

var midstopped = false
var prev_motion = Vector2()
var bounced = false

func midstop(factor = 0.25):
	host.motion.y *= factor
	midstopped = true

func state_init():
	midstopped = false
	
	if not Input.is_action_pressed("tap"):
		if bounced:
			midstop(0.5)
		else:
			midstop()
	
	if falling():
		anim_player.play("fall_nojump")
	else:
		anim_player.play("jump")

func state_exit():
	if not machine.current_state.name == "Air":
		bounced = false

func state_update(delta):
	prev_motion = host.motion
	
	host.motion.y += 400 * delta
	
	midstopped = midstopped or falling()
	
	if host.is_on_floor():
		return "Ground"
	
	if midstopped or bounced:
		if Input.is_action_just_pressed("tap"):
			return "Slam"
	
	if not midstopped:
		if Input.is_action_just_released("tap") and host.motion.y < 0:
			midstop()
	
	if prev_motion.y < 0 and falling() or host.is_on_ceiling():
		anim_player.play("fall")
