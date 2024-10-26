extends RigidBody2D


@export var SPEED = 600.0
var health = 100.0
const DAMAGE_PER_SECOND = 30.0
#signal  health_end

#func _ready() -> void:
	#$"%ProgressBar".value = health

func _physics_process(_delta: float) -> void:

	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	self.linear_velocity = direction*SPEED
	#if(direction !=Vector2.ZERO):
		#self.apply_impulse(direction*SPEED)
		#self.linear_velocity = self.linear_velocity * 20f
	#else:
		#self.apply_impulse(-self.linear_velocity*2)
