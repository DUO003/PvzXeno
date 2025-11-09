extends Area2D

@export var driver : PlantDriver
@export var anim : AnimatedSprite2D
@onready var attack_timer = driver.attack_timer
@onready var health = driver.health
@onready var bullet_velocity = driver.bullet_velocity

var board_row = 1
var board_column = 1
var current_velocity
var rdmnum

signal attack_signal


func _ready():
	anim.speed_scale = driver.operating_speed
	anim.play("default")
	
	
	
	if driver.face_foward == false:
		$AnimatedSprite2D.flip_h = true


func _process(delta):
	
	attack_timer -= delta * driver.operating_speed
	
	
	
	if attack_timer <= 0:
		attack_timer = driver.attack_timer
		attack()
		
	#处理死亡
	if health <= 0:
		die()
		
func attack():
	rdmnum = randi_range(0, 1)
	emit_signal("attack_signal")
	
	#var bullet_position = position
	var bullet = driver.bullet_type.instantiate()
	bullet.position = Vector2(0,0) + driver.bullet_position
	bullet.bullet_operating_speed = driver.bullet_operating_speed
	current_velocity = driver.bullet_velocity
	bullet.bullet_velocity = Vector2(600, 0) + current_velocity
	if driver.face_foward == false:
		bullet.bullet_velocity = -bullet.bullet_velocity
	bullet.bullet_damage = driver.attack_damage
	bullet.bullet_durable = driver.bullet_durable
	add_child(bullet)
	
	bullet_velocity_reset()
	print(current_velocity)

func die():
	deadrattle()

func deadrattle():
	queue_free()

func dig():
	queue_free()##铲除将跳过亡语效果
	
func bladization():
	queue_free()
	
func bullet_velocity_reset():
	driver.bullet_velocity = bullet_velocity
	pass
