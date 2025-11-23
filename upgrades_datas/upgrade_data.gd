extends Resource
class_name UpgradeData

@export var upgrade_name: String = ""
@export var upgrade_description: String = ""
@export_enum("extra_damage", "extra_bullet_speed", "extra_attack_speed", "extra_bullet_size") var upgrade_type: String = ""
@export var upgrade_value: int = 1
@export var upgrade_image: CompressedTexture2D = null
@export var price: int = 1
