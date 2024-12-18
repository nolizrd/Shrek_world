extends Node3D

# Центр области движения
@export var center: Vector3 = Vector3(120, 3, 120)

# Радиус спирали
@export var radius: float = 10.0

# Высота спирали (диапазон Y)
@export var height_range: Vector2 = Vector2(5, 15)

# Скорость движения по спирали
@export var speed: float = 1.0

# Время для расчёта позиции
var time: float = 0.0

func _process(delta: float):
	time += delta * speed

	# Вычисляем положение по спирали
	var x = center.x + radius * -cos(time)
	var y = center.y + lerp(height_range.x, height_range.y, (sin(time) + 1) / 2)
	var z = center.z + radius * sin(time)

	global_transform.origin = Vector3(x, y, z)
