extends Node2D
func _enter_tree():
	var parent = get_parent()
	parent.bullet_velocity = Vector2(0,200)
