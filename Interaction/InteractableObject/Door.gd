extends StaticBody2D

var is_open: bool = false

func _ready():
	$DoorClosed.visible = true
	
func player_interaction():
	if is_open:
		$AnimationPlayer.play_backwards("door_open")
		$DoorOpened.visible = false
		$DoorClosed.visible = true
		$CollisionShape2D.disabled = false
	else:
		$AnimationPlayer.play("door_open")
		$DoorOpened.visible = true
		$DoorClosed.visible = false
		$CollisionShape2D.disabled = true;
	
	is_open = !is_open
	print($CollisionShape2D.disabled)

