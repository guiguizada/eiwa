extends KinematicBody2D

export var boost_power = 25
export var max_boost_fuel = 1.0
export var boost_recover_rate = 1.0
export var speed = 200
export var gravity = 20
var velocity = Vector2(0, 0)
var boost_fuel = max_boost_fuel


func _physics_process(delta):
	
	velocity.y += gravity
	if Input.is_action_pressed("right"):
		velocity.x = speed
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
	else:
		velocity.x = 0
	if is_on_floor() and boost_fuel<max_boost_fuel:
		boost_fuel += boost_recover_rate*delta
	if Input.is_action_pressed("up") and boost_fuel>0:
		velocity.y -= boost_power
		boost_fuel -= delta
	print(boost_fuel)
	velocity = move_and_slide(velocity, Vector2(0, -1))
