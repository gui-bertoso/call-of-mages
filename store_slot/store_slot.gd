extends Node2D

@export var item_to_sell: Resource = null
@export var seller: SellerNPC = null

var can_buy = false

func _ready() -> void:
	if item_to_sell is BookData:
		$Sprite2D.texture = item_to_sell.book_image
		$Label.text = item_to_sell.book_name
		$Label2.text = item_to_sell.book_description
	if item_to_sell is UpgradeData:
		$Sprite2D.texture = item_to_sell.upgrade_image
		$Label.text = item_to_sell.upgrade_name
		$Label2.text = item_to_sell.upgrade_description

func _process(_delta: float) -> void:
	if not can_buy: return
	if Input.is_action_just_pressed("action_buy"):
		if Globals.character.souls >= item_to_sell.price:
			Globals.character.consume_souls(item_to_sell.price)
			Achievements.catch_quest_event("buyed_items")
			seller.sell_item()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	can_buy = true
	seller.set_selling_item(item_to_sell)
	$Label.show()
	$Label2.show()

func _on_area_2d_body_exited(_body: Node2D) -> void:
	can_buy = false
	seller.clear_message()
	$Label.hide()
	$Label2.hide()
