extends RigidBody2D

@onready var catAgent = $NavigationAgent2D
@export var player:Node2D = null
@export var speed:float = 200
var server_ready:bool = false
@onready var raycast = $RayCast2D
var player_id:int
@export var stop_distance: float = 0.8

func _ready() -> void:
	NavigationServer2D.map_changed.connect(navigation_server_ready)
	
	if(player):
		player_id = player.get_instance_id()
		catAgent.target_position = player.global_position

	#raycast.set_collision_mask_value(1,true)
	#raycast.set_collision_mask_value(2,false)

	actor_setup.call_deferred()

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame
	await get_tree().physics_frame
	await get_tree().physics_frame
	await get_tree().physics_frame

func _physics_process(_delta: float) -> void:


		#print(velocity.length())

			
		raycast.set_target_position(player.global_position - raycast.global_position)

		if(raycast.is_colliding()):
			if(raycast.get_collider().get_instance_id() == player_id):
				#var dir = player.global_position - global_position
				#dir = dir.normalized() * speed
				#velocity = dir
				$Sprite2D.modulate = Color.RED
			else:
	
				$Sprite2D.modulate = Color.WHITE
		
		#if((global_position - player.global_position).length_squared() > stop_distance):
		
			var direct = Vector2.ZERO
			if(player && server_ready):
				catAgent.target_position = player.global_position
				print(player.global_position)
				print(global_position)
				direct = catAgent.get_next_path_position() - global_position
				print(catAgent.get_next_path_position())
				print("cos + " )
				print(direct)
				direct = direct.normalized() * speed
				print(direct)
			#self.apply_force(dir)
			self.linear_velocity = direct
			#self.move_and_collide(dir)

		
func navigation_server_ready(_value):
	server_ready = true
