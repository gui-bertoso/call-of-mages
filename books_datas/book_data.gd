extends Resource
class_name BookData

@export var book_name: String = ""
@export var book_description: String = ""
@export var price: int = 1
@export var book_image: CompressedTexture2D = null
@export var book_scene: PackedScene = null
@export_enum("Commom", "Rare", "Epic", "Legendary") var book_rarity: String = "Commom"
