extends CharacterBody2D

@export var y_speed = -300
@export var angle = [-250,250,-150]

func _physics_process(delta):
	if Input.is_action_just_pressed("Start") and !GameMain.started:
		play_game()
		
	if GameMain.started:
		var collision = move_and_collide(velocity*delta)
		if collision != null:
			velocity = velocity.bounce(collision.get_normal())
			
			var collided_object = collision.get_collider()
			if "Block" in collided_object.name:
				collided_object.queue_free()
func play_game():
	GameMain.started = true
	velocity = Vector2(angle.pick_random(), y_speed)
