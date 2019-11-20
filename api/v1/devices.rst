
Devices
########################################

General
****************************************

.. http:get:: /controllers/(int:controller_id)/modules/(int:module_id)

	Retrieves all the modules (devices) registered to this controller - can target a specific (int:module_id) device - gets all if not set

	Here is a list of parameters for the request body - Everything not under the ORIGINAL are device type specific and cannot be given to any other type of device

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
	:>json object humidity: All the humidity data
	:>json float humidity.current: Current measured relative humidity with two decimal accuracy
	:>json object humidity.warning: All the humidity warning limits
	:>json int humidity.warning.min: Limit minimum when humidity warnings are sent
	:>json int humidity.warning.max: Limit maximum when humidity warnings are sent
	:>json object electricity: Electricity data
	:>json object electricity.price: Price data
	:>json string electricity.price.max_effect: Effect of stock electricity prices (should be int or float?)
	:>json int power: Maximum power consumption of heater in wats

	**TYPE2** (General electric)

	:>json object temperature: Temperature data
	:>json float temperature.safety: Target temperature when safety mode is on
	:>json object temperature.floor_sensor: Floor sensor data
	:>json string temperature.floor_sensor.mode: 
		Current floor sensor mode:

		* off
		* installed
		* control_by

	**TYPE4 (ASHP)**

	:>json object temperature: Temperature data
	:>json object temperature.freeze_limit: Freeze limit data
	:>json boolean temperature.freeze_limit.on: Whether or not the freeze limit is in use
	:>json float temperature.freeze_limit.when: What is the limit temperature when the freeze limit is turned 
	:>json ISO-8601 rapid_heat: Rapid heating on ASHP !DEPRECATED!
	:>json string manufacturer:
		Supported ASHP unit manufacturers (31.11.2019):


		* Panasonic
		* Mitsubishi
		* Toshiba
		* Fujitsu
		* LG
		* IVT
		* Hitachi
		* Carrier
		* Onnline
		* Daikin
		* Daitsu
		* Gree
		* Sharp
		* Electrolux
		* Samsung
		* Wilfa
		* Mitsubishi2
		* Mitsubishi3
		* Toshiba2
		* Fujitsu2
		* Midea

	**TYPE5 (Servo controlled radiator valve)**

	:>json object temperature: Temperature data
	:>json float temperature.safety: Target temperature when safety mode is on
	:>json string temperature.floor_sensor.mode:
		Current floor sensor mode - installed, control_by and null:

		* off
		* installed
		* control_by

	**TYPE6 and 7 (Water heater and smart switch - not in production)**

	:>json object switch: Includes parameters for smart switch
	:>json boolean switch.safety: Whether or not the safety is on
	:>json object water_heater: Includes all the parameters for water heaters
	:>json string water_heater.mode: Is the heater in manual or auto mode
	:>json int water_heater.manual_hours: 
	:>json int water_heater.volume: Volume of the heater
	:>json int water_heater.power: Maximum power intake of the heater in wats
	:>json int water_heater.people_count: 
	:>json string water_heater.consumption:
		How high is the water consumption:

		* low
		* medium
		* high

	Example response:

	.. code-block:: json

		{
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

.. http:put:: /controllers/(int:controller_id)/modules/(int:module_id)

	Creates a new device according to parameters - (int:controller_id) and (int:module_id) are required, type can not be set through this method. type is set outside of api. Proper functionality requires type != 0. If physical device is found, controller gets and sets type accordingly

	:<json string label: Label of the device
	:<json int serial number: Serial number for the device
	:<json string verification code: Required verification code for authentication purposes
	:<json boolean weather_station: Whether or not this device is used as a weather station
	:<json object metadata: All the misc. data

	Example request body:

	.. code-block:: json

		{
			"label": "puttis",
			"serial_number": 100000,
			"verification_code": "12345678",
			"weather_station": false,
			"metadata": []
		}
