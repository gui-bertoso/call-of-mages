extends Node2D

@export var speed: int = 160
@export var damage: int = 1

func _ready() -> void:
	$Area2D.damage = damage

func _process(delta: float) -> void:
	if $RayCast2D.is_colliding():
		$GPUParticles2D.emitting = true
		print("emiting")
		await get_tree().create_timer(0.14).timeout
		print("deleting")
		queue_free()
	else:
		position += (speed * Vector2(1, 0) * delta).rotated(rotation)


func _on_timer_timeout() -> void:
	queue_free()
