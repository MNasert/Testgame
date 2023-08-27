extends Button


@export var target: PackedScene
@export var targetScene: String = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_pressed():
	if not target:
		if targetScene == "":
			get_tree().quit(0)
			return
	if target:
		get_tree().change_scene_to_packed(target)
		return
	if targetScene:
		get_tree().change_scene_to_file(targetScene)
		return
