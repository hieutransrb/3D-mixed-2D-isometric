extends Camera3D
var height = 30
var z_difference = 52

# Called when the node enters the scene tree for the first time.
func _ready():
	self.size = get_viewport().size.x * 0.01 * 0.50
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _physics_process(delta):
	var target: Vector3 = self.get_parent().get_parent().get_node('Player').global_transform.origin
	var new_position: Vector3 = Vector3(target.x, height, target.z + z_difference)
	self.position = new_position
	pass
