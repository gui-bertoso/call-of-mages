extends CharacterBody2D

@export var SPEED = 100.0
@export var health = 5
@export var gived_exp: int = 1

var player_reference

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
	
	QuestsManager.catch_quest_event("any_enemy")
	
	health -= area.damage
	if health < 0:
		Globals.character.add_exp(gived_exp)
		queue_free()
