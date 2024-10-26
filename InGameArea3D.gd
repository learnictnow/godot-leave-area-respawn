extends Area3D

@onready var death_timer = $DeathTimer
@onready var countdown_timer = $CountdownTimer
@onready var ui = $RespawnAreaUI
@onready var countdown_label = $RespawnAreaUI/VBoxContainer/CountdownLabel
@export var respawn_time = 5
var respawn_countdown_timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_exited(body):
	if body.is_in_group("Player"):
		#death_timer.start(respawn_countdown_timer)
		respawn_countdown_timer = respawn_time
		countdown_label.text = str(respawn_countdown_timer)
		countdown_timer.start()
		
		ui.visible = true
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Level.tscn")
	pass # Replace with function body.


func _on_body_entered(body):
	if body.is_in_group("Player"):
		countdown_timer.stop()
		ui.visible = false
	pass # Replace with function body.



func _on_countdown_timer_timeout():
	respawn_countdown_timer -= 1
	countdown_label.text = str(respawn_countdown_timer)
	
	if respawn_countdown_timer <= 0:
		countdown_timer.stop()
		get_tree().change_scene_to_file("res://Level.tscn")
	
	pass # Replace with function body.
