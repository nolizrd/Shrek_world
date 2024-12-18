extends Node3D

@onready var animation_player = $AnimationPlayer
@onready var buttons = $Buttons

func _ready():
	# Запускаем анимацию по умолчанию
	if animation_player:
		animation_player.play("m_Donkey_breathe1")
	else:
		print("AnimationPlayer не найден!")

	# Скрываем кнопки при старте
	buttons.visible = false

func _on_area_3d_input_event(camera, event, click_position, normal, shape_idx):
	# Обрабатываем клик на осла
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Осел был нажат!")
		animation_player.play("m_Donkey_gift_cake")
		buttons.visible = true  # Показываем кнопки
