extends Sprite2D

@onready var left: AnimatedSprite2D = $LeftOrb
@onready var right: AnimatedSprite2D = $RightOrb

const fire_time_threshold = 0.3
var fire_time = fire_time_threshold
var bullet_type = BulletFactory.ARROW_BULLET
	
func _process(delta):
	if fire_time <= 0:
		_fire(bullet_type)
		fire_time = fire_time_threshold
	else:
		fire_time -= delta
		
func _fire(bullet_type):
	var bullet1 = BulletFactory.create_bullet(bullet_type)
	bullet1.position = left.global_position + Vector2(0, - 30)
	get_parent().add_child(bullet1)
	var bullet2 = BulletFactory.create_bullet(bullet_type)
	bullet2.position = right.global_position + Vector2(0, - 30)
	get_parent().add_child(bullet2)
	var bullet3 = BulletFactory.create_bullet(bullet_type)
	bullet3.position = position + Vector2(0, - 60)
	get_parent().add_child(bullet3)
 
func _on_change_bullet_timer_timeout():
	if bullet_type == BulletFactory.ARROW_BULLET:
		bullet_type = BulletFactory.CIRCULAR_BULLET
	elif  bullet_type == BulletFactory.CIRCULAR_BULLET:
		bullet_type = BulletFactory.FLAME_BULLET
	else:
		bullet_type = BulletFactory.ARROW_BULLET	
