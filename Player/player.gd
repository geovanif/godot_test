extends Area2D

@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("down"):
		direction.y = 1
		$AnimatedSprite2D.play('up')
	if Input.is_action_pressed("left"):
		direction.x = -1
		$AnimatedSprite2D.play("walk")
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.play("walk")
		direction.x = 1
	if Input.is_action_pressed('up'):
		direction.y = -1
		$AnimatedSprite2D.play('up')
		
	if direction.length() > 0:
		direction = direction.normalized() * speed
		position += direction * delta
	else:
		$AnimatedSprite2D.stop()
