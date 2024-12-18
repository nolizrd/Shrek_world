extends Area3D

@onready var particles = $GPUParticles3D

# Флаг для отслеживания состояния фонтана
var is_emitting: bool = false

func _input_event(camera, event, click_position, normal, shape_idx):
	# Проверяем, был ли клик левой кнопкой мыши
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		toggle_fountain()

func toggle_fountain():
	is_emitting = !is_emitting  # Переключаем флаг
	particles.emitting = is_emitting  # Включаем или выключаем эмиттер
	print("Фонтан грязи:", "Включен" if is_emitting else "Выключен")
