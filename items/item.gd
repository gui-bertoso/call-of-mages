extends Resource
class_name ItemData

@export var item_name: String = ""
@export var item_description: String = ""
@export var item_value: int = 1
@export var item_image: CompressedTexture2D = null
@export var item_scene: PackedScene = null
@export_enum("book", "upgrade") var item_type: String = ""
@export var price: int = 1
