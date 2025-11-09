extends Node2D
@export var driver : PlantDriver
func _enter_tree():
	var parent = get_parent()
	parent.operating_speed = parent.operating_speed * 10
