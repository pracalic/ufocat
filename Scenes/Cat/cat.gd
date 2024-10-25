extends CharacterBody2D

@onready var catAgent = $NavigationAgent2D
@export var player:CharacterBody2D = null
@export var speed:float = 200
var server_ready:bool = false
@onready var raycast = $RayCast2D
var player_id:int
@export var stop_distance: float = 0.8

func _ready() -> void:
	NavigationServer2D.map_changed.connect(navigation_server_ready)
	if(player):
		player_id = player.get_instance_id()
	#raycast.set_collision_mask_value(1,true)
	#raycast.set_collision_mask_value(2,false)

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
		
		if((global_position - player.global_position).length_squared() > stop_distance):
		
			
			if(player && server_ready):
				catAgent.target_position = player.global_position
				var dir = catAgent.get_next_path_position() - global_position
				dir = dir.normalized() * speed
				velocity = dir		
			move_and_slide()

		
func navigation_server_ready(value):
	server_ready = true
