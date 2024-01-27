/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Idle
if(speed == 0 && image_angle == 0) {
	is_idle = true;
}

// Check input
var _current_direction = 0;

if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
	_current_direction = 1;
}

if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
	_current_direction = -1;
}

if (is_idle) {
	if (_current_direction != 0) {
		// If player input stop idle
		is_idle = false;
		idle_time = 0;
		idle_countdown = 15;
	} else {
		if (idle_countdown > 0) {
			idle_countdown --;
		} else {
			// If idle then do animation
			speed = sin(idle_time) * 5;
			image_angle = sin(idle_time) * 25;
			idle_time += 0.05;
		}
	}
}


// Friction
if (abs(speed) > 0) {
	if (abs(speed) < h_friction) {
		speed = 0;
	} else {
		speed += (speed > 0 ? -1 : 1) * h_friction;
	}
}



// Go back to standing straight
if (is_not_straight(image_angle)) {
	if (abs(image_angle) < angular_bounce) {
		image_angle = 0;
	} else {
		if (!(_current_direction != 0 && (image_angle == max_angle || image_angle == min_angle))) {
			image_angle += get_tilt(image_angle) * angular_bounce;
		}
	}
}



speed += calculate_speed_increment(speed, _current_direction);
image_angle += calculate_rotation_increment(image_angle, _current_direction);

if (place_meeting(x, y, obj_falling)) {
	var _obj_collision = instance_place(x, y, obj_falling);
	if (_obj_collision) {
		if (_obj_collision.percentage == 0) {
			_obj_collision.in_collision = true;
			_obj_collision.malavaro = self;
			_obj_collision.img_angle_in_collision = image_angle + 90;
			_obj_collision.spd = _obj_collision.speed + (speed / 2);
			if (instance_place(x, y, obj_elephant)) {
				_current_direction = change_direction_on_collision(_obj_collision.hspeed);
			}
			if (instance_place(x, y, obj_contortionist)) {
				_current_direction = change_direction_on_collision(_obj_collision.hspeed / 2);
			}
		}
	}
}

// Malavaro hit edge screen
if (x <= sprite_width/2 || x >= room_width - sprite_width/2) {
	speed = 0;
	x = x <= sprite_width/2 ? sprite_width/2 + 1 : room_width - sprite_width/2 - 1;
}
