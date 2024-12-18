extends Node


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape: CollisionShape3D = $CollisionShape3D

func _ready():
	# Убедитесь, что узел CollisionShape3D активен для ввода
	collision_shape.input_pickable = true

func _input_event(viewport, event, shape_idx):
	# Проверяем, произошёл ли клик по CollisionShape3D
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		play_animation()

func play_animation():
	var anim_name = "m_Donkey_tickleHeavyLoop"  # Имя вашей анимации
	if animation_player.has_animation(anim_name):
		animation_player.play(anim_name)
		print("Анимация запущена:", anim_name)
	else:
		print("Анимация не найдена!")
