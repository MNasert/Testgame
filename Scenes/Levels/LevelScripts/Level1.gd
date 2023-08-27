extends Node2D

@export var enemy1: PackedScene

@export var wavesize: int = 0
@export var pause: float = 0
@export var increase_diff: float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Wavetimer.start(self.pause)

func _process(delta):
	pass

func _on_wavetimer_timeout():
	for i in range(self.wavesize):
		var e = self.enemy1.instantiate()
		var pos = Vector2(randf_range(-3000, 3000), randf_range(-3000, 3000))
		e.init(pos)
		add_child(e)
	self.wavesize = self.wavesize + self.wavesize*(self.increase_diff)
	$Wavetimer.start(pause)
