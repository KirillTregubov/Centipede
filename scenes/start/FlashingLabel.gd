extends Label

@onready var flash_timer = $Timer
var shown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	flash_timer.wait_time = 0.75
	flash_timer.timeout.connect(_on_flash_timer_timeout)	
	flash_timer.start()

func _on_flash_timer_timeout():
	# Toggle visibility on each timer timeout
	var status = shown % 3
	if (status == 1 || status == 2):
		self.visible = !self.visible
	shown = (shown + 1) % 3
