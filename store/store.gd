extends Node2D

var itens_list = [
	preload("res://books_datas/book0.tres"),
	preload("res://books_datas/book1.tres"),
	preload("res://books_datas/book2.tres"),
	preload("res://books_datas/book3.tres"),
	preload("res://books_datas/book4.tres"),
	preload("res://books_datas/book5.tres"),
	preload("res://books_datas/book6.tres"),
	preload("res://books_datas/book7.tres"),
	preload("res://books_datas/book8.tres"),
	preload("res://books_datas/book9.tres"),
	preload("res://books_datas/book10.tres"),
	preload("res://books_datas/book11.tres"),
	preload("res://books_datas/book12.tres"),
	preload("res://books_datas/book13.tres"),
	preload("res://books_datas/book14.tres"),
	preload("res://books_datas/book15.tres"),
	preload("res://books_datas/book16.tres"),
	preload("res://upgrades_datas/upgrade0.tres"),
	preload("res://upgrades_datas/upgrade1.tres"),
	preload("res://upgrades_datas/upgrade2.tres"),
	preload("res://upgrades_datas/upgrade3.tres"),
	preload("res://upgrades_datas/upgrade4.tres"),
	preload("res://upgrades_datas/upgrade5.tres"),
	preload("res://upgrades_datas/upgrade6.tres"),
	preload("res://upgrades_datas/upgrade7.tres"),
	preload("res://upgrades_datas/upgrade8.tres"),
	preload("res://upgrades_datas/upgrade9.tres"),
	preload("res://upgrades_datas/upgrade10.tres"),
	preload("res://upgrades_datas/upgrade11.tres"),
	preload("res://upgrades_datas/upgrade12.tres"),
	preload("res://upgrades_datas/upgrade13.tres"),
	preload("res://upgrades_datas/upgrade14.tres"),
	preload("res://upgrades_datas/upgrade15.tres")
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
