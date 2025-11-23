extends Node2D

var itens_list = [
	preload("res://books_datas/book_of_losers.tres"),
	preload("res://books_datas/book_of_losers.tres"),
	preload("res://books_datas/book_of_losers.tres"),
	preload("res://books_datas/book_of_losers.tres"),
	preload("res://books_datas/book_of_losers.tres"),
	preload("res://books_datas/green_calls.tres"),
	preload("res://books_datas/green_calls.tres"),
	preload("res://books_datas/green_calls.tres"),
	preload("res://books_datas/green_calls.tres"),
	preload("res://books_datas/green_calls.tres"),
]

var has_products = false
 
func _ready() -> void:
	for i in 4:
		if randf_range(0, 1) > 0.5:
			var marker: Marker2D = $StoreBackground.get_child(randi_range(0, 3))
			if marker == null: return
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
