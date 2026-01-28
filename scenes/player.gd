extends CharacterBody2D

var direction: Vector2
var speed: int = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	direction= Input.get_vector("left","right", "up", "down", -1.0)
	velocity = direction * speed
	animation()
	move_and_slide()	
	
func animation():
	if direction:
		if direction.y > 0:
			$AnimatedSprite2D.animation = "down"
		elif direction.y < 0:
			$AnimatedSprite2D.animation = "up"
		else:
			$AnimatedSprite2D.animation = "left"
			$AnimatedSprite2D.flip_h = direction.x > 0
	else:
		$AnimatedSprite2D.frame = 0
