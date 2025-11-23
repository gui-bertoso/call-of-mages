extends NPC
class_name SellerNPC

func set_selling_item(item):
	set_text("This item cust: " + str(item.price))

func clear_message():
	$Label.text = ""
	
func without_products():
	set_text("Nothing to buy here")

func set_text(text):
	var new_text = ""
	for i in len(text):
		new_text += text[i]
		await get_tree().create_timer(0.05).timeout
		$Label.text = new_text

func sell_item():
	if Globals.character == null: return
	$SoulTradeFX/Node2D.global_position = Globals.character.global_position
	$SoulTradeFX.trade()
