extends CharacterBody2D

@export var SPEED = 600.0
var health = 100.0
const DAMAGE_PER_SECOND = 30.0
signal  health_end

#func _ready() -> void:
	#$"%ProgressBar".value = health

func _physics_process(delta: float) -> void:

	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = SPEED * direction

	#if(velocity.length() > 0):
		#$HappyBoo.play_walk_animation()
	#else :
		#$HappyBoo.play_idle_animation()	

	move_and_slide()
	
	#var bodies: Array[Node2D] = $"%HitBox".get_overlapping_bodies()
	#if(bodies.size() > 0):
		#health -= DAMAGE_PER_SECOND * bodies.size() * delta
		#if(health <0):
			#health =0
		#$ProgressBar.value = health
		#if(health <= 0):
			#health_end.emit()
