extends Control

onready var player = get_parent()
onready var direction = $Control/direction
onready var velocity = $Control/velocity
onready var mesh = $Control/mesh

func _physics_process(delta):
	
	var h_rot = get_parent().get_node("Camroot/h").global_transform.basis.get_euler().y
	
	$Control.set_rotation(h_rot)
	
	direction.rotation = atan2(-player.direction.z, -player.direction.x)
	velocity.position = Vector2(-player.velocity.x, -player.velocity.z) * 10
	mesh.rotation_degrees = -90-get_node("../Mesh").rotation_degrees.y - player.rotation_degrees.y
