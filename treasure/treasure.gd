extends Node2D
class_name Treasure

var itens_list = [
	preload("res://items/book0.tres"),
	preload("res://items/book1.tres"),
	preload("res://items/book2.tres"),
	preload("res://items/book3.tres"),
	preload("res://items/book4.tres"),
	preload("res://items/book5.tres"),
	preload("res://items/book6.tres"),
	preload("res://items/book7.tres"),
	preload("res://items/book8.tres"),
	preload("res://items/book9.tres"),
	preload("res://items/book10.tres"),
	preload("res://items/book11.tres"),
	preload("res://items/book12.tres"),
	preload("res://items/book13.tres"),
	preload("res://items/book14.tres"),
	preload("res://items/book15.tres"),
	preload("res://items/book16.tres"),
	preload("res://items/upgrade0.tres"),
	preload("res://items/upgrade1.tres"),
	preload("res://items/upgrade2.tres"),
	preload("res://items/upgrade3.tres"),
	preload("res://items/upgrade4.tres"),
	preload("res://items/upgrade5.tres"),
	preload("res://items/upgrade6.tres"),
	preload("res://items/upgrade7.tres"),
	preload("res://items/upgrade8.tres"),
	preload("res://items/upgrade9.tres"),
	preload("res://items/upgrade10.tres"),
	preload("res://items/upgrade11.tres"),
	preload("res://items/upgrade12.tres"),
	preload("res://items/upgrade13.tres"),
	preload("res://items/upgrade14.tres"),
	preload("res://items/upgrade15.tres")
]
 
func _ready() -> void:
	var item = itens_list[randi_range(0, itens_list.size()-1)]
	$PhysicItem.item = item.duplicate()
