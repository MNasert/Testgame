extends Node2D

@export var speed: float = 0
var damage: int = 0
var pierce: int = 0

@export var range: float = 0

var movevec: Vector2
var travel_dist: float = 0

func init(pos: Vector2, direction: Vector2, dmg: int, pierce: int):
	self.movevec = direction * self.speed
	self.damage = dmg
	self.pierce = pierce

func _ready():
	pass
	
func _process(delta):
	self.position += self.movevec * delta
	self.travel_dist += self.movevec.length() * delta
	if self.travel_dist > self.range:
		self.queue_free()
	if self.pierce < 0:
		$Area2D/CollisionShape2D.disabled = true
		# do animation
		self.queue_free()
