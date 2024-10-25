extends RigidBody2D

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#apply_central_impulse(direction.normalized())
	#set_axis_velocity(direction.normalized()*1000)
	self.linear_velocity = direction*100
