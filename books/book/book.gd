extends Node2D

@export var mana_consume: int = 1
@export var projectile: PackedScene = null
@export var shot_cooldown: float = 0.2

var cooldown: float = 0.0

func _process(_delta: float) -> void:
	cooldown -= _delta
	if cooldown > 0: return
	if Input.is_action_just_pressed("action_fire") and Globals.character.has_mana(mana_consume):
		$GPUParticles2D.emitting = true
		cooldown = shot_cooldown
		var a = projectile.instantiate()
		a.position = global_position
		a.rotation = global_rotation
		get_parent().get_parent().shake_screen()
		Globals.character.consume_mana(1)
		get_tree().current_scene.add_child(a)
