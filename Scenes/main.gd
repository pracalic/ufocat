extends Node2D

var player:Node2D

var cat = preload("res://Scenes/Cat/cat.tscn")

var spawn_point: Node2D

enum PART {PART_1, PART_2, PART_3, PART_4, PART_5, PART_6}

func Cat_Spawn() -> void:
	var cc = cat.instantiate()
	add_child(cc)
	print(spawn_point.name)
	cc.global_position = spawn_point.global_position
	
	pass # Replace with function body.
