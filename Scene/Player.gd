extends CharacterBody2D

@export var speed : float = 200.0
@onready var _animation_player = $AnimationPlayer

var interaction_target: Area2D = null;

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_down"): _animation_player.play("walk_down")
	elif Input.is_action_pressed("move_up"): _animation_player.play("walk_up")
	elif Input.is_action_pressed("move_left"): _animation_player.play("walk_left")
	elif Input.is_action_pressed("move_right"): _animation_player.play("walk_right")
	else: _animation_player.play("idle")
	
	move_and_slide()

func _on_interaction_area_area_entered(area):
	$InteractionComponent/Label.text = area.interaction_label
	interaction_target = area

func _on_interaction_area_area_exited(area):
	$InteractionComponent/Label.text = ""
	interaction_target = null;
	
func _input(event):
	if Input.is_action_just_pressed("interact"): _handle_player_interaction()

func _handle_player_interaction():
	if (interaction_target == null): return
	match interaction_target.interaction_type:
		"door": interaction_target.get_parent().get_parent().player_interaction()
