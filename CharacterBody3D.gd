extends CharacterBody3D

@onready var navigation_agent : NavigationAgent3D = $NavigationAgent3D

var movement_speed = 5
var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	navigation_agent.path_desired_distance = 0.1
	navigation_agent.target_desired_distance = 0.1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _physics_process(_delta):
	if navigation_agent.is_navigation_finished():
		return
	if target:
		var current_agent_position: Vector3 = self.global_position
		var next_path_position: Vector3 = navigation_agent.get_next_path_position()
		var direction = current_agent_position.direction_to(next_path_position)
		self.velocity = direction * movement_speed
		move_and_slide()

func _on_static_body_3d_input_event(_camera, event, event_position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		target = get_node('../Target')
		target.transform.origin = event_position
		navigation_agent.target_position = event_position
