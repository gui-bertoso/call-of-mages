extends HBoxContainer

func populate_souls():
	for i in get_children():
		i.queue_free()
	
	var souls = Globals.character.souls
	var remaining_souls = souls
	
	var layers = [
		{"min": 30, "div": 6, "texture": load("res://yellow_soul.png")},
		{"min": 20, "div": 4, "texture": load("res://orange_soul.png")},
		{"min": 11, "div": 2, "texture": load("res://pink_soul.png")},
		{"min": 0, "div": 1, "texture": load("res://soul.png")}
	]
	
	for i in range(layers.size()):
		var layer = layers[i]
		if remaining_souls >= layer["min"]:
			var amount = int(remaining_souls / layer["div"])
			for j in range(amount):
				var rect = TextureRect.new()
				rect.custom_minimum_size = Vector2(32, 32)
				rect.texture = layer["texture"]
				add_child(rect)
			remaining_souls -= amount * layer["div"]
			
			var next_layer_index = i + 1
			while remaining_souls > 0 and next_layer_index < layers.size():
				var next_layer = layers[next_layer_index]
				if remaining_souls >= next_layer["div"]:
					var amt = int(remaining_souls / next_layer["div"])
					for x in range(amt):
						var rect = TextureRect.new()
						rect.custom_minimum_size = Vector2(32, 32)
						rect.texture = next_layer["texture"]
						add_child(rect)
					remaining_souls -= amt * next_layer["div"]
				next_layer_index += 1

func _ready():
	populate_souls()
