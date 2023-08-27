extends Node2D

@export var speed: float = 0
@export var firerate: float = 0  # shots/s
@export var damage: int = 0
@export var health: int = 0

@export var bullet: PackedScene

var firerate_cooldown = 1/firerate  # cooldown in s
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_inputs() -> Array[bool]:
	var inputs: Array[bool] = [0, 0, 0, 0, 0]
	if Input.is_action_just_pressed("up"):
		inputs[0] = 1
	if Input.is_action_just_pressed("down"):
		inputs[1] = 1
	if Input.is_action_just_pressed("left"):
		inputs[2] = 1
	if Input.is_action_just_pressed("right"):
		inputs[3] = 1
	if Input.is_action_just_pressed("shoot"):
		inputs[4] = 1
	return inputs

func move(inputs: Array[bool]):
	var movevec = Vector2(0, 0)
	if inputs[0]:
		movevec.y += -1
	if inputs[1]:
		movevec.y += 1
	if inputs[2]:
		movevec.x += -1
	if inputs[3]:
		movevec.y += 1
	self.position += movevec * self.speed

func shoot(inputs: Array[bool]):
	return

func _process(delta):
	var inputs = self.get_inputs()
	self.move(inputs)
	self.shoot(inputs)
