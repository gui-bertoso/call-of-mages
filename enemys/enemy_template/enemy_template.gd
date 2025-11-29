extends CharacterBody2D
class_name Enemy

@export var SPEED = 100.0
@export var health = 5
@export var gived_exp: int = 1

var player_reference

var current_effects = []
var is_burning = false
var is_freezing = false

var speed_backup = 0

func _process(delta: float) -> void:
	apply_effects(delta)
	apply_vfx()

func _physics_process(_delta: float) -> void:
	if player_reference:
		var direction = player_reference.global_position - global_position
		if global_position.distance_to(player_reference.global_position) > 10:
			velocity = direction.normalized() * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_reference = body

func _on_area_2d_body_exited(_body: Node2D) -> void:
	player_reference = null


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	var a = load("res://damage_alert/damage_alert.tscn").instantiate()
	a.text = "-"+str(area.damage)
	get_tree().current_scene.add_child(a)
	a.global_position = $Marker2D.global_position
	$Sprite2D/AnimationPlayer.play("hit_effect")
	
	print("no negocio de contato fisico")
	print("AAA: " + str(area.get_parent().effect_scene))
	if area.get_parent().effect_scene != null:
		add_effect(area.get_parent().effect_scene.duplicate())
		print("effect added")
	
	Achievements.catch_quest_event("any_enemy")
	
	health -= area.damage
	
	if health < 0:
		Globals.character.add_exp(gived_exp)
		queue_free()

func add_effect(effect: Effect):
	current_effects.append(effect)
	match effect.effect_name.to_lower():
		"burning":
			is_burning = true
		"freezing":
			is_freezing = true
			speed_backup = SPEED
			SPEED /= 2
			$Sprite2D/AnimationPlayer2.play("freezed")
		"venom":
			$Sprite2D/AnimationPlayer2.play("onvenom")

func apply_vfx():
	if is_burning:
		$VFX/CPUParticles2D.visible = true
	else:
		$VFX/CPUParticles2D.visible = false
	if is_freezing:
		$Sprite2D.modulate = Color(0, 0, 1.0)
		$VFX/Ice.visible = true
	else:
		$Sprite2D.modulate = Color(1, 1, 1)
		$VFX/Ice.visible = false

func apply_effects(delta):
	for effect: Effect in current_effects:
		effect.effect_duration -= delta
		if effect.effect_duration <= 0:
			match effect.effect_name.to_lower():
				"burning":
					is_burning = false
				"freezing":
					is_freezing = false
					SPEED = speed_backup
					$Sprite2D/AnimationPlayer2.play("unfreezed")
				"venom":
					$Sprite2D/AnimationPlayer2.play("unvenom")
			current_effects.erase(effect)
