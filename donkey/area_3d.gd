extends Area3D
@onready var animation_player = $"../../../AnimationPlayer"
@onready var buttons = get_node("/root/Sketchfab_Scene/Buttons")

func _on_feed_button_input_event(camera, event, click_position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Кнопка Feed нажата!")
		animation_player.play("m_Donkey_food_eat")

func _on_tickle_button_input_event(camera, event, click_position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Кнопка Tickle нажата!")
		animation_player.play("m_Donkey_tickleIn")

func _on_sleep_button_input_event(camera, event, click_position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Кнопка Sleep нажата!")
		animation_player.play("m_Donkey_fallAsleep")

func _on_kiss_button_input_event(camera, event, click_position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Кнопка Kiss нажата!")
		animation_player.play("m_Donkey_idle2")
