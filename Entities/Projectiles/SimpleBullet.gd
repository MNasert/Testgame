extends Node2D

@export var speed: float = 0
var damage: int = 0
var hp: int = 1

@export var range: float = 0

var movevec: Vector2
var travel_dist: float = 0

func init(pos: Vector2, direction: Vector2, dmg: int, pierce: int):
	self.position = pos
	if direction.x < 0:
		$BulletAnim.flip_h = true
	self.movevec = direction * self.speed
	self.damage = dmg
	self.hp += pierce

func _ready():
	pass
	
func _process(delta):
	self.position += self.movevec * delta
	self.travel_dist += self.movevec.length() * delta
	if self.travel_dist > self.range:
		self.queue_free()
	if self.hp <= 0:
		self.set_process(false)
		$Area2D/CollisionShape2D.disabled = true
		$BulletAnim.play("default")

func _on_bullet_anim_animation_finished():
	self.queue_free()

func _on_bullet_anim_animation_looped():
	self.queue_free()
