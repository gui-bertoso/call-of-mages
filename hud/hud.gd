extends CanvasLayer

func level_upped():
	$HBoxContainer/Label3.text = str(Globals.character.current_level)
	$HBoxContainer/Label5.text = str(Globals.level_up_points)
