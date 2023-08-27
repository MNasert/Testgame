extends Node2D

var target: Node2D

@export var speed: float = 0
@export var hp: float = 0
@export var damage: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var target = get_tree().get_nodes_in_group("Player")[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
