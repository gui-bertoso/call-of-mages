extends Control

var is_selected = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_level_up_screen"):
		$ColorRect.visible = !$ColorRect.visible

func _on_move_speed_button_up() -> void:
	Globals.extra_move_speed += 20
	is_selected = true

func _on_max_souls_button_up() -> void:
	Globals.character.souls += 1
	get_tree().call_group("SoulsContainer", "populate_souls")
