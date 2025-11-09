extends Node2D
func _enter_tree():
	var parent = get_parent()
	var grandparent = get_parent().get_parent()
	parent.attack_damage = parent.attack_damage * 2
	
	
#func _process(delta):
	#if grandparent.health >= parent.health:
		#parent.
