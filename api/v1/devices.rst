
Devices
########################################

General
****************************************

.. http:get:: /controllers/(int:controller_id)/modules/(int:module_id)

	Retrieves all the modules (devices) registered to this controller - can target a specific module_id device, gets all if module_id is not set

	:>json boolean success: Flag to check if method call was a success
	:>json array data: All the device objects in an array
	:>json int id: Device id number
	:>json string label: Name of the device - shown in ui
	:>json int serial_number: Serial number - used in authentication
	:>json string verification_code: Series of numbers and/or letters (case sensitive) for authentication
	:>json int type: Type code
	:>json boolean connected: Flag to see if device is connected to the controller
	:>json boolean weather_station: Flag to see whether or not device is used as weather station
	:>json object error: Error message information
	:>json int error.code: Error code id
	:>json string error.msg: Error message from device
	:>json object metadata: All the misc. data is stored here as "key" : data pairs
	:>json int metadata.order: ASK
	:>json boolean away: Flag to see whether or not the device is in away state
	:>json object temperature: Temperature data
	:>json float temperature.current: Current measured average temperature with two decimal accuracy
	:>json float temperature.target: Current target temperature to achieve
	:>json object temperature.warning: All the temperature warning limits
	:>json int temperature.warning.min: Limit minimum when temperature warnings are sent
	:>json int temperature.warning.max: Limit maximum when temperature warnings are sent
	:>json boolean temperature.advance: Flag the check whether or not advance heating is on
	:>json int temperature.safety: Safety target temperature when connection is ofline 30min. or more
	:>json object temperature.floor_sensor: Settings to show if floor sensor controls, is in use or is disabled - also saves the floor temperature in its own variable
	:>json float temperature.floor_sensor.current: Current floor temperature
	:>json string temperature.floor_sensor.mode: Current floor sensor mode - installed, control_by and null
	:>json object temperature.freeze_limit: Freeze limit data
	:>json boolean temperature.freeze_limit.on: Flag to see whether or not the freeze limit is in use
	:>json int temperature.freeze_limit.when: Temperature minimum for freeze limit - needs to be set according to heater specifications
	:>json object humidity: All the humidity data
	:>json float humidity.current: Current measured relative humidity with two decimal accuracy
	:>json object humidity.warning: All the humidity warning limits
	:>json int humidity.warning.min: Limit minimum when humidity warnings are sent
	:>json int humidity.warning.max: Limit maximum when humidity warnings are sent
	:>json object electricity: Electricity data
	:>json object electricity.price: Price data
	:>json string electricity.price.max_effect: Effect of stock electricity prices (should be int or float?)
	:>json string manufacturer: Manufacturer of current ASHP unit
	:>json ISO-8601 rapid_heat: Rapid heating on ASHP !DEPRECATED!
	:>json int power: Maximum power consumption of heater in wats

	Example response:

	.. code-block:: json

		{
			"success": true,
			"data": {
				"id": 22,
				"label": "patteri3",
				"serial_number": 10115,
				"verification_code": "12345678",
				"type": 2,
				"connected": false,
				"weather_station": null,
				"error": {
					"code": 0,
					"msg": "Messages not in use so far."
				},
				"metadata": {
					"order": 4
				},
				"away": false,
				"temperature": {
					"current": 0,
					"target": 23.32,
					"warning": {
						"min": -50,
						"max": 50
					},
					"advance": false,
					"safety": 20,
					"floor_sensor": {
						"current": null,
						"mode": "off"
					},
					"heating": false
				},
				"humidity": {
					"current": 0,
					"warning": {
						"min": 0,
						"max": 100
					}
				},
				"electricity": {
					"price": {
						"max_effect": "1.0"
					}
				},
				"power": 0
			}
		}

.. http:put:: /controllers/(int:controller_id)/modules/(int:module_id)

	Creates a new device according to parameters - controller_id, label, serial_number and ferification_code are required, type can not be sot through this method. type is set outside of api. Proper functionality requires type != 0. If physical device is found, controller gets and sets type accordingly

	Example response:

	.. code-block:: json

		{
			"success": true,
			"data": {
				"id": 28,
				"label": "puttis",
				"serial_number": 100000,
				"verification_code": "12345678",
				"type": 0,
				"connected": false,
				"weather_station": false,
				"error": {
					"code": 0,
					"msg": "Messages not in use so far."
				},
				"metadata": []
			}
		}