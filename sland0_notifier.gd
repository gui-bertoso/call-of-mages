extends VisibleOnScreenNotifier2D

@export var _scenario: CanvasGroup = null

func _on_screen_exited() -> void:
	_scenario.visible = false

func _on_screen_entered() -> void:
	_scenario.visible = true
