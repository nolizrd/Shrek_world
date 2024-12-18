extends Node3D

# Границы области полёта
@export var min_bounds: Vector3 = Vector3(-10, 5, -10)  # Минимальные координаты
@export var max_bounds: Vector3 = Vector3(10, 15, 10)  # Максимальные координаты

# Скорость движения дракончика
@export var speed: float = 2.0

# Текущая целевая точка
var target_position: Vector3 = Vector3.ZERO

func _ready():
	# Выбираем начальную точку
	choose_new_target()

func _process(delta: float):
	move_towards_target(delta)

func choose_new_target():
	# Генерируем новую случайную точку внутри заданных границ
	target_position = Vector3(
		randf_range(min_bounds.x, max_bounds.x),
		randf_range(min_bounds.y, max_bounds.y),
		randf_range(min_bounds.z, max_bounds.z)
	)
	print("Новая цель:", target_position)

func move_towards_target(delta: float):
	# Перемещаемся к целевой точке
	var direction = (target_position - global_transform.origin).normalized()
	global_transform.origin += direction * speed * delta

	# Проверяем, достигли ли мы целевой точки
	if global_transform.origin.distance_to(target_position) < 0.5:
		choose_new_target()
