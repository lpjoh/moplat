extends Enemy

func _on_StompArea_body_entered(body):
	if body is Player:
		body.enemy_stomped(self)
