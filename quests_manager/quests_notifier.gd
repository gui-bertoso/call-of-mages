extends Control

func new_quest_complete(quest_name, quest_description, quest_texture=preload("res://books/book0.tscn")):
	var a = load("res://quests_manager/quest.tscn").instantiate()
	a.set_quest(quest_name, quest_description, quest_texture)
	$VBoxContainer.add_child(a)
