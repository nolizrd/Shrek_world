extends Camera3D

# Скорость движения камеры
@export var move_speed: float = 40.0

# Скорость вращения камеры
@export var look_speed: float = 0.3

# Ограничения по углу обзора (чтобы не вращаться вокруг оси)
var max_pitch_angle: float = 85.0  # Максимальный наклон вверх
var min_pitch_angle: float = -85.0  # Максимальный наклон вниз

# Внутренние переменные для углов поворота
var yaw: float = 0.0
var pitch: float = 0.0

# Высота камеры (на уровне земли)
@export var fixed_height: float = 15  # Высота, как у человека

func _ready():
	# Захватываем курсор мыши
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	# Устанавливаем начальную высоту камеры
	global_transform.origin.y = fixed_height

func _process(delta: float):
	handle_movement(delta)

func _input(event):
	if event is InputEventMouseMotion:
		handle_look(event.relative)

	# Освобождаем курсор мыши по нажатию Escape
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		print("Курсор мыши освобождён.")

func handle_movement(delta: float):
	var direction = Vector3.ZERO

	# WASD для движения вперёд/назад/влево/вправо
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x

	# Нормализация для равномерного движения
	if direction != Vector3.ZERO:
		direction = direction.normalized()

	# Перемещение камеры по X и Z (без изменения Y)
	var new_position = global_transform.origin + direction * move_speed * delta
	new_position.y = fixed_height  # Фиксируем высоту камеры

	global_transform.origin = new_position

func handle_look(mouse_delta: Vector2):
	# Изменяем углы вращения (yaw и pitch)
	yaw -= mouse_delta.x * look_speed
	pitch -= mouse_delta.y * look_speed

	# Ограничиваем наклон (pitch) между min и max углами
	pitch = clamp(pitch, min_pitch_angle, max_pitch_angle)

	# Применяем вращение к камере
	rotation_degrees = Vector3(pitch, yaw, 0)
