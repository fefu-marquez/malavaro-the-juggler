/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
gravity_direction = 270;
depth = -2
spd = random_range(5, 20);
spd_gravity = 0.7;
img_angle_spd = 0;
image_speed = 0.2;
score_points = 100;
bounces = 0;
idle_anim_y = animcurve_get_channel(ac_balance_object, "curveY");
idle_anim_x = animcurve_get_channel(ac_balance_object, "curveX");
collision_anim = animcurve_get_channel(ac_throw_objects, "curve"); 
is_idle = true;
percentage = 0;
start_position = [x, y];
timer = irandom_range(120, 240);
position = 0;
has_scored = false;
is_destroyed = false;
has_gained_life = false;
anim_timer = 10;
in_collision = false;
img_angle_in_collision = 0;
malavaro = instance_find(obj_malavaro,1);
