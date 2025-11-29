extends Node2D
class_name Store

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

var has_products = false
 
func _ready() -> void:
	for i in 14:
		var marker: Marker2D = $StoreBackground.get_child(randi_range(0, 6))
		if marker == null or marker.get_child_count() > 0: return
		var item = load("res://store_slot/store_slot.tscn").instantiate()
		item.item_to_sell = itens_list[randi_range(0, itens_list.size()-1)]
		item.seller = $SellerNPC
		marker.add_child(item)
	has_products = true

func _process(_delta: float) -> void:
	if not has_products: return
	if products_to_sale() <= 0:
		has_products = false
		$SellerNPC.without_products()

func products_to_sale():
	var i = 0
	for slot in $StoreBackground.get_children():
		if slot.get_child_count() > 0:
			i += 1
	return i
