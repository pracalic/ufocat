extends Area2D
@export var texture_to_set: Texture2D
var start_process:bool = false
var time: float = 0
@export var wait_time: float = 4
@export var part:Main.PART = Main.PART.PART_1
func _ready() -> void:
	$Sprite2D.texture = texture_to_set
	#%TextureProgressBar.call_deferred("set_value",0)

func _physics_process(delta: float) -> void:
	if(start_process):
		time = time + delta
		update_progressbar()
		if(time > wait_time):
			body_exited.disconnect(_on_body_exited)
			self.free()
			#start_process = false
			#self.call_deferred("free")

func update_progressbar():
	%TextureProgressBar.set_value(time/wait_time * %TextureProgressBar.max_value)
		
	
func _on_body_entered(body: Node2D) -> void:
	$Sprite2D.modulate = Color.GREEN
	start_process = true




func _on_body_exited(body: Node2D) -> void:
	start_process = false
	time = 0
	update_progressbar()
	$Sprite2D.modulate = Color.WHITE
	
func _exit_tree() -> void:
	print("exit")
