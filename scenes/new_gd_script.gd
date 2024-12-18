extends Node3D

func _ready():
	var animation_player = $AnimationPlayer  # Пытаемся получить AnimationPlayer

	if animation_player:  # Проверяем, что узел найден
		if animation_player.has_animation("mixamo_com"):  # Проверяем существование анимации
			animation_player.play("mixamo_com")  # Запускаем анимацию
			print("Анимация 'mixamo_com' запущена!")
		else:
			print("Анимация 'mixamo_com' не найдена!")
	else:
		print("Ошибка: AnimationPlayer не найден!")
