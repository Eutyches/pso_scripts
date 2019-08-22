/*


Vehicle Cruise Control Mod http://opendayz.net/threads/vehicle-cruise-control-server-side-script.18583/
		by Allen http://kaganovsky.ca
		version: 20140218 (initial upload to GitHub)


		

Modifications
		by mgm		http://epochmod.com/forum/index.php?/user/16852-mgm/
		version: 201502222 (modification #1)


		

--- CHANGELOG for mgm's MODIFICATIONs ---
1. [CHANGED]	Removed pre-configured "Cruise Control Speed Option" table.
				This model was not flexible enough as what's "slow speed" for truck is not applicable to SUV and so on.
	
				with the New System:

						When activated (via mouse wheel option), cruise control locks your vehicle speed to nearest 10 of your current speed.
							e.g.: Activated while travelling at 118 km/h, cruise control will lock vehicle speed to 110 km/h.
							e.g.: Activated while travelling at 52 km/h, cruise control will lock vehicle speed to 50 km/h.
							
						Minimum speed needed to activate: 5 km/h [which will lock speed to 20 km/h].
						Maximum speed: no upper limit set.

2. [CHANGED] Texts got a revamp.
				Main idea: Player's attention is a premium and we should limit our communication to a minimum. 
				They should easily see the MAIN FEEDBACK from us (activated/deactivated/speed set to N).
				
				2.1. Emphasize with bigger fonts (messages like ACTIVATED - DEACTIVATED && CURRENT ACTIVE SPEED are much bigger now).
				2.2. Color changed for "DEACTIVATED cruise control" response. The dark red (#990000) was difficult to read - it is a brighter red (#FF3333) now.
				2.3. Removed "CRUISE CONTROL" title from the top and bottom of all message windows. It is already obvious enough this is the Cruise Control system dialogbox.
				2.4. Next Action is clearly stated with a separate text on a new line (e.g.: "Press S to terminate", "Use mouse  wheel to reactivate") for all feedback messages from Cruise Conrol system.
			
3. [NEW FEAUTURE] Conditional Check: cruise control can activate/stay running, only when the vehicle engine is on. No more magically flying vehicles with powered off (or damaged) engines!





--- mgm's MODIFICATIONs -- WISHLIST/TODO LIST---
1. [ADD] Add a Cruise Control icon.
2. [ADD] Realism.
		2.1. Normally when turning, vehicles lose speed. With Cruise Control on, they always move at the same speed  which is unrealistic.
		2.2. A vehicle going slightly over a bump gets into aeroplane mode. Realism code should fix this too.

*/





cruiseControl = 
compileFinal "
	_trigger2 = createTrigger [""EmptyDetector"", [0,0,0]];
	_trigger2 setTriggerArea [0, 0, 0, false];
	_trigger2 setTriggerActivation [""NONE"", ""PRESENT"", true];
	_trigger2 setTriggerStatements [""('Car' countType [(vehicle player)] > 0)"",
	""uwg_cruise = vehicle player;
	uwg_cruise_control = uwg_cruise addAction ['Cruise Control','["""""""",call cruiseControlMenu,player,false] spawn BIS_fnc_MP;',[], 0, false, false, '', 'driver uwg_cruise == player'];"",
	""uwg_cruise removeAction uwg_cruise_control; uwg_cruise = nil;""];
";
publicVariable "cruiseControl";

cruiseControlMenu =
compileFinal "
	cruiseControlSet = false;	
	_velocity = velocity uwg_cruise;
	_x = _velocity select 0;
	_y = _velocity select 1;
	_xy = sqrt ( _x*_x + _y*_y ) * 3.6;
	cspeed = 0;
	if (_xy >= 5 && _xy < 25) then {
		cspeed = 20;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 25 && _xy < 35) then {
		cspeed = 30;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 35 && _xy < 45) then {
		cspeed = 40;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 45 && _xy < 55) then {
		cspeed = 50;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 55 && _xy < 65) then {
		cspeed = 60;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 65 && _xy < 75) then {
		cspeed = 70;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 75 && _xy < 85) then {
		cspeed = 80;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 85 && _xy < 95) then {
		cspeed = 90;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 95 && _xy < 105) then {
		cspeed = 100;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 105 && _xy < 115) then {
		cspeed = 110;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (_xy >= 115 && _xy < 200) then {
		cspeed = 120;
		cruiseControlSet = true;
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#33CC00'> Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>Cruise Speed now locked to: %1 km/h</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Terminate Cruise with: Breaks (press S)</t><br/><br/>"", cspeed
				];
	};

	if (!cruiseControlSet) then {
		hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><br/><t size='1.40' font='puristaLight' align='left' color='#FF3333'> NOT Activated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='center' color='#CC9900'></t><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Use the mouse wheel to activate.<br/><br/>""
				];
	} else {
		uwg_cruise removeAction uwg_cruise_control;
		(findDisplay 46) displayAddEventHandler [""KeyDown"",""
			_keyDown = _this select 1;
			if (_keyDown == 0x1F) then {
				if (cruiseControlSet) then {
					uwg_cruise_control = uwg_cruise addAction ['Cruise Control','["""""""",call cruiseControlMenu,player,false] spawn BIS_fnc_MP;',[], 0, false, false, '', 'driver uwg_cruise == player'];
					cruiseControlSet = false;
					hint parseText format [""""
								<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#FF3333'> Deactivated!</t><br/><br/>
								<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Use the mouse wheel to activate.<br/><br/>""""
							];
				};
			};""];
	};
	
	while {cruiseControlSet} do {
		if (getDammage uwg_cruise > 0.1) exitWith {
			cruiseControlSet = false;
			hint parseText format [""
								<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#FF3333'> Deactivated!</t><br/><br/>
								<t size='0.90' font='puristaLight' align='left'>The vehicle is too damaged to use Cruise Control, try repairing the vehicle.<br/><br/>
								<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Use the mouse wheel to reactivate after the repairs.<br/><br/>""
							];
		};
		if (fuel uwg_cruise < 0.1) exitWith {
			cruiseControlSet = false;
			hint parseText format [""
								<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#FF3333'> Deactivated!</t><br/><br/>
								<t size='0.90' font='puristaLight' align='left'>The vehicle does not have enough fuel.<br/><br/>
								<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Use the mouse wheel to reactivate after refueling.<br/><br/>""
							];
		};
		_vh = vehicle player;
		if (!isEngineOn _vh) then
		{
			hint parseText format [""
					<t size='1.40' font='puristaLight' align='left'>Cruise Control:</t><t size='1.40' font='puristaLight' align='left' color='#FF3333'> Deactivated!</t><br/><br/>
					<t size='0.90' font='puristaLight' align='left'>The vehicle engine need to be running.<br/><br/>
					<t size='0.90' font='puristaLight' align='left' color='#CC9900'>Use the mouse wheel to reactivate after turning the engine on.<br/><br/>""
			];
			uwg_cruise_control = uwg_cruise addAction ['Cruise Control','["""""""",call cruiseControlMenu,player,false] spawn BIS_fnc_MP;',[], 0, false, false, '', 'driver uwg_cruise == player'];
			cruiseControlSet = false;
		}
		else
		{
			_dir = getDir uwg_cruise;
			_newX = (sin _dir)*(cspeed/3.6);
			_newY = (cos _dir)*(cspeed/3.6);
			uwg_cruise setVelocity [_newX, _newY, (velocity uwg_cruise) select 2];
		};
		sleep 0.05;
	};
";
publicVariable "cruiseControlMenu";