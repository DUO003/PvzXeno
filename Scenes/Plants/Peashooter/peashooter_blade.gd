extends Node2D
func _enter_tree():
	var parent = get_parent()
	parent.operating_speed = parent.operating_speed * 10
