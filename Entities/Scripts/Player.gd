extends Node2D

@export var speed: float = 0
@export var firerate: float = 0  # shots/s
@export var damage: int = 0
@export var health: int = 0

@export var bullet: PackedScene

var can_shoot = true
var firerate_cooldown = 1/firerate  # cooldown in s
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player")

func get_inputs() -> Array[bool]:
	var inputs: Array[bool] = [0, 0, 0, 0, 0]
	if Input.is_action_pressed("up"):
		inputs[0] = 1
	if Input.is_action_pressed("down"):
		inputs[1] = 1
	if Input.is_action_pressed("left"):
		inputs[2] = 1
	if Input.is_action_pressed("right"):
		inputs[3] = 1
	if Input.is_action_pressed("shoot"):
		inputs[4] = 1
	return inputs

func move(inputs: Array[bool], delta: float):
	var movevec = Vector2(0, 0)
	if inputs[0]:
		movevec.y += -1
	if inputs[1]:
		movevec.y += 1
	if inputs[2]:
		movevec.x += -1
		$PlayerSprite.flip_h = true
	if inputs[3]:
		movevec.x += 1
		$PlayerSprite.flip_h = false
	self.position += movevec * self.speed * delta

func shoot(inputs: Array[bool]):
	if not inputs[4]:
		return
	if not self.can_shoot:
		return
	var new_bullet = self.bullet.instantiate()

func _process(delta):
	var inputs = self.get_inputs()
	self.move(inputs, delta)
	self.shoot(inputs)
