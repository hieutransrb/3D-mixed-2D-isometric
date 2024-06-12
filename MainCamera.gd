extends Camera3D
var height = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	self.size = get_viewport().size.x * 0.01 * 0.50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	var target: Vector3 = self.get_parent().get_node('Player').global_transform.origin
	var new_position:Vector3 = target
	new_position.y = height
	self.position = new_position
	pass
	
