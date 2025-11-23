extends Node

var quests_dictionary = {
	"First-time Buyer": [
		"Buy your first item in the seller",
		preload("res://assets/books/book0.png"),
		false,
		{
			"buyed_items": 0
		},
		{
			"buyed_items": 1
		}
	],
	"Consumerist": [
		"Buy 5 itens in the seller",
		preload("res://assets/books/book0.png"),
		false,
		{
			"buyed_items": 0
		},
		{
			"buyed_items": 5
		}
	],
	"Frequent Customer": [
		"Buy 12 itens in the seller",
		preload("res://assets/books/book0.png"),
		false,
		{
			"buyed_items": 0
		},
		{
			"buyed_items": 12
		}
	],
	"Collector Of Souls I": [
		"Have 10 souls",
		preload("res://assets/books/book0.png"),
		false,
		{
			"current_souls": 0
		},
		{
			"current_souls": 10
		}
	],
	"Collector Of Souls II": [
		"Have 20 souls",
		preload("res://assets/books/book0.png"),
		false,
		{
			"current_souls": 0
		},
		{
			"current_souls": 20
		}
	],
	"Collector Of Souls III": [
		"Have 30 souls",
		preload("res://assets/books/book0.png"),
		false,
		{
			"current_souls": 0
		},
		{
			"current_souls": 30
		}
		
	],
	"Selfish": [
		"Have 40 souls",
		preload("res://assets/books/book0.png"),
		false,
		{
			"current_souls": 0
		},
		{
			"current_souls": 40
		}
	],
	"Obedient": [
		"complete the guide",
		preload("res://assets/books/book0.png"),
		false,
		{
			"guide_complete": 0
		},
		{
			"guide_complete": 1
		}
	],
	"Starter Killer": [
		"kill 5 different enemies",
		preload("res://assets/books/book0.png"),
		false,
		{
			"any_enemy": 0
		},
		{
			"any_enemy": 5
		}
	],
	"Assassin": [
		"kill 10 different enemies",
		preload("res://assets/books/book0.png"),
		false,
		{
			"any_enemy": 0
		},
		{
			"any_enemy": 10
		}
	],
	"Skilled Killer": [
		"kill 25 different enemies",
		preload("res://assets/books/book0.png"),
		false,
		{
			"any_enemy": 0
		},
		{
			"any_enemy": 25
		}
	],
	"Hunter": [
		"kill 40 different enemies",
		preload("res://assets/books/book0.png"),
		false,
		{
			"any_enemy": 0
		},
		{
			"any_enemy": 40
		}
	],
	"Manic": [
		"kill 50 different enemies",
		preload("res://assets/books/book0.png"),
		false,
		{
			"any_enemy": 0
		},
		{
			"any_enemy": 50
		}
	],
	"Experienced": [
		"Reach the maximum level",
		preload("res://assets/books/book0.png"),
		false,
		{
			"current_level": 0
		},
		{
			"current_level": 14
		}
	],
	"Observer": [
		"Find the secret first level",
		preload("res://assets/books/book0.png"),
		false,
		{
			"secret_room_one": 0
		},
		{
			"secret_room_one": 1
		}
	],
	"Good Observer": [
		"Find the secret second level",
		preload("res://assets/books/book0.png"),
		false,
		{
			"secret_room_two": 0
		},
		{
			"secret_room_two": 1
		}
	],
	"Eagle Eyes": [
		"Find the secret third level",
		preload("res://assets/books/book0.png"),
		false,
		{
			"secret_room_third": 0
		},
		{
			"secret_room_third": 1
		}
	],
	"Cosmic Power": [
		"Get a cosmic overdose",
		preload("res://assets/books/book0.png"),
		false,
		{
			"cosmic_overdoses": 0
		},
		{
			"cosmic_overdoses": 1
		}
	]
}

func catch_quest_event(type: String, value: Variant=0):
	match type:
		"enemy_killed":
			for quest in quests_dictionary:
				var quest_data = quests_dictionary[quest]
				if quest_data[3].has("any_enemy"):
					quest_data[3]["any_enemy"] += 1
		"guide_complete":
			for quest in quests_dictionary:
				var quest_data = quests_dictionary[quest]
				if quest_data[3].has("guide_complete"):
					quest_data[3]["guide_complete"] += 1
		"cosmic_overdoses":
			for quest in quests_dictionary:
				var quest_data = quests_dictionary[quest]
				if quest_data[3].has("cosmic_overdoses"):
					quest_data[3]["cosmic_overdoses"] += 1
		"secret_room_one":
			for quest in quests_dictionary:
				var quest_data = quests_dictionary[quest]
				if quest_data[3].has("secret_room_one"):
					quest_data[3]["secret_room_one"] += 1
		"secret_room_two":
			for quest in quests_dictionary:
				var quest_data = quests_dictionary[quest]
				if quest_data[3].has("secret_room_two"):
					quest_data[3]["secret_room_two"] += 1
		"secret_room_third":
			for quest in quests_dictionary:
				var quest_data = quests_dictionary[quest]
				if quest_data[3].has("secret_room_third"):
					quest_data[3]["secret_room_third"] += 1
		"current_level":
			for quest in quests_dictionary:
				var quest_data = quests_dictionary[quest]
				if quest_data[3].has("current_level"):
					quest_data[3]["current_level"] += value
		"current_souls":
			for quest in quests_dictionary:
				var quest_data = quests_dictionary[quest]
				if quest_data[3].has("current_souls"):
					quest_data[3]["current_souls"] += 1
		"buyed_items":
			for quest in quests_dictionary:
				var quest_data = quests_dictionary[quest]
				if quest_data[3].has("buyed_items"):
					quest_data[3]["buyed_items"] += 1
	
	verify_complete_quests()

func verify_complete_quests():
	var quest_name = ""
	var quest_description = ""
	var quest_texture = ""
	
	for quest in quests_dictionary:
		var quest_data = quests_dictionary[quest]
		if quest_data[2] == false:
			var conditions_quantity = quest_data[3].size()
			for i in quest_data[3]:
				if quest_data[3][i] >= quest_data[4][i]:
					conditions_quantity -= 1
			if conditions_quantity <= 0:
				quest_name = quest
				quest_description = quest_data[0]
				quest_texture = quest_data[1]
				get_tree().call_group("QuestNotifier", "new_quest_complete", quest_name, quest_description, quest_texture)
				quest_data[2] = true
