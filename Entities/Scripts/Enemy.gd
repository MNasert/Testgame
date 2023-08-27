extends Node2D

var target: Node2D = null

@export var speed: float = 0
@export var hp: float = 0
@export var damage: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func move(delta):
	if self.target == null:
		self.target = get_tree().get_nodes_in_group("Player")[0]
		return
	var movevec = (self.target.position - self.position).normalized()
	self.position += self.speed * movevec * delta

func _process(delta):
	self.move(delta)
