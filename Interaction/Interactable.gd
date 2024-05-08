class_name Interactable extends Node2D

@export var interaction_label = ""
@export var interaction_type = ""
@export var interaction_value = ""
@export var interaction_radius = 10

func _on_ready():
	$CollisionShape2D.shape.radius = interaction_radius
